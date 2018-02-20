package com.benedicto.mis.beans.containers;

public class Enrollment {
	private String enrollmentNo;
	private String studentNo;
	private String schoolYear;
	private int semester;
	private String sectionID;
	private String strandCode;
	private int modifiedCount;
	
	public String getEnrollmentNo() {
		return enrollmentNo;
	}
	public void setEnrollmentNo(String enrollmentNo) {
		this.enrollmentNo = enrollmentNo;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}
	
	/**
	 * @return the semester
	 */
	public int getSemester() {
		return semester;
	}
	/**
	 * @param semester the semester to set
	 */
	public void setSemester(int semester) {
		this.semester = semester;
	}
	/**
	 * @return the sectionID
	 */
	public String getSectionID() {
		return sectionID;
	}
	/**
	 * @param sectionID the sectionID to set
	 */
	public void setSectionID(String sectionID) {
		this.sectionID = sectionID;
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
	/**
	 * @return the modifiedCount
	 */
	/**
	 * @return the modifiedCount
	 */
	public int getModifiedCount() {
		return modifiedCount;
	}
	/**
	 * @param modifiedCount the modifiedCount to set
	 */
	public void setModifiedCount(int modifiedCount) {
		this.modifiedCount = modifiedCount;
	}
	
	
	
	
}
