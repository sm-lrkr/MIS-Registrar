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
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getSectionID() {
		return sectionID;
	}
	public void setSectionID(String sectionID) {
		this.sectionID = sectionID;
	}
	public String getStrandCode() {
		return strandCode;
	}
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	public int getModifiedCount() {
		return modifiedCount;
	}
	public void setModifiedCount(int modifiedCount) {
		this.modifiedCount = modifiedCount;
	}
}
