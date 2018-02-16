package com.benedicto.mis.beans.formbackers;

import java.util.List;

import com.benedicto.mis.beans.containers.Enrollment;
import com.benedicto.mis.beans.containers.SubjectGrades;

public class SemGrades {
	public Enrollment enrollment;
	public List<SubjectGrades> grades;
	
	
	/**
	 * @return the enrollment
	 */
	public Enrollment getEnrollment() {
		return enrollment;
	}
	/**
	 * @param enrollment the enrollment to set
	 */
	public void setEnrollment(Enrollment enrollment) {
		this.enrollment = enrollment;
	}
	/**
	 * @return the grades
	 */
	public List<SubjectGrades> getGrades() {
		return grades;
	}
	/**
	 * @param grades the grades to set
	 */
	public void setGrades(List<SubjectGrades> grades) {
		this.grades = grades;
	}
	
	
}
