package com.benedicto.mis.beans.containers;

public class EvaluationProfile {
	
	private String id;
	private String verification;
	private boolean evaluated;
	private String date;
	private int evaluationNo;
	private int enrollmentNo;
	private int studentNo;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVerification() {
		return verification;
	}
	public void setVerification(String verification) {
		this.verification = verification;
	}
	public boolean isEvaluated() {
		return evaluated;
	}
	public void setEvaluated(boolean evaluated) {
		this.evaluated = evaluated;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getEvaluationNo() {
		return evaluationNo;
	}
	public void setEvaluationNo(int evaluationNo) {
		this.evaluationNo = evaluationNo;
	}
	public int getEnrollmentNo() {
		return enrollmentNo;
	}
	public void setEnrollmentNo(int enrollmentNo) {
		this.enrollmentNo = enrollmentNo;
	}
	public int getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
}
