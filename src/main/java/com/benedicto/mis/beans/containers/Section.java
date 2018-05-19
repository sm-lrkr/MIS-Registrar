package com.benedicto.mis.beans.containers;

public class Section {
	
	private int sectionID;
	private String strandCode;
	private String sectionName;
	private String room;
	private String session;
	private String personnelID;
	private String personnelName;
	private int gradeLevel;
	
	
	public int getSectionID() {
		return sectionID;
	}
	public void setSectionID(int sectionID) {
		this.sectionID = sectionID;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}

	public String getPersonnelID() {
		return personnelID;
	}
	public void setPersonnelID(String personnelID) {
		this.personnelID = personnelID;
	}
	public String getStrandCode() {
		return strandCode;
	}
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	public String getPersonnelName() {
		return personnelName;
	}
	public void setPersonnelName(String personnelName) {
		this.personnelName = personnelName;
	}
	public int getGradeLevel() {
		return gradeLevel;
	}
	public void setGradeLevel(int gradeLevel) {
		this.gradeLevel = gradeLevel;
	}
}
