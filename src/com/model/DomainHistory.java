package com.model;

import java.util.Date;

public class DomainHistory {

	private Long id;
	private String domain;
	private String domainIp;
	private String countryCode;
	private String countryName;
	private String regionName;
	private String cityName;
	private Date lastSearchedDate;
	private String lastSearchedDateStr;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getDomainIp() {
		return domainIp;
	}
	public void setDomainIp(String domainIp) {
		this.domainIp = domainIp;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public Date getLastSearchedDate() {
		return lastSearchedDate;
	}
	public void setLastSearchedDate(Date lastSearchedDate) {
		this.lastSearchedDate = lastSearchedDate;
	}
	public String getLastSearchedDateStr() {
		return lastSearchedDateStr;
	}
	public void setLastSearchedDateStr(String lastSearchedDateStr) {
		this.lastSearchedDateStr = lastSearchedDateStr;
	}
	
}
