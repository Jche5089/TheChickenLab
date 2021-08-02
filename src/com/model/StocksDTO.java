package com.model;

public class StocksDTO {
	
	private int frc_num;
	private int art_id;
	private String art_name;
	private int art_price;
	private int art_stock;
	
	
	
	public StocksDTO(int frc_num, int art_id, String art_name, int art_price, int art_stock ) {
		super();
		this.frc_num = frc_num;
		this.art_id = art_id;
		this.art_name = art_name;
		this.art_price = art_price;
		this.art_stock = art_stock;
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



	public String getArt_name() {
		return art_name;
	}



	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}



	public int getArt_price() {
		return art_price;
	}



	public void setArt_price(int art_price) {
		this.art_price = art_price;
	}



	public int getArt_stock() {
		return art_stock;
	}



	public void setArt_stock(int art_stock) {
		this.art_stock = art_stock;
	}



	
	
	
	
	
}
