package com.model;

public class AnalysisDTO {
	private String haengjeongdong;
	private String haengjeonggu;
	private int quarter;
	private int SalesAmount;
	private int MonSales;
	private int TueSales;
	private int WenSales;
	private int ThrSales;
	private int FriSalse;
	private int SatSales;
	private int SunSales;
	private int MaleSales;
	private int FeSalesSales;
	private int age20Sales;
	private int age40Sales;
	private int age60Sales;
	private int id;
	
	public AnalysisDTO(int id, String haengjeongdong, int quarter, int salesAmount) {
		super();
		this.id = id;
		this.haengjeongdong = haengjeongdong;
		this.quarter = quarter;
		this.SalesAmount = salesAmount;
	}

	public AnalysisDTO(String haengjeongdong) {
		this.haengjeongdong = haengjeongdong;
	}

	public AnalysisDTO(String haengjeongdong, String haengjeonggu, int salesAmount, int monSales,
			int tueSales, int wenSales, int thrSales, int friSalse, int satSales, int sunSales, int maleSales,
			int feSalesSales, int age20Sales, int age40Sales, int age60Sales) {

		this.haengjeongdong = haengjeongdong;
		this.haengjeonggu = haengjeonggu;
		this.SalesAmount = salesAmount;
		this.MonSales = monSales;
		this.TueSales = tueSales;
		this.WenSales = wenSales;
		this.ThrSales = thrSales;
		this.FriSalse = friSalse;
		this.SatSales = satSales;
		this.SunSales = sunSales;
		this.MaleSales = maleSales;
		this.FeSalesSales = feSalesSales;
		this.age20Sales = age20Sales;
		this.age40Sales = age40Sales;
		this.age60Sales = age60Sales;
	}

	public String getHaengjeongdong() {
		return haengjeongdong;
	}

	public void setHaengjeongdong(String haengjeongdong) {
		this.haengjeongdong = haengjeongdong;
	}

	public String getHaengjeonggu() {
		return haengjeonggu;
	}

	public void setHaengjeonggu(String haengjeonggu) {
		this.haengjeonggu = haengjeonggu;
	}

	public int getQuarter() {
		return quarter;
	}

	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}

	public int getSalesAmount() {
		return SalesAmount;
	}

	public void setSalesAmount(int salesAmount) {
		SalesAmount = salesAmount;
	}

	public int getMonSales() {
		return MonSales;
	}

	public void setMonSales(int monSales) {
		MonSales = monSales;
	}

	public int getTueSales() {
		return TueSales;
	}

	public void setTueSales(int tueSales) {
		TueSales = tueSales;
	}

	public int getWenSales() {
		return WenSales;
	}

	public void setWenSales(int wenSales) {
		WenSales = wenSales;
	}

	public int getThrSales() {
		return ThrSales;
	}

	public void setThrSales(int thrSales) {
		ThrSales = thrSales;
	}

	public int getFriSalse() {
		return FriSalse;
	}

	public void setFriSalse(int friSalse) {
		FriSalse = friSalse;
	}

	public int getSatSales() {
		return SatSales;
	}

	public void setSatSales(int satSales) {
		SatSales = satSales;
	}

	public int getSunSales() {
		return SunSales;
	}

	public void setSunSales(int sunSales) {
		SunSales = sunSales;
	}

	public int getMaleSales() {
		return MaleSales;
	}

	public void setMaleSales(int maleSales) {
		MaleSales = maleSales;
	}

	public int getFeSalesSales() {
		return FeSalesSales;
	}

	public void setFeSalesSales(int feSalesSales) {
		FeSalesSales = feSalesSales;
	}

	public int getAge20Sales() {
		return age20Sales;
	}

	public void setAge20Sales(int age20Sales) {
		this.age20Sales = age20Sales;
	}

	public int getAge40Sales() {
		return age40Sales;
	}

	public void setAge40Sales(int age40Sales) {
		this.age40Sales = age40Sales;
	}

	public int getAge60Sales() {
		return age60Sales;
	}

	public void setAge60Sales(int age60Sales) {
		this.age60Sales = age60Sales;
	}

	
}
