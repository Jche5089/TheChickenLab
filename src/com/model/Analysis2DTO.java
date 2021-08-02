package com.model;

public class Analysis2DTO {
	private String haengjeongdong;
	private String haengjeonggu;
	private int chickenNum;        
	private int bistroNum;      
    private int facilityNum;
    private int istroPm; 
    private int facilityPm;
  
    
    private int bungi;
    private int rentPm;
    private int gagusu;
    private int gagusPm;
 
      


	public Analysis2DTO(String haengjeongdong, String haengjeonggu, int bungi, int rentPm, int gagusu, int gagusPm) {
		super();
		this.haengjeongdong = haengjeongdong;
		this.haengjeonggu = haengjeonggu;
		this.bungi = bungi;
		this.rentPm = rentPm;
		this.gagusu = gagusu;
		this.gagusPm = gagusPm;
	}

	public Analysis2DTO(String haengjeongdong, String haengjeonggu, int chickenNum, int bistroNum, int facilityNum,
			int istroPm, int facilityPm) {
		super();
		this.haengjeongdong = haengjeongdong;
		this.haengjeonggu = haengjeonggu;
		this.chickenNum = chickenNum;
		this.bistroNum = bistroNum;
		this.facilityNum = facilityNum;
		this.istroPm = istroPm;
		this.facilityPm = facilityPm;
	}

	
    
    
  public int getBungi() {
		return bungi;
	}

	public void setBungi(int bungi) {
		this.bungi = bungi;
	}

	public int getRentPm() {
		return rentPm;
	}

	public void setRentPm(int rentPm) {
		this.rentPm = rentPm;
	}

	public int getGagusu() {
		return gagusu;
	}

	public void setGagusu(int gagusu) {
		this.gagusu = gagusu;
	}

	public int getGagusPm() {
		return gagusPm;
	}

	public void setGagusPm(int gagusPm) {
		this.gagusPm = gagusPm;
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

	public int getChickenNum() {
		return chickenNum;
	}

	public void setChickenNum(int chickenNum) {
		this.chickenNum = chickenNum;
	}

	public int getBistroNum() {
		return bistroNum;
	}

	public void setBistroNum(int bistroNum) {
		this.bistroNum = bistroNum;
	}

	public int getFacilityNum() {
		return facilityNum;
	}

	public void setFacilityNum(int facilityNum) {
		this.facilityNum = facilityNum;
	}

	public int getIstroPm() {
		return istroPm;
	}

	public void setIstroPm(int istroPm) {
		this.istroPm = istroPm;
	}

	public int getFacilityPm() {
		return facilityPm;
	}

	public void setFacilityPm(int facilityPm) {
		this.facilityPm = facilityPm;
	}
    
    
    
}
