package com.project.board.users.dto;

public class UsersDto {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String gender;
	private String phone;
	private String isAdmin;
	private String regdate;
	private int	getBoardCount;
	
	
	public UsersDto(){}


	public UsersDto(String id, String name, String pwd, String email, String gender, String phone, String isAdmin,
			String regdate, int getBoardCount) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.isAdmin = isAdmin;
		this.regdate = regdate;
		this.getBoardCount = getBoardCount;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getIsAdmin() {
		return isAdmin;
	}


	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getGetBoardCount() {
		return getBoardCount;
	}


	public void setGetBoardCount(int getBoardCount) {
		this.getBoardCount = getBoardCount;
	}

	
	
}