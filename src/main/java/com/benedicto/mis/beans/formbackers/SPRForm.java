package com.benedicto.mis.beans.formbackers;


import com.benedicto.mis.beans.containers.StudentPersonal;
import com.benedicto.mis.beans.containers.StudentFBG;
import com.benedicto.mis.beans.containers.StudentProfile;

public class SPRForm {
	private StudentPersonal personal;
	private StudentFBG fbg;
	private StudentProfile profile;
	private StudentProfile profilesh;
	private StudentProfile profilebsc;
	
	public StudentPersonal getPersonal() {
		return personal;
	}
	public void setPersonal(StudentPersonal personal) {
		this.personal = personal;
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
	public StudentProfile getProfilesh() {
		return profilesh;
	}
	public void setProfilesh(StudentProfile profilesh) {
		this.profilesh = profilesh;
	}
	public StudentProfile getProfilebsc() {
		return profilebsc;
	}
	public void setProfilebsc(StudentProfile profilebsc) {
		this.profilebsc = profilebsc;
	}
}
