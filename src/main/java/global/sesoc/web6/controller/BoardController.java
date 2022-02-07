package global.sesoc.web6.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.BoardDAO;
import global.sesoc.web6.vo.Board;

@Controller
@RequestMapping("board")//요청 경로가 board/ 인 것만 실행
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	BoardDAO dao;
	
	//메인화면에서 "게시판" 클릭하면 게시글 목록이 출력되는 페이지로 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {
		ArrayList<Board> list = dao.list();
		logger.debug("DB에서 가져온 목록", list);
		model.addAttribute("list", list);
		return "boardjsp/list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		
		return "boardjsp/write";
	}
	
	//글 저장
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		logger.debug("가입폼에서 전달된 값{}", id);
		board.setId(id);
		dao.insertBoard(board);
		
		return "redirect:/board/list";
	}
	
	//글 1개 읽기
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int num, Model model) {
		//DB에서  글 1개를 읽어 모델에 저장하고 read.jsp로 포워딩

		Board board = dao.selectNum(num);
		model.addAttribute("board", board);
		return "boardjsp/read";
	}
	
	//글 수정 폼으로 이동(16시 5분)
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(int num, Model model) {
		//전달받은 글번호(num)으로 DB조회 후 해당 글 정보를 모델에 저장하고 jsp로 포워딩
		Board board = dao.selectNum(num);
		model.addAttribute("board", board);
		return "boardjsp/update";		
	}
	
	//글 수정폼에 입력한 값을 전달받아 DB 갱신
		@RequestMapping(value = "update", method = RequestMethod.POST)
		public String update(Board board, HttpSession session) {
			//로그인한 ㄴ사용자가 본인글만 수정하도록 수정조건을 
			String id = (String) session.getAttribute("loginId");
			board.setId(id);
			dao.update(board);
			
			return "redirect:/board/list";		
		}
		
		//글 삭제
		@RequestMapping(value = "delete", method = RequestMethod.GET)
		public String delete(Board board, HttpSession session) {

			String id = (String) session.getAttribute("loginId");
			board.setId(id);
			dao.delete(board);
			
			return "redirect:/board/list";		
		}		

}
