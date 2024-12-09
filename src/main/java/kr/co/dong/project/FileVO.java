package kr.co.dong.project;

public class FileVO {
	
	private int file_id;
	private String file_name;
	private String file_path;
	private String file_connection_id;
	
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_connection_id() {
		return file_connection_id;
	}
	public void setFile_connection_id(String file_connection_id) {
		this.file_connection_id = file_connection_id;
	}
	@Override
	public String toString() {
		return "FileVO [file_id=" + file_id + ", file_name=" + file_name + ", file_path=" + file_path
				+ ", file_connection_id=" + file_connection_id + "]";
	}
	
	

}