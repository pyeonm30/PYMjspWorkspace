package board;

import java.util.ArrayList;

public class BoardDAO {
	
	private ArrayList<Board> list;
	private int cnt;
	public BoardDAO(){
		list = new ArrayList<Board>();
		cnt = 1;
		init();
		
		System.out.println("[정보 로드 완료]");
	}
	
	private void init() {
		Board b1 = new Board(cnt++,"작성자1","2024-02-01","제목1","내용1");
		Board b2 = new Board(cnt++,"작성자2","2024-02-01","제목2","내용2");
		Board b3 = new Board(cnt++,"작성자3","2024-02-01","제목3","내용3");
		
		list.add(b1);
		list.add(b2);
		list.add(b3);
		
				
	}
}