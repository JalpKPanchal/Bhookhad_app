package com.bean;

import org.springframework.web.multipart.MultipartFile;

public class OfferBean 
{
	private Integer offerId;
	private String title;
	private String description;
	private Boolean active;
	private String startDate;
	private String endDate;
	private String locationId;
	private String foodType;
	private MultipartFile offerPic;
	private String offerPicPath;
	private String locationTitle; 
	
	public Integer getOfferId() {
		return offerId;
	}
	public void setOfferId(Integer offerId) {
		this.offerId = offerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	 
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public MultipartFile getOfferPic() {
		return offerPic;
	}
	public void setOfferPic(MultipartFile offerPic) {
		this.offerPic = offerPic;
	}
	public String getOfferPicPath() {
		return offerPicPath;
	}
	public void setOfferPicPath(String offerPicPath) {
		this.offerPicPath = offerPicPath;
	}
	public String getLocationTitle() {
		return locationTitle;
	}
	public void setLocationTitle(String locationTitle) {
		this.locationTitle = locationTitle;
	}
	

}