package kr.or.ddit.receive.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.receive.vo.ReceiveVO;
import kr.or.ddit.receive.vo.receivePntVO;

public interface ReceiveService {

	public List<ReceiveVO> getReceivePatient(Map<String, Object> map) throws Exception;
	
	public int getReceivePatientCount(String keyword) throws Exception;
	
	public List<ReceiveVO> getReceiveCommitPatient(Map<String, Object> map) throws Exception;
	
	public int getReceiveCommitPatientCount(String keyword) throws Exception;
	
	public ReceiveVO getPatientRCV(Map<String, Object> map)throws Exception;
	
	public ReceiveVO getPatientRCV2(Map<String, Object> map)throws Exception;
	
	public List<ReceiveVO> getDigRCV(String treatCd)throws Exception;
	
	public List<ReceiveVO> getInspecRCV(String treatCd)throws Exception;

	public List<ReceiveVO> getOperRCV(String treatCd)throws Exception;
	
	public List<ReceiveVO> getInjectRCV(String treatCd)throws Exception;
	
	public int minusRCV(Map<String, Object> map)throws Exception;
	
	public List<ReceiveVO> getPrspRCV(String treatCd) throws Exception;
	
	public List<ReceiveVO> getTreatMemory(String pntCd)throws Exception;
	
	public int updateState7(Map<String, Object> map)throws Exception;
}
