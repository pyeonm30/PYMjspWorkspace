package member;

import java.util.ArrayList;

public class MemberDAO {

	private ArrayList<Member> list;
	private int log = -1;

	public MemberDAO() {
		list = new ArrayList<Member>();
		init();
	}
	
	public void addMember(String id, String pw, String name, String gender) {
		Member m = new Member(id, pw, name, gender.equals("남성")?true:false );
		list.add(m);
		System.out.println("[회원 추가 완료 ]");
		System.out.println(m);
	}
	
	public int getListCount() {
		return list.size();
	}
	
	public Member getLogMember() {
		return list.get(log);
	}
	
	public Member getOneMember(int idx) {
		return list.get(idx);
	}
	
	public int existsId (String id) {
	   int idx=0;
		for(Member m : list) {
			if(m.getId().equals(id)){
				return idx;
			}
			idx++;
		}
		return -1;
	}
	
	private void init() {
		
		Member m1 = new Member("admin","admin","관리자",true);
		Member m2 = new Member("qwer","1111","홍길동",true);
		Member m3 = new Member("aaaa","2222","개똥이",true);
		Member m4 = new Member("abcd","3333","홍길순",false);
		Member m5 = new Member("test","4444","아이유",false);
		
		list.add(m1);
		list.add(m2);
		list.add(m3);
		list.add(m4);
		list.add(m5);
		
		System.out.println("[데이터 로드 완료]");
		
	}

	public boolean checkLogin(String id ,String pw) {
		
		int idx =0;
		for(Member m : list) {
			if(m.getId().equals(id)&&m.getPw().equals(pw)) {
				log = idx;
				return true;
			}
			idx+=1;
		}
		
		return false;
	}
	
	public boolean deleteLogMember(String pw) {
		if(isValidPw(pw)) {
			list.remove(log);
			log = -1;
			System.out.println("[회원탈퇴 완료 ]");
			return true;
		}
		return false;
	}
	public int getLog() {
		return log;
	}

	public boolean isValidPw(String pw) {
		return list.get(log).getPw().equals(pw);
	}
	
	public void updateOneMember( String name, String gender) {
		
		Member m = list.get(log);
		m.setName(name);
		m.setGender(gender.equals("남성")? true : false);
		System.out.println("[회원 수정 완료 ]");
	}
	
	public Member deleteAMember(int idx) {
		return list.remove(idx);
	}
	
	public void setLog(int log) {
		this.log = log;
	}
	
	
}
