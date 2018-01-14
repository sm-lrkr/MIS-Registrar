package com.benedicto.mis.beans.containers;

import org.hibernate.validator.constraints.NotEmpty;

public class StudentProfile {
	private String studentNo;
	
	@NotEmpty(message = "Please enter StudentID.")
	private String studentID;
	
	
	private String LRN;
	

	private String courseID;
	private String curriculumID;
	private String strandCode;
	

	private String studentStatus;
	private String enrollmentStatus;
	private boolean shiftee;
	private String shiftCourse;
	private String shiftStrand;
	private String semEntry;
	private String yearEntry;
	private String graduationYear;
	private String applicationType;
	private String empty;
	
	
	
	public String getShiftStrand() {
		return shiftStrand;
	}
	public void setShiftStrand(String shiftStrand) {
		this.shiftStrand = shiftStrand;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getCurriculumID() {
		return curriculumID;
	}
	public void setCurriculumID(String curriculumID) {
		this.curriculumID = curriculumID;
	}
	public String getStudentStatus() {
		return studentStatus;
	}
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}
	public String getEnrollmentStatus() {
		return enrollmentStatus;
	}
	public void setEnrollmentStatus(String enrollmentStatus) {
		this.enrollmentStatus = enrollmentStatus;
	}
	public boolean isShiftee() {
		return shiftee;
	}
	public void setShiftee(boolean shiftee) {
		this.shiftee = shiftee;
	}
	public String getShiftCourse() {
		return shiftCourse;
	}
	public void setShiftCourse(String shiftCourse) {
		this.shiftCourse = shiftCourse;
	}
	public String getSemEntry() {
		return semEntry;
	}
	public void setSemEntry(String semEntry) {
		this.semEntry = semEntry;
	}
	public String getYearEntry() {
		return yearEntry;
	}
	public void setYearEntry(String yearEntry) {
		this.yearEntry = yearEntry;
	}
	
	
	public String getGraduationYear() {
		return graduationYear;
	}
	public void setGraduationYear(String graduationYear) {
		this.graduationYear = graduationYear;
	}
	public String getApplicationType() {
		return applicationType;
	}
	public void setApplicationType(String applicationType) {
		this.applicationType = applicationType;
	}
	public String getEmpty() {
		return empty;
	}
	public void setEmpty(String empty) {
		this.empty = empty;
	}
	
	public String getLRN() {
		return LRN;
	}
	public void setLRN(String lRN) {
		LRN = lRN;
	}
	

	
	
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStrandCode() {
		return strandCode;
	}
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	

}
