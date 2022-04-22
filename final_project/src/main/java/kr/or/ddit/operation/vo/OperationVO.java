package kr.or.ddit.operation.vo;

import java.sql.Clob;
import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.CLOB;

@Repository
@Getter
@Setter
@ToString
public class OperationVO {

	//OPERATION TABLE
	
	private String operCd;
	private int opRoomNo;
	private String opRoomState;
	
	private String operYmd;
	private String operBgnTm;
	private String operEndTm;
	
	private String operNm;
	private String treatCd;
	private List<OpcVO> opcList;
	private String opcCd;
	private int opcNo;
	private String operIng;
	//OPER_PROC TABLE
	private String opcNm;
	//PATIENT TABLE
	private String pntCd;
	private String pntNm;
	private String chrDr;
	
	//EMP TABLE
	private String empCd;
	private String empNm;
	
	private int operRecYn;
	private int digCls;
	private String disNm;
	
	private String prtcrNm;
	private int pntAge;
	private String pntSex;
	private String secNm;
	
	public String operRecImg;
}
