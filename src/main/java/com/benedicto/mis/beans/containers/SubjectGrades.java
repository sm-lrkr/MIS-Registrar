package com.benedicto.mis.beans.containers;

public class SubjectGrades extends Subject {
	private float prelimGrade;
	private float midtermGrade;
	private float finalGrade;
	private float equivalentGrade;
	private String dateModified;
	private String schoolYear;
	private String semester;
	
	
	public float getPrelimGrade() {
		return prelimGrade;
	}
	public void setPrelimGrade(float prelimGrade) {
		this.prelimGrade = prelimGrade;
	}
	public float getMidtermGrade() {
		return midtermGrade;
	}
	public void setMidtermGrade(float midtermGrade) {
		this.midtermGrade = midtermGrade;
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
	public String getDateModified() {
		return dateModified;
	}
	public void setDateModified(String dateModified) {
		this.dateModified = dateModified;
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
	
	
	
}
