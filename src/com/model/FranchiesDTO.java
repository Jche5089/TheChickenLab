package com.model;

public class FranchiesDTO {
	
	private int frc_num;
	private String mem_id;
	private String frc_add;
	private String mem_tell;
	
	public FranchiesDTO(int frc_num, String mem_id, String frc_add, String mem_tell) {
		super();
		this.frc_num = frc_num;
		this.mem_id = mem_id;
		this.frc_add = frc_add;
		this.mem_tell = mem_tell;
	}

	public int getFrc_num() {
		return frc_num;
	}

	public void setFrc_num(int frc_num) {
		this.frc_num = frc_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getFrc_add() {
		return frc_add;
	}

	public void setFrc_add(String frc_add) {
		this.frc_add = frc_add;
	}

	public String getMem_tell() {
		return mem_tell;
	}

	public void setMem_tell(String mem_tell) {
		this.mem_tell = mem_tell;
	}
	
	
	
	
	
	

	
}
