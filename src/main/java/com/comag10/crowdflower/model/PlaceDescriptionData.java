package com.comag10.crowdflower.model;

public class PlaceDescriptionData {
	
	private String crowdedness;
	private String weather;
	private String noise;
	private String localfood;
	private String traffic;
	private String services;
	private String easylocation;
	private String locationId;
	
	public String getCrowdedness() {
		return crowdedness;
	}
	public void setCrowdedness(String crowdedness) {
		this.crowdedness = crowdedness;
	}
	
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	
	public String getNoise() {
		return noise;
	}
	public void setNoise(String noise) {
		this.noise = noise;
	}
	
	public String getLocalfood() {
		return localfood;
	}
	public void setLocalfood(String localfood) {
		this.localfood = localfood;
	}
	
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	
	public String getServices() {
		return services;
	}
	public void setServices(String services) {
		this.services = services;
	}
	
	public String getEasylocation() {
		return easylocation;
	}
	public void setEasylocation(String easylocation) {
		this.easylocation = easylocation;
	}
	
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

}