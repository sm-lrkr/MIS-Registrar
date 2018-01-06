package com.benedicto.mis.beans.containers;

public class Section {
	
	private int sectionID;
	private String strandCode;
	private String sectionName;
	private String room;
	private String session;
	private String teacher;
	
	
	
	
	
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
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	private String strandDesc;
	private String track;
	private String major;
	
	public String getStrandCode() {
		return strandCode;
	}
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	public String getStrandDesc() {
		return strandDesc;
	}
	public void setStrandDesc(String strandDesc) {
		this.strandDesc = strandDesc;
	}
	public String getTrack() {
		return track;
	}
	public void setTrack(String track) {
		this.track = track;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
	
}
