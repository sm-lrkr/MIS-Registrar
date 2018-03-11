package com.benedicto.mis.beans.containers;

public class Curriculum {
	private String curriculumID;
	private String curriculumDesc;
	private String courseID;
	private String yearImplemented;
	private String strandCode;
	
	public String getCurriculumID() {
		return curriculumID;
	}
	public void setCurriculumID(String curriculumID) {
		this.curriculumID = curriculumID;
	}
	public String getCurriculumDesc() {
		return curriculumDesc;
	}
	public void setCurriculumDesc(String curriculumDesc) {
		this.curriculumDesc = curriculumDesc;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getYearImplemented() {
		return yearImplemented;
	}
	public void setYearImplemented(String yearImplemented) {
		this.yearImplemented = yearImplemented;
	}
	/**
	 * @return the strandCode
	 */
	public String getStrandCode() {
		return strandCode;
	}
	/**
	 * @param strandCode the strandCode to set
	 */
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	
	
}
