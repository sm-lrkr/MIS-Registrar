package com.benedicto.mis.beans.containers;

public class SubjectGrades extends Subject implements Comparable<SubjectGrades>{
	private float prelimGrade;
	private float midtermGrade;
	private float finalGrade;
	private float equivalentGrade;
	private float backupGrade;
	private String dateModified;
	private String studentNo;
	private String enrollmentNo;
	private String schoolYear;
	private int semester;
	
	/**
	 * @return the prelimGrade
	 */
	public float getPrelimGrade() {
		return prelimGrade;
	}
	/**
	 * @param prelimGrade the prelimGrade to set
	 */
	public void setPrelimGrade(float prelimGrade) {
		this.prelimGrade = prelimGrade;
	}
	/**
	 * @return the midtermGrade
	 */
	public float getMidtermGrade() {
		return midtermGrade;
	}
	/**
	 * @param midtermGrade the midtermGrade to set
	 */
	public void setMidtermGrade(float midtermGrade) {
		this.midtermGrade = midtermGrade;
	}
	/**
	 * @return the finalGrade
	 */
	public float getFinalGrade() {
		return finalGrade;
	}
	/**
	 * @param finalGrade the finalGrade to set
	 */
	public void setFinalGrade(float finalGrade) {
		this.finalGrade = finalGrade;
	}
	/**
	 * @return the equivalentGrade
	 */
	public float getEquivalentGrade() {
		return equivalentGrade;
	}
	/**
	 * @param equivalentGrade the equivalentGrade to set
	 */
	public void setEquivalentGrade(float equivalentGrade) {
		this.equivalentGrade = equivalentGrade;
	}
	/**
	 * @return the dateModified
	 */
	public String getDateModified() {
		return dateModified;
	}
	/**
	 * @param dateModified the dateModified to set
	 */
	public void setDateModified(String dateModified) {
		this.dateModified = dateModified;
	}
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
	 * @return the enrollmentNo
	 */
	public String getEnrollmentNo() {
		return enrollmentNo;
	}
	/**
	 * @param enrollmentNo the enrollmentNo to set
	 */
	public void setEnrollmentNo(String enrollmentNo) {
		this.enrollmentNo = enrollmentNo;
	}
	/**
	 * @return the backupGrade
	 */
	public float getBackupGrade() {
		return backupGrade;
	}
	/**
	 * @param backupGrade the backupGrade to set
	 */
	public void setBackupGrade(float backupGrade) {
		this.backupGrade = backupGrade;
	}
	/**
	 * @return the schoolYear
	 */
	public String getSchoolYear() {
		return schoolYear;
	}
	/**
	 * @param schoolYear the schoolYear to set
	 */
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
