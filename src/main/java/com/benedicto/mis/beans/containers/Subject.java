package com.benedicto.mis.beans.containers;


public class Subject {
	protected String subjectCode;
	protected String subjectDesc;
	protected int labUnits;
	protected int lecUnits;
	protected String preRequisites;
	private String type;
	protected boolean checked;
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectDesc() {
		return subjectDesc;
	}
	public void setSubjectDesc(String subjectDesc) {
		this.subjectDesc = subjectDesc;
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
	public String getPreRequisites() {
		return preRequisites;
	}
	public void setPreRequisites(String preRequisites) {
		this.preRequisites = preRequisites;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	
	
}
