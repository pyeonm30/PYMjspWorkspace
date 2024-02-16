package test;

public class MyFile {
	private String ofileName;
	private String sfileName;	// 파일 이름
	private long fileSize;		// 파일 크기
	public String getOfileName() {
		return ofileName;
	}
	public void setOfileName(String ofileName) {
		this.ofileName = ofileName;
	}
	public String getSfileName() {
		return sfileName;
	}
	public void setSfileName(String sfileName) {
		this.sfileName = sfileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "MyFile [ofileName=" + ofileName + ", sfileName=" + sfileName + ", fileSize=" + fileSize + "]";
	}
	

	
}

