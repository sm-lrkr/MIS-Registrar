package com.benedicto.mis.beans.containers;

public class SubjectGrades extends Subject implements Comparable<SubjectGrades>{
	private float prelimGrade;
	private float tentativeMidterm;
	private float midtermGrade;
	private float tentativeFinal;
	private float finalGrade;
	private float equivalentGrade;
	private float backupGrade;
	private String dateModified;
	private String studentNo;
	private String enrollmentNo;
	private String schoolYear;
	private int semester;
	private String scheduleID;
	private String firstName;
	private String lastName;
	private String middleName;
	

	public float getPrelimGrade() {
		return prelimGrade;
	}
	public void setPrelimGrade(float prelimGrade) {
		this.prelimGrade = prelimGrade;
	}
	public float getTentativeMidterm() {
		return tentativeMidterm;
	}
	public void setTentativeMidterm(float tentativeMidterm) {
		this.tentativeMidterm = tentativeMidterm;
	}
	public float getMidtermGrade() {
		return midtermGrade;
	}
	public void setMidtermGrade(float midtermGrade) {
		this.midtermGrade = midtermGrade;
	}
	public float getTentativeFinal() {
		return tentativeFinal;
	}
	public void setTentativeFinal(float tentativeFinal) {
		this.tentativeFinal = tentativeFinal;
	}
	public float getFinalGrade() {
		return finalGrade;
	}
	public void setFinalGrade(float finalGrade) {
		this.finalGrade = finalGrade;
	}
	public float getEquivalentGrade() {
		return equivalentGrade;
	}
	public void setEquivalentGrade(float equivalentGrade) {
		this.equivalentGrade = equivalentGrade;
	}

	public float getBackupGrade() {
		return backupGrade;
	}

	public void setBackupGrade(float backupGrade) {
		this.backupGrade = backupGrade;
	}

	public String getDateModified() {
		return dateModified;
	}

	public void setDateModified(String dateModified) {
		this.dateModified = dateModified;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getEnrollmentNo() {
		return enrollmentNo;
	}

	public void setEnrollmentNo(String enrollmentNo) {
		this.enrollmentNo = enrollmentNo;
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

	public String getScheduleID() {
		return scheduleID;
	}

	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}

	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}






	@Override
	public int compareTo(SubjectGrades s) {
		if(s.getSchoolYear()==this.getSchoolYear()) {
			if(s.getSemester()==this.getSemester()) {
				return this.getSubjectCode().compareTo(s.getSubjectCode());
			}
			return s.getSemester() - this.getSemester();
		}	
		return s.getSchoolYear().compareTo(this.getSchoolYear());
	}
}
