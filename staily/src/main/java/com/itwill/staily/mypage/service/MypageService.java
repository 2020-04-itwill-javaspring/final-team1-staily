package com.itwill.staily.mypage.service;

import java.util.List;

import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;

public interface MypageService {
	//멤버 하나 선택
	public Member selectOne(int mNo) throws Exception;
	
	//멤버 삭제
	public boolean deleteMember(int mNo) throws Exception;
	
	//멤버 수정
	public boolean updateMember(Member member) throws Exception;
	
	//멤버 회사 수정
	public boolean updateCompanyNo(Company company) throws Exception;
	
	//멤버 선택 (회사정보포함)
	public Member selectMemberCompany(int mNo) throws Exception;
	
	//내가 쓴글 리스트출력
	public List<Product> selectWriteList(int mNo) throws Exception;
	
	//내가 쓴글 삭제
	public boolean deleteWrite(int pNo) throws Exception;

}