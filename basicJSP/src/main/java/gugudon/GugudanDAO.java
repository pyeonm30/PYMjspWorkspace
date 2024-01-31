package gugudon;

import java.util.ArrayList;
import java.util.Random;

public class GugudanDAO {

	public int count;
	public int score;
	
	ArrayList<GugudanVO> quiz;
	
	public GugudanDAO(){
		quiz = new ArrayList<GugudanVO>();
		makeQuiz();
	}
	
	private void makeQuiz() {
		Random rd = new Random();

		for(int i =0; i < 5; i+=1) {
			GugudanVO vo = new GugudanVO(rd.nextInt(8)+2,rd.nextInt(9)+1);
			quiz.add(vo);
		}
	}
	
	public boolean checkAnswer() {
		System.out.println("test");
		return true;
	}
	
	public String getQuiz() {
		return quiz.get(count).toString();
	}
	
}