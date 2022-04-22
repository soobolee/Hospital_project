<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="/resources/hospital/vendors/chartjs/chartjs_init.js"></script>
<script src="/resources/hospital/js/chart.min.js"></script>
<script src="/resources/hospital/js/custom.js"></script>
<script src="/resources/hospital/js/active_chart.js"></script>
<!-- <script src="/resources/vendors/apex_chart/bar_active_1.js"></script> -->
<!-- <script src="/resources/vendors/apex_chart/apex_chart_list.js"></script> -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link href='/resources/css/main.css' rel='stylesheet' />
<style>
.pntlbl {
	width: 50px;
	margin-right: 5px;
	text-align: center;
}

.table-cell {
	text-align: center;
}

.mb-4::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>



<div class="col-lg-12 col-xl-12">
	<div class="white_box mb_30" style="overflow:auto">
		<div class="box_header border_bottom_1px  ">
			<div class="main-title">
				<h3 class="mb_25">수술 환자 정보</h3>
			</div>
		</div>
		<div>
			<!--------------------------------------------- 환자 기본 정보 표시 시작------------------------------------------->
			<div class="col-lg-3" style="display: inline-block; float:left">
				<div class="card card-small mb-4">

					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="row">
								<div class="col">

									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="feFirstName" class="pntLbl">이름 :</label><input type="text" value="${pntInfo.pntNm }" style="width: 100px" />

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="feLastName" class="pntLbl">나이 :</label><input type="text" value="${pntInfo.age }" style="width: 100px" />

										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="feEmailAddress" class="pntLbl">성별 :</label><input type="text" value="${pntInfo.pntSex }" style="width: 100px" />
										</div>
									</div>
									<div class="form-row">
										<div class="form-group" style="display: table-cell">
											<label for="feheight" class="pntLbl">키 :</label><input type="text" value="${pntInfo.height }" style="width: 100px" />
										</div>
									</div>
									<div class="form-row">
										<div class="form-group">
											<label for="feweight" class="pntLbl">체중 :</label><input type="text" value="${pntInfo.weight }" style="width: 100px" />
										</div>
									</div>
									<div class="form-row">
										<div class="form-group">
											<c:if test="${pntInfo.smoking eq 'Y' }">
												<label>음주여부<input type="checkbox" value="음주여부" checked onclick="return false" /></label>&nbsp;&nbsp;&nbsp;
                              				</c:if>
											<c:if test="${pntInfo.smoking eq 'N' }">
												<label>음주여부<input type="checkbox" value="음주여부" readonly="readonly" /></label>&nbsp;&nbsp;&nbsp;
                              				</c:if>
											<c:if test="${pntInfo.drinking eq 'Y' }">
												<label>흡연여부</label>
												<input type="checkbox" value="흡연여부" checked onclick="return false" />&nbsp;&nbsp;&nbsp;
                              				</c:if>
											<c:if test="${pntInfo.drinking eq 'N' }">
												<label>흡연여부</label>
												<input type="checkbox" value="흡연여부" onclick="return false" />&nbsp;&nbsp;&nbsp;
                             				</c:if>

											<c:if test="${pntInfo.pntSex eq 'F'}">
												<c:if test="${pntInfo.pregnancy eq 'Y'}">
													<label>임신여부</label>
													<input type="checkbox" value="임신여부" checked onclick="return false" />&nbsp;&nbsp;&nbsp;
                              					</c:if>
												<c:if test="${pntInfo.pregnancy eq 'N'}">
													<label>임신여부</label>
													<input type="checkbox" value="임신여부" onclick="return false" />&nbsp;&nbsp;&nbsp;
                              					</c:if>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="card card-small mb-4" style="overflow:scroll">
					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="row">
								<div class="col">
									<div class="form-row">
										
											<div class="table" style="display: table;">
													<div class="table-row" style="display: table-row;">
														<div class="table-cell" style="display: table-cell; width: 20%;">부서</div>
														<div class="table-cell" style="display: table-cell; width: 20%;">과</div>
														<div class="table-cell" style="display: table-cell; width: 50%;">의료진 명</div>
													</div>
												<c:forEach var="operDetailVO" items="${operTeam}">
												<div class="table-row" style="display: table-row;">
													<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.deptNm}</div>
													<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.secNm}</div>
													<div class="table-cell" style="display: table-cell; width: 50%;">${operDetailVO.empNm}</div>
												</div>
												</c:forEach>
											
										</div>
								</div>
							</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-----------------------------------------------------환자 기본 정보 표시 끝---------------------------------------------------->
			<div class="col-lg-3" style="display: inline-block; float:left">
				<div class="card card-small mb-4" style="overflow:scroll">
					
					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="row">
								<div class="col">
									<div class="form-row">
										
											<div class="table" style="display: table;">
													<div class="table-row" style="display: table-row;">
														<div class="table-cell" style="display: table-cell; width: 25%;">검사 종류</div>
														<div class="table-cell" style="display: table-cell; width: 75%;">검사 일시</div>
													</div>
												<c:forEach var="operDetailVO" items="${operIns}">
												<div class="table-row" style="display: table-row;">
													<div class="table-cell" style="display: table-cell; width: 25%;">${operDetailVO.sgNm}</div>
													<c:set var="inspDt" value="${operDetailVO.inspDt}"/>
													<div class="table-cell" style="display: table-cell; width: 75%;">${fn:substring(inspDt,0,4)}-${fn:substring(inspDt,4,6)}-${fn:substring(inspDt,6,8)} ${fn:substring(inspDt,8,10)}:${fn:substring(inspDt,10,12)}:${fn:substring(inspDt,12,14)}</div>
												</div>
											</c:forEach>
										</div>
								</div>
							</div>
							</div>
						</li>
					</ul>
				</div>
				
				<div class="card card-small mb-4" style="overflow:scroll">
					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="table" style="display: table;">
								<div class="table-row" style="display: table-row;">
									<div class="table-cell" style="display: table-cell; width: 60%;">의약품 명</div>
<!-- 									<div class="table-cell" style="display: table-cell; width: 20%;">투약량</div> -->
									<div class="table-cell" style="display: table-cell; width: 40%;">투약 날짜</div>
								</div>
								<c:forEach var="operDetailVO" items="${operPntInj}">
									<div class="table-row" style="display: table-row;">
										<div class="table-cell" style="display: table-cell; width: 60%;">${operDetailVO.drugNm}</div>
<%-- 										<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.dosage}</div> --%>
										<c:set var="injDt" value="${operDetailVO.injDt }"/>
<%-- 										<div class="table-cell" style="display: table-cell; width: 60%;">${operDetailVO.injDt}</div> --%>
										<div class="table-cell" style="display: table-cell; width: 40%;">${fn:substring(injDt,0,4)}-${fn:substring(injDt,4,6)}-${fn:substring(injDt,6,8)} ${fn:substring(injDt,8,10)}:${fn:substring(injDt,10,12)}</div>
									</div>
								</c:forEach>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-----------------------------------------------------환자 바이탈 사인 표시 시작------------------------------------------------->
			<div class="col-lg-6" style="display: inline-block; float:right;">
				<div class="card card-medium mb-4">
					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="table" style="display: table;">
								<div class="table-row" style="display: table-row;">
									<div class="table-cell" style="display: table-cell; width: 20%;">측정 일시</div>
									<div class="table-cell" style="display: table-cell; width: 20%;">최고 혈압</div>
									<div class="table-cell" style="display: table-cell; width: 20%;">최저 혈압</div>
									<div class="table-cell" style="display: table-cell; width: 20%;">체온</div>
									<div class="table-cell" style="display: table-cell; width: 20%;">혈당</div>
								</div>
								<c:forEach var="operDetailVO" items="${operPntVS}">
									<div class="table-row" style="display: table-row;">
										<c:set var="vsDt" value="${operDetailVO.vsDt}"/>
										<div class="table-cell" style="display: table-cell; width: 20%;">${fn:substring(vsDt,0,4)}-${fn:substring(vsDt,4,6)}-${fn:substring(vsDt,6,8)} ${fn:substring(vsDt,8,10)}:${fn:substring(vsDt,10,12)}:${fn:substring(vsDt,12,14)}</div>
										<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.vsBpMax }</div>
										<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.vsBpMin }</div>
										<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.vsTmp }</div>
										<div class="table-cell" style="display: table-cell; width: 20%;">${operDetailVO.vsBs }</div>
									</div>
								</c:forEach>
							</div>
						</li>
					</ul>
					<ul class="list-group list-group-flush">
						<li class="list-group-item p-3">
							<div class="table" style="display: table;">
								<canvas style="height: 100px" id="sales-chart"></canvas>
							</div>
						</li>
					</ul>
				</div>
				
			</div>
			<!-----------------------------------------------------환자 바이탈 사인 표시 끝------------------------------------------------->
			
		</div>
	</div>
</div>

<script type="text/javascript" defer="defer">
var labelsSet = [];
var tmp=[];
var bpMax=[];
var bpMin=[];
var bs = [];
var vsDt = "";
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");
var data = {};
	(function($) {
			"use strict";
		
			const ctx = document.getElementById("sales-chart").getContext('2d');
		
			const gradientStroke1 = ctx.createLinearGradient(500, 0, 100, 0);
			gradientStroke1.addColorStop(0, "#FFE400");
			gradientStroke1.addColorStop(1, "#FFE400");
		
			const gradientStroke2 = ctx.createLinearGradient(500, 0, 100, 0);
			gradientStroke2.addColorStop(0, "#FF0000");
			gradientStroke2.addColorStop(1, "#FF0000");
		
			const gradientStroke3 = ctx.createLinearGradient(500, 0, 100, 0);
			gradientStroke3.addColorStop(0, "#00D8FF");
			gradientStroke3.addColorStop(1, "#00D8FF");
		
			const gradientStroke4 = ctx.createLinearGradient(500, 0, 100, 0);
			gradientStroke4.addColorStop(0, "#47C83E");
			gradientStroke4.addColorStop(1, "#47C83E");
			
			data[csrfParameter]=csrfToken;
			data["pntCd"]="${pntInfo.pntCd}";
				// 		ctx.height = 100;
			
		$.ajax({
			type : 'post',
			dataType : 'json',
			data : data,
			url : '/operation/graph',
			async : false,
			success : function(data) {
				console.log("data", data)
				
				$.each(data, function(i, v) {
					console.log("i>>>",i)
					vsDt = (v.vsDt).substring(4,6) +"-" +(v.vsDt).substring(6,8)
					labelsSet.push(vsDt)
					tmp.push(v.vsTmp)
					bpMax.push(v.vsBpMax)
					bpMin.push(v.vsBpMin)
					bs.push(v.vsBs)
					
				})

				new Chart(ctx, {
					type : 'line',
					data : {
						labels : labelsSet,
						type : 'line',
						defaultFontFamily : 'Poppins',
						datasets : [ {
							label : "체온",
							data : tmp,
							backgroundColor : 'transparent',
							borderColor : gradientStroke1,
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : gradientStroke1,

						}, {
							label : "최고혈압",
							data : bpMax,
							backgroundColor : 'transparent',
							borderColor : gradientStroke2,
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : gradientStroke2,
						}, {
							label : "최저혈압",
							data : bpMin,
							backgroundColor : 'transparent',
							borderColor : gradientStroke3,
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : gradientStroke3,
						}, {
							label : "혈당",
							data : bs,
							backgroundColor : 'transparent',
							borderColor : gradientStroke4,
							borderWidth : 3,
							pointStyle : 'circle',
							pointRadius : 5,
							pointBorderColor : 'transparent',
							pointBackgroundColor : gradientStroke4,
						} ]
					},
					options : {
						responsive : true,

						tooltips : {
							mode : 'index',
							titleFontSize : 12,
							titleFontColor : '#000',
							bodyFontColor : '#000',
							backgroundColor : '#fff',
							titleFontFamily : 'Montserrat',
							bodyFontFamily : 'Montserrat',
							cornerRadius : 3,
							intersect : false,
						},
						legend : {
							labels : {
								usePointStyle : true,
								fontFamily : 'Montserrat',
							},
						},
						scales : {
							xAxes : [ {
								display : true,
								gridLines : {
									display : false,
									drawBorder : false
								},
								scaleLabel : {
									display : false,
									labelString : 'Month'
								}
							} ],
							yAxes : [ {
								display : true,
								gridLines : {
									display : false,
									drawBorder : false
								},
								scaleLabel : {
									display : true,
									labelString : 'Value'
								},
								ticks : {
									max : 200,
									min : 0,
									stepSize : 20
								}
							} ]
						},
						title : {
							display : false,
							text : 'Normal Legend'
						}
					}
				});
			}
		})
	})(jQuery);
</script>

