package global.sesoc.web6.dao;

import global.sesoc.web6.vo.Member;

//memberMapper.xml과 맵핑되는 메서드
public interface MemberMapper {
	
	//회원가입 인터페이스
	public int insert(Member member);
	
	//회원 조회 인터페이스 (1명 / ID)
	public Member select(String id);//memberMapper.xml 실행시킴 / 리턴타입 - 멤버
	
	//정보 수정
	public int update(Member member);
	
}
