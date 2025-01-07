package com.bean;

public class AreaBean 
{
	private	Integer areaId;
	private	String areaName;
	private	Integer cityId;
	private	String cityName;
	
	
		public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
		public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
		public Integer getAreaId() {
			return areaId;
		}
		public void setAreaId(Integer areaId) {
			this.areaId = areaId;
		}
		public String getAreaName() {
			return areaName;
		}
		public void setAreaName(String areaName) {
			this.areaName = areaName;
		}
		
	}

