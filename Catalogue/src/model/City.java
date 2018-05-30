package model;

import java.util.List;

public class City {

	private String name;
	
	private List<String> nearbyCities;
	
	
	public City(){
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getNearbyCities() {
		return nearbyCities;
	}

	public void setNearbyCities(List<String> nearbyCities) {
		this.nearbyCities = nearbyCities;
	}
	
	
	
	
	
}
