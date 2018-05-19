package com.benedicto.mis.beans.containers;

public class StudentProfile {
	
	private String studentNo;
	private String studentID;
	private String firstName;
	private String middleName;
	private String lastName;
	private String LRN;
	private String courseID;
	private String curriculumID;
	private String strandCode;
	private String studentStatus;
	private boolean enrolled;
	private boolean shiftee;
	private String shiftCourse;
	private String shiftStrand;
	private String semEntry;
	private String yearEntry;
	private String graduationYear;
	private String applicationType;
	private String profileType;
	private String prevSchoolType;
	private boolean ESC;
	
	private String empty;
	private boolean checked;
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
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
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getLRN() {
		return LRN;
	}
	public void setLRN(String lRN) {
		LRN = lRN;
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
	public String getStrandCode() {
		return strandCode;
	}
	public void setStrandCode(String strandCode) {
		this.strandCode = strandCode;
	}
	public String getStudentStatus() {
		return studentStatus;
	}
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}
	public boolean isEnrolled() {
		return enrolled;
	}
	public void setEnrolled(boolean enrolled) {
		this.enrolled = enrolled;
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
	public String getShiftStrand() {
		return shiftStrand;
	}
	public void setShiftStrand(String shiftStrand) {
		this.shiftStrand = shiftStrand;
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
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getProfileType() {
		return profileType;
	}
	public void setProfileType(String profileType) {
		this.profileType = profileType;
	}
	public String getPrevSchoolType() {
		return prevSchoolType;
	}
	public void setPrevSchoolType(String prevSchoolType) {
		this.prevSchoolType = prevSchoolType;
	}
	public boolean isESC() {
		return ESC;
	}
	public void setESC(boolean eSC) {
		ESC = eSC;
	}
}
