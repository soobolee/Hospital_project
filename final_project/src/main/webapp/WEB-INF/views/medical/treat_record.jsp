<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="messages_box_area1">
					<div class="messages_list">
						<div class="white_box shadow-sm mb-3">
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 class="mb-3">진료기록</h4>
								</div>
							</div>

							<table class="table table-result">
								<tbody>
									<tr>
										<th>진료일</th>
										<td id="treatDt">1997/01/01</td>
										<th>주소</th>
										<td colspan="5" id="pntAddr">서울시 구로구 개봉로55</td>
									</tr>
									<tr>
										<th>이름</th>
										<td id="pntNm">김환자</td>
										<th>주민번호</th>
										<td id="pntPrno">000000-000000</td>
										<th>키</th>
										<td id="height">163</td>
										<th>체중</th>
										<td id="weight">53</td>
									</tr>
									<tr class="border-bottom">
										<th>담당의</th>
										<td id="empNm">김의사</td>
										<th>연락처</th>
										<td id="pntHp">010-1234-5678</td>
										<th>성별</th>
										<td id="sex">여</td>
										<th>연령</th>
										<td id="age">56세</td>
									</tr>
								</tbody>
							</table>

							<div class="px-3">
								<h5>진찰소견</h5>
								<p id="treatOp">진찰소견 내용</p>
							</div>

							<hr>

							<div class="px-3">
								<h5>[처방]</h5>
								<p></p>
							</div>

							<table class="table table-drug mt-4" id="drugTable">
								<colgroup>
									<col width="*">
									<col width="120px">
									<col width="120px">
									<col width="120px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">약품명</th>
										<th scope="col" style="text-align: center;">일일 복용량</th>
										<th scope="col" style="text-align: center;">일회 복용량</th>
										<th scope="col" style="text-align: center;">처방기간</th>
									</tr>
								</thead>
								<tbody id="drugTable">
								</tbody>
							</table>
						</div>

						<div class="text-right mb-5">
							<button class="btn btn-info btn-pill px-5" type="button" data-toggle="modal"
								data-target="#pntImageBackdrop">사진보기</button>
							<button class="btn btn-info btn-pill px-5" type="button"
								onclick="location.href='/medical/main'">돌아가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="loding-center">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
</div>

<!-- 사진 Modal -->
<div class="modal fade" id="pntImageBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
	aria-labelledby="pntImageBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="pntImageBackdropLabel">환자이미지</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body" id="img-list"></div>

			<div class="modal-header">
				<h5 class="modal-title">검사이미지</h5>
			</div>

			<div class="modal-body" id="img-list2"></div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>
	.loding-center {
		width: 100%;
		position: relative;
		z-index: 1;
	}

	.spinner-border {
		display: block;
		position: fixed;
		top: calc(50% - (58px/ 2));
		right: calc(50% - (58px/ 2));
	}

	table.dataTable tbody td {
		padding: 10px;
		font-size: 14px;
		color: #000000;
		font-weight: 300;
	}

	.dataTables_filter input {
		border-width: 1px;
	}

	table.dataTable tbody tr:hover {
		background-color: #eaf2f3 !important;
	}
</style>

</head>

<script>

	/** 함수 주석 양식
	 * 메뉴 항목을 추가한다.
	 * @param {string} id 항목에 대한 고유 식별자
	 * @param {string} url 항목 아이콘
	 * @param {string} title 항목 타이틀
	 * @param {function} callback 실행에 대한 호출 함수
	 * @returns {boolean} 성공 여부
	 */
	$(document).ready(function () {

		$('.spinner-border').hide();
		let treatCd = '${param.treatCd}';
		let pntCd = '${param.pntCd}';
		fnCommonAjax('post', { 'treatCd': treatCd, 'pntCd': pntCd }, '/medical/selectListTreatRecord', fnSelectDetailRecordSucess);

		// 환자사진 목록 조회
		fnSelectListAllCam(treatCd);
	})

	// 환자사진 목록 조회 함수
	const fnSelectListAllCam = (treatCd) => {
		fnCommonAjax('post', { 'treatCd': treatCd, 'fileCls': '환자사진' }, '/medical/selectListCam', fnSelectListCamSuccess1);
		fnCommonAjax('post', { 'treatCd': treatCd, 'fileCls': '검사' }, '/medical/selectListCam', fnSelectListCamSuccess2);
	}

	// 사진 목록 조회 성공 콜백함수
	const fnSelectListCamSuccess1 = (data) => {

		$('#img-list').html("");

		// div 생성
		var result = "";
		var dummys = data.response;

		if (dummys.length > 0) {
			const splitedDummys = [];

			// 7개씩 쪼개기
			for (let i = 0; i < dummys.length; i += 7) {
				splitedDummys.push(dummys.slice(i, i + 7));
			}

			for (let dummys of splitedDummys) {
				const outerDiv = document.createElement("div");
				outerDiv.className = "row mb-3";
				for (let dummy of dummys) {

					const innerDiv = document.createElement("div");
					innerDiv.className = "col col-photo text-center";

					const innerBtn = document.createElement("button");
					innerBtn.className = "close img-close";
					innerBtn.dataset.fileNo = dummy.fileNo;

					const innerSpan = document.createElement("span");
					innerSpan.className = "text-danger";
					innerSpan.ariaHidden = "true";
					innerSpan.innerText = "×";

					innerBtn.appendChild(innerSpan);

					const innerImg = document.createElement("img");
					innerImg.className = "rounded img-fluid";
					innerImg.dataset.fileNo = dummy.fileNo;
					innerImg.src = dummy.base64img;

					const innerP = document.createElement("p");
					innerP.innerText = dummy.fileNm;

					innerDiv.appendChild(innerBtn);
					innerDiv.appendChild(innerImg);
					innerDiv.appendChild(innerP);
					outerDiv.appendChild(innerDiv);
				}
				result += outerDiv.outerHTML; // innerHTML은 자신을 기준으로 부모 안 나옴, outerHTML은 자신을 기준으로 부모 포함 다 나옴
			}
		} else {
			result += '<div>사진이 없습니다.</div>';
		}
		$('#img-list').html(result);

	}

	// 검사사진 목록 조회 성공 콜백함수
	const fnSelectListCamSuccess2 = (data) => {

		$('#img-list2').html("");

		// div 생성
		var result = "";
		var dummys = data.response;

		if (dummys.length > 0) {
			const splitedDummys = [];

			// 7개씩 쪼개기
			for (let i = 0; i < dummys.length; i += 7) {
				splitedDummys.push(dummys.slice(i, i + 7));
			}

			for (let dummys of splitedDummys) {
				const outerDiv = document.createElement("div");
				outerDiv.className = "row mb-3";
				for (let dummy of dummys) {

					const innerDiv = document.createElement("div");
					innerDiv.className = "col col-photo text-center";

					const innerBtn = document.createElement("button");
					innerBtn.className = "close img-close";
					innerBtn.dataset.fileNo = dummy.fileNo;

					const innerSpan = document.createElement("span");
					innerSpan.className = "text-danger";
					innerSpan.ariaHidden = "true";
					innerSpan.innerText = "×";

					innerBtn.appendChild(innerSpan);

					const innerImg = document.createElement("img");
					innerImg.className = "rounded img-fluid";
					innerImg.dataset.fileNo = dummy.fileNo;
					innerImg.src = dummy.base64img;

					const innerP = document.createElement("p");
					innerP.innerText = dummy.fileNm;

					innerDiv.appendChild(innerBtn);
					innerDiv.appendChild(innerImg);
					innerDiv.appendChild(innerP);
					outerDiv.appendChild(innerDiv);
				}
				result += outerDiv.outerHTML; // innerHTML은 자신을 기준으로 부모 안 나옴, outerHTML은 자신을 기준으로 부모 포함 다 나옴
			}
		} else {
			result += '<div>사진이 없습니다.</div>';
		}
		$('#img-list2').html(result);

	}

	// 진료 기록 조회 성공 콜백 함수
	const fnSelectDetailRecordSucess = (data) => {

		if (data.response != null) {

			console.log('data.response');
			console.log(data.response);

			let _obj = data.response[0]
			console.log('_obj');
			console.log(_obj);

			// Object의 key만큼 배열을 반복한다.
			for (let i in Object.keys(_obj)) {
				var _id = Object.keys(_obj)[i];
				var _text = _obj[Object.keys(_obj)[i]];
				$('#' + _id).text(_text);
			}

			let _drugList = _obj.prescription;

			_drugList.forEach(function (v, i) {
				console.log(v)
				$("#drugTable tbody").append('<tr><td>' + fnNullChange(v.drugNm) + '</td><td>' + fnNullChange(v.drugDoes) + '</td><td>' + fnNullChange(v.drugTimes) + '</td><td>' + fnNullChange(v.prspTerm) + '</td></tr>');
			});
		};
	}

	// 특정 필드가 null인 경우 공백으로 대체 함수
	const fnNullChange = (str) => {
		return str == null || str == "" || str == "undefined" || str == undefined || str == "null" ? "" : str;
	}

	/**
	* ajax 공통호출 함수
	* @param {string} 통신 method 타입
	* @param {string} 서버로 전송하는 request 데이터
	* @param {string} request 호출 주소
	* @param {function} successFn 성공 콜백함수
	*/
	const fnCommonAjax = (type, data, url, successFn) => {
		// 로딩바 보이기
		$('.spinner-border').show();
		$.ajax({
			'type': type
			, 'data': data
			, 'url': url
			, beforeSend: function (jqXHR, settings) {
				// ajax 사용시 헤더에 스프링시큐리티 토큰 설정
				var token = '${_csrf.token}'
				var header = '${_csrf.headerName}'
				jqXHR.setRequestHeader(header, token);
			}
			, success: successFn
		})

		.done((data) => {
			// 로딩바 숨기기
			$('.spinner-border').hide();
		})

		.fail((data) => {
			swal("", "통신에러 발생", "error");
			$('.spinner-border').hide();
		});
	}

</script>

<div class="footer_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="footer_iner text-center">
					<p>2020 © Influence - Designed by<a href="#"><i class="ti-heart"></i></a>
						<a href="#"> Dashboard</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>