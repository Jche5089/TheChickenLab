package com.model;

public class QuestionDTO {
	private int que_num;
	private String user_id;//
	private String location;//
	private String que_arc;
	private String question;
	private String user_tell;//
	
	public QuestionDTO(int que_num, String user_id, String location, String que_arc, String question, String user_tell) {
		super();
		this.que_num = que_num;
		this.user_id = user_id;
		this.location = location;
		this.que_arc = que_arc;
		this.question = question;
		this.user_tell=user_tell;
	}
	
	
	
	public QuestionDTO(String user_id, String location, String que_arc, String question, String user_tell) {
		super();
		this.user_id = user_id;
		this.location = location;
		this.que_arc = que_arc;
		this.question = question;
		this.user_tell=user_tell;
	}

	

	public QuestionDTO(String user_id, String location, String user_tell) {
		super();
		this.user_id = user_id;
		this.location = location;
		this.user_tell = user_tell;
	}



	public int getQue_num() {
		return que_num;
	}



	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getQue_arc() {
		return que_arc;
	}



	public void setQue_arc(String que_arc) {
		this.que_arc = que_arc;
	}



	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}



	public String getUser_tell() {
		return user_tell;
	}



	public void setUser_tell(String user_tell) {
		this.user_tell = user_tell;
	}

	


	

}
