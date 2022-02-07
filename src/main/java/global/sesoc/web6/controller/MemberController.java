package global.sesoc.web6.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.MemberDAO;
import global.sesoc.web6.vo.Member;

@Controller
@RequestMapping("member")//요청 경로가 member/ 인 것만 실행
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	MemberDAO dao;
	
	/**
	 * 회원가입 폼으로 이동
	 */
	@RequestMapping(value = "join", method = RequestMethod.GET)//폼에 내용을 보여줌
	public String join() {
		return "memberjsp/joinForm";		
	}
	
	/**
	 * 회원가입 폼에서 입력한 정보를 저장 = 회원가입 처리
	 * @param member 사용자가 가입폼에 입력한 내용
	 * @return 홈화면으로 이동
	 */
	@RequestMapping(value = "join", method = RequestMethod.POST)//폼에 내용을 입력하고 보여줌
	public String join(Member member) {
		logger.debug("가입폼에서 전달된 값{}", member);
		dao.insert(member);
		return "redirect:/";		
	}
	
	/**
	 * 로그인 폼으로 이동
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)//폼에 내용을 보여줌
	public String login() {
		return "memberjsp/loginForm";		
	}
	
	/**
	 * 로그인 폼에서 입력한 ID와 비밀번호를 검증하고 로그인 처리
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)//폼에 내용을 보여줌
	public String login(Member member, HttpSession session) {
		//전달된 ID로 회원정보 검색
		Member resultMember = dao.select(member.getId());
		//전달된 비밀번호와 DB에서 검색한 비밀번호를 비교
		if (resultMember != null && resultMember.getPassword().equals(member.getPassword())) {
			//ID와 비밀번호가 맞으면 세션에 ID와 이름을 저장하고 메인화면으로 리다이렉트
			session.setAttribute("loginId", resultMember.getId());
			session.setAttribute("loginName", resultMember.getName());
			return "redirect:/";
		}
		else {
			//틀리면 로그인폼으로 포워딩
			return "memberjsp/loginForm";
			
		}
			
	}
	
	/**
	 * 로그아웃 폼으로 이동
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)//폼에 내용을 보여줌
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
		return "redirect:/";		
	}
	
	/**
	 * 아이디 중복확인 폼
	 */
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)//폼에 내용을 보여줌
	public String idcheck() {
		
		return "memberjsp/idcheck";		
	}
	
	/**
	 * 아이디 검색
	 */
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)//폼에 내용을 입력하고 검색버튼 눌렀을 때
	public String idcheck(String searchId, Model model) {//Model - 컨트롤러에서 jsp로 포워딩 할 때 값을 전달하는 역할
		Member member = dao.select(searchId);
		model.addAttribute("searchId", searchId);
		model.addAttribute("member", member);
		return "memberjsp/idcheck";		
	}
	
	/**
	 * 개인정보 수정 폼으로 이동
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)//폼에 내용을 보여줌
	public String update(HttpSession session, Model model) {
		
		//세션의 아이디를 읽어서 DB에서 개인정보를 검색
		String id = (String) session.getAttribute("loginId");
		Member member = dao.select(id);
		//개인정보를 모델에 저장
		model.addAttribute("member", member);
		return "memberjsp/updateForm";		
	}
	
	/**
	 * 사용자가 입력한 내용을 DB테이블에 변경
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)//폼에 내용을 보여줌
	public String update(Member member, HttpSession session) {
		logger.debug("수정폼에서 전달된 값{}", member);
		String id = (String) session.getAttribute("loginId");
		member.setId(id);
		dao.update(member);
		return "redirect:/";		
	}

}
