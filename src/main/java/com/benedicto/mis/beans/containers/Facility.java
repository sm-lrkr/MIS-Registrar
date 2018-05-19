package com.benedicto.mis.beans.containers;

public class Facility {
	private int id;
	private String type;
	private String description;
	private String facil_name;
	private String _switch;
	private String dateCreated;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFacil_name() {
		return facil_name;
	}
	public void setFacil_name(String facil_name) {
		this.facil_name = facil_name;
	}
	public String get_switch() {
		return _switch;
	}
	public void set_switch(String _switch) {
		this._switch = _switch;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
}
