package com.benedicto.mis.beans.containers;

public class Teacher {
	
	private String personnelID;
	private String lastName;
	private String firstName;
	private String middleName;
	
	
	
	/**
	 * @return the personnelID
	 */
	public String getPersonnelID() {
		return personnelID;
	}
	/**
	 * @param personnelID the personnelID to set
	 */
	public void setPersonnelID(String personnelID) {
		this.personnelID = personnelID;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	
}
