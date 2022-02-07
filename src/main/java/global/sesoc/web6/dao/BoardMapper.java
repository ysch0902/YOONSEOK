package global.sesoc.web6.dao;

import java.util.ArrayList;

import global.sesoc.web6.vo.Board;

public interface BoardMapper {

	public int insertBoard(Board board);

	public ArrayList<Board> list();

	public Board selectNum(int num);
	
	//글 수정
	public int update(Board board);
	
	//글 삭제
	public int delete(Board board);
	
	//조회수 1증가
	public int updateHits(int num);
	
	//update, insert, delete 무조건 int

}
