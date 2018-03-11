package com.benedicto.mis.beans.containers;

import org.hibernate.validator.constraints.NotEmpty;

public class StudentProfile {
	private String studentNo;
	
	@NotEmpty(message = "Please enter StudentID.")
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
	/**
	 * @return the studentNo
	 */
	public String getStudentNo() {
		return studentNo;
	}
	/**
	 * @param studentNo the studentNo to set
	 */
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	/**
	 * @return the studentID
	 */
	public String getStudentID() {
		return studentID;
	}
	/**
	 * @param studentID the studentID to set
	 */
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the middleName
	 */
	public String getMiddleName() {
		return middleName;
	}
	/**
	 * @param middleName the middleName to set
	 */
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the lRN
	 */
	public String getLRN() {
		return LRN;
	}
	/**
	 * @param lRN the lRN to set
	 */
	public void setLRN(String lRN) {
		LRN = lRN;
	}
	/**
	 * @return the courseID
	 */
	public String getCourseID() {
		return courseID;
	}
	/**
	 * @param courseID the courseID to set
	 */
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	/**
	 * @return the curriculumID
	 */
	public String getCurriculumID() {
		return curriculumID;
	}
	/**
	 * @param curriculumID the curriculumID to set
	 */
	public void setCurriculumID(String curriculumID) {
		this.curriculumID = curriculumID;
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
	 * @return the studentStatus
	 */
	public String getStudentStatus() {
		return studentStatus;
	}
	/**
	 * @param studentStatus the studentStatus to set
	 */
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}
	/**
	 * @return the enrolled
	 */
	public boolean isEnrolled() {
		return enrolled;
	}
	/**
	 * @param enrolled the enrolled to set
	 */
	public void setEnrolled(boolean enrolled) {
		this.enrolled = enrolled;
	}
	/**
	 * @return the shiftee
	 */
	public boolean isShiftee() {
		return shiftee;
	}
	/**
	 * @param shiftee the shiftee to set
	 */
	public void setShiftee(boolean shiftee) {
		this.shiftee = shiftee;
	}
	/**
	 * @return the shiftCourse
	 */
	public String getShiftCourse() {
		return shiftCourse;
	}
	/**
	 * @param shiftCourse the shiftCourse to set
	 */
	public void setShiftCourse(String shiftCourse) {
		this.shiftCourse = shiftCourse;
	}
	/**
	 * @return the shiftStrand
	 */
	public String getShiftStrand() {
		return shiftStrand;
	}
	/**
	 * @param shiftStrand the shiftStrand to set
	 */
	public void setShiftStrand(String shiftStrand) {
		this.shiftStrand = shiftStrand;
	}
	/**
	 * @return the semEntry
	 */
	public String getSemEntry() {
		return semEntry;
	}
	/**
	 * @param semEntry the semEntry to set
	 */
	public void setSemEntry(String semEntry) {
		this.semEntry = semEntry;
	}
	/**
	 * @return the yearEntry
	 */
	public String getYearEntry() {
		return yearEntry;
	}
	/**
	 * @param yearEntry the yearEntry to set
	 */
	public void setYearEntry(String yearEntry) {
		this.yearEntry = yearEntry;
	}
	/**
	 * @return the graduationYear
	 */
	public String getGraduationYear() {
		return graduationYear;
	}
	/**
	 * @param graduationYear the graduationYear to set
	 */
	public void setGraduationYear(String graduationYear) {
		this.graduationYear = graduationYear;
	}
	/**
	 * @return the applicationType
	 */
	public String getApplicationType() {
		return applicationType;
	}
	/**
	 * @param applicationType the applicationType to set
	 */
	public void setApplicationType(String applicationType) {
		this.applicationType = applicationType;
	}
	/**
	 * @return the empty
	 */
	public String getEmpty() {
		return empty;
	}
	/**
	 * @param empty the empty to set
	 */
	public void setEmpty(String empty) {
		this.empty = empty;
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
	/**
	 * @return the profileType
	 */
	public String getProfileType() {
		return profileType;
	}
	/**
	 * @param profileType the profileType to set
	 */
	public void setProfileType(String profileType) {
		this.profileType = profileType;
	}
	/**
	 * @return the prevSchoolType
	 */
	public String getPrevSchoolType() {
		return prevSchoolType;
	}
	/**
	 * @param prevSchoolType the prevSchoolType to set
	 */
	public void setPrevSchoolType(String prevSchoolType) {
		this.prevSchoolType = prevSchoolType;
	}
	/**
	 * @return the eSC
	 */
	public boolean isESC() {
		return ESC;
	}
	/**
	 * @param eSC the eSC to set
	 */
	public void setESC(boolean eSC) {
		ESC = eSC;
	}
	
		
	

}
