package com.model;

public class MemberDTO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private int mem_dob;
	private String mem_add;
	private String mem_tell;
	private String mem_gender;
	private String mem_grade;
	
	
	public MemberDTO(String mem_id, String mem_pw, String mem_name, int mem_dob, String mem_add, String mem_tell,
			String mem_gender, String mem_grade) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_dob = mem_dob;
		this.mem_add = mem_add;
		this.mem_tell = mem_tell;
		this.mem_gender = mem_gender;
		this.mem_grade = mem_grade;
	}
	
	

	public MemberDTO(String mem_id, String mem_pw, String mem_name, int mem_dob, String mem_add, String mem_tell,
			String mem_gender) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_dob = mem_dob;
		this.mem_add = mem_add;
		this.mem_tell = mem_tell;
		this.mem_gender = mem_gender;
	}

	

	public MemberDTO(String mem_id, String mem_pw, String mem_add, String mem_tell) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_add = mem_add;
		this.mem_tell = mem_tell;
	}

	
	  public MemberDTO(String mem_grade, String mem_id, int empty) {
	      super();
	      this.mem_grade = mem_grade;
	      this.mem_id = mem_id;
	   
	   }

	
	

	public MemberDTO(String mem_id, String mem_pw, String mem_grade) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_grade = mem_grade;
	}







	public MemberDTO(String mem_id, String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		
	}

	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public int getMem_dob() {
		return mem_dob;
	}


	public void setMem_dob(int mem_dob) {
		this.mem_dob = mem_dob;
	}


	public String getMem_add() {
		return mem_add;
	}


	public void setMem_add(String mem_add) {
		this.mem_add = mem_add;
	}


	public String getMem_tell() {
		return mem_tell;
	}


	public void setMem_tell(String mem_tell) {
		this.mem_tell = mem_tell;
	}


	public String getMem_gender() {
		return mem_gender;
	}


	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}


	public String getMem_grade() {
		return mem_grade;
	}


	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	
	
	
	
}
