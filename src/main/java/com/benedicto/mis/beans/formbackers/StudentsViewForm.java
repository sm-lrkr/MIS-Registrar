package com.benedicto.mis.beans.formbackers;

import java.util.List;

import com.benedicto.mis.beans.containers.StudentPersonal;
import com.benedicto.mis.beans.containers.StudentProfile;

public class StudentsViewForm {
	private List<StudentProfile> students;

	/**
	 * @return the students
	 */
	public List<StudentProfile> getStudents() {
		return students;
	}

	/**
	 * @param students the students to set
	 */
	public void setStudents(List<StudentProfile> students) {
		this.students = students;
	}
	
	
	
}
