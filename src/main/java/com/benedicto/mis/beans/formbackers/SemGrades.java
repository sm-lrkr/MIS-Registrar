package com.benedicto.mis.beans.formbackers;

import java.util.List;

import com.benedicto.mis.beans.containers.Enrollment;
import com.benedicto.mis.beans.containers.SubjectGrades;

public class SemGrades {
	private Enrollment enrollment;
	private List<SubjectGrades> grades;
	private float average;
	
	public Enrollment getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(Enrollment enrollment) {
		this.enrollment = enrollment;
	}
	public List<SubjectGrades> getGrades() {
		return grades;
	}
	public void setGrades(List<SubjectGrades> grades) {
		this.grades = grades;
	}
	public float getAverage() {
		return average;
	}
	public void setAverage(float average) {
		this.average = average;
	}
}
