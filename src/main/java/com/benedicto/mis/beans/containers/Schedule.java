package com.benedicto.mis.beans.containers;

public class Schedule {
	private String scheduleID;
	private String subjectCode;
	private String schedDesc;
	private String section;
	
	private String lecTimeStart;
	private String lecTimeEnd;
	private String lecRoom;
	private String lecDays;
	
	private String labTimeStart;
	private String labTimeEnd;
	private String labRoom;
	private String labDays;
	
	
	private String schoolYear;
	private String semester;
	
	private int labUnits;
	private int lecUnits;
	
	
	private String personnelID;
	private String personnelName;
	
	
	private boolean checked;
	
	
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	

	
	public String getSchedDesc() {
		return schedDesc;
	}
	public void setSchedDesc(String schedDesc) {
		this.schedDesc = schedDesc;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	/////////////////////////////////////////////////////
	
	public String getLecTimeStart() {
		return lecTimeStart;
	}
	public void setLecTimeStart(String lecTimeStart) {
		this.lecTimeStart = lecTimeStart;
	}
	public String getLecTimeEnd() {
		return lecTimeEnd;
	}
	public void setLecTimeEnd(String lecTimeEnd) {
		this.lecTimeEnd = lecTimeEnd;
	}
	public String getLecRoom() {
		return lecRoom;
	}
	public void setLecRoom(String lecRoom) {
		this.lecRoom = lecRoom;
	}
	public String getLecDays() {
		return lecDays;
	}
	public void setLecDays(String lecDays) {
		this.lecDays = lecDays;
	}
	
	
	public String getLabTimeStart() {
		return labTimeStart;
	}
	public void setLabTimeStart(String labTimeStart) {
		this.labTimeStart = labTimeStart;
	}
	public String getLabTimeEnd() {
		return labTimeEnd;
	}
	public void setLabTimeEnd(String labTimeEnd) {
		this.labTimeEnd = labTimeEnd;
	}
	public String getLabRoom() {
		return labRoom;
	}
	public void setLabRoom(String labRoom) {
		this.labRoom = labRoom;
	}
	public String getLabDays() {
		return labDays;
	}
	public void setLabDays(String labDays) {
		this.labDays = labDays;
	}
	public int getLabUnits() {
		return labUnits;
	}
	public void setLabUnits(int labUnits) {
		this.labUnits = labUnits;
	}
	public int getLecUnits() {
		return lecUnits;
	}
	public void setLecUnits(int lecUnits) {
		this.lecUnits = lecUnits;
	}
	public String getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getPersonnelID() {
		return personnelID;
	}
	public void setPersonnelID(String personnelID) {
		this.personnelID = personnelID;
	}
	public String getPersonnelName() {
		return personnelName;
	}
	public void setPersonnelName(String personnelName) {
		this.personnelName = personnelName;
	}
	
	
}
