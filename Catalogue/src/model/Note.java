package model;

import java.util.List;

public class Note {

	private Long id;
	private String name;
	private User owner;
	private List<City> notes;
	
	public Note(){}

	public Long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public User getOwner() {
		return owner;
	}
	
	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<City> getNotes() {
		return notes;
	}

	public void setNotes(List<City> notes) {
		this.notes = notes;
	}

	
	
	
}
