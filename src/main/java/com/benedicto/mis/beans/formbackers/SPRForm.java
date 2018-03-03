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
	
	/**
	 * @return the personal
	 */
	public StudentPersonal getPersonal() {
		return personal;
	}
	/**
	 * @param personal the personal to set
	 */
	public void setPersonal(StudentPersonal personal) {
		this.personal = personal;
	}
	/**
	 * @return the fbg
	 */
	public StudentFBG getFbg() {
		return fbg;
	}
	/**
	 * @param fbg the fbg to set
	 */
	public void setFbg(StudentFBG fbg) {
		this.fbg = fbg;
	}
	/**
	 * @return the profile
	 */
	public StudentProfile getProfile() {
		return profile;
	}
	/**
	 * @param profile the profile to set
	 */
	public void setProfile(StudentProfile profile) {
		this.profile = profile;
	}
	/**
	 * @return the profilesh
	 */
	public StudentProfile getProfilesh() {
		return profilesh;
	}
	/**
	 * @param profilesh the profilesh to set
	 */
	public void setProfilesh(StudentProfile profilesh) {
		this.profilesh = profilesh;
	}
	/**
	 * @return the profilebsc
	 */
	public StudentProfile getProfilebsc() {
		return profilebsc;
	}
	/**
	 * @param profilebsc the profilebsc to set
	 */
	public void setProfilebsc(StudentProfile profilebsc) {
		this.profilebsc = profilebsc;
	}
	
	
	
}
