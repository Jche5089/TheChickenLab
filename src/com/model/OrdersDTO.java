package com.model;

public class OrdersDTO {
	
	private int frc_num;
	private int art_id;
	private int order_count;
	private int total_price;
	
	
	public OrdersDTO(int frc_num, int art_id, int order_count, int total_price) {
		this.frc_num = frc_num;
		this.art_id = art_id;
		this.order_count = order_count;
		this.total_price = total_price;
	}


	public int getFrc_num() {
		return frc_num;
	}


	public void setFrc_num(int frc_num) {
		this.frc_num = frc_num;
	}


	public int getArt_id() {
		return art_id;
	}


	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}



	public int getTotal_price() {
		return total_price;
	}


	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}


	public int getOrder_count() {
		return order_count;
	}


	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	
	
	
	
}
