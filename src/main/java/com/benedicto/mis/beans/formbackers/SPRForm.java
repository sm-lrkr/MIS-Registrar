package com.benedicto.mis.beans.formbackers;


import com.benedicto.mis.beans.containers.Student;
import com.benedicto.mis.beans.containers.StudentFBG;
import com.benedicto.mis.beans.containers.StudentProfile;

public class SPRForm {
	private Student student;
	private StudentFBG fbg;
	private StudentProfile profile;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public StudentFBG getFbg() {
		return fbg;
	}
	public void setFbg(StudentFBG fbg) {
		this.fbg = fbg;
	}
	public StudentProfile getProfile() {
		return profile;
	}
	public void setProfile(StudentProfile profile) {
		this.profile = profile;
	}

	

	
}
