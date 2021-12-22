package kr.or.ddit.common.facilities.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.facilities.dao.FacilityDAO;
import kr.or.ddit.vo.FacilityVO;
import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ReservationVO;

public interface FacilityService {
	
		
		//시설 예약 현황 조회
		public List<ReservationVO> reservationList(PagingVO<ReservationVO> pagingVO);
		
		//시설 예약 현황 수정
		public int updateReservation(ReservationVO reservation);
		
		//시설 예약 현황 삭제
		public int deleteReservation(String resNo);
		
		//시설 예약
		public int insertReservation(ReservationVO reservation);
		
		//예약 상세
		public ReservationVO reservationDetail(String resNo);
		
}
