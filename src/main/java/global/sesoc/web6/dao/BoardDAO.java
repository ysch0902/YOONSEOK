package global.sesoc.web6.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web6.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insertBoard(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.insertBoard(board);
		
		return result;
		
	}

	public ArrayList<Board> list() {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList <Board> list = mapper.list();
		return list;
	}
	
	//글 읽기
	public Board selectNum(int num) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.updateHits(num);
		Board m = mapper.selectNum(num);
		return m;
	}
	
	//글 수정
	public int update(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.update(board);
		
		return result;
	}
	
	//글 삭제
	public int delete(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.delete(board);
		
		return result;		
	}

}
