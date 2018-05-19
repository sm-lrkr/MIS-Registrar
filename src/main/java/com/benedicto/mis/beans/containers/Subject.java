package com.benedicto.mis.beans.containers;


public class Subject{
	
	protected String subjectCode;
	protected String subjectDesc;
	protected int labUnits;
	protected int lecUnits;
	protected String preRequisites;
	protected String type;
	protected boolean checked;
	
	
	/**
	 * @return the subjectCode
	 */
	public String getSubjectCode() {
		return subjectCode;
	}


	/**
	 * @param subjectCode the subjectCode to set
	 */
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}


	/**
	 * @return the subjectDesc
	 */
	public String getSubjectDesc() {
		return subjectDesc;
	}


	/**
	 * @param subjectDesc the subjectDesc to set
	 */
	public void setSubjectDesc(String subjectDesc) {
		this.subjectDesc = subjectDesc;
	}


	/**
	 * @return the labUnits
	 */
	public int getLabUnits() {
		return labUnits;
	}


	/**
	 * @param labUnits the labUnits to set
	 */
	public void setLabUnits(int labUnits) {
		this.labUnits = labUnits;
	}


	/**
	 * @return the lecUnits
	 */
	public int getLecUnits() {
		return lecUnits;
	}


	/**
	 * @param lecUnits the lecUnits to set
	 */
	public void setLecUnits(int lecUnits) {
		this.lecUnits = lecUnits;
	}


	/**
	 * @return the preRequisites
	 */
	public String getPreRequisites() {
		return preRequisites;
	}


	/**
	 * @param preRequisites the preRequisites to set
	 */
	public void setPreRequisites(String preRequisites) {
		this.preRequisites = preRequisites;
	}


	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}


	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}


	/**
	 * @return the checked
	 */
	public boolean isChecked() {
		return checked;
	}


	/**
	 * @param checked the checked to set
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}
