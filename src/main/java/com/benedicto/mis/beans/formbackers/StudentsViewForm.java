package com.benedicto.mis.beans.formbackers;

import java.util.List;
import com.benedicto.mis.beans.containers.StudentProfile;

public class StudentsViewForm {
	private List<StudentProfile> students;

	public List<StudentProfile> getStudents() {
		return students;
	}

	public void setStudents(List<StudentProfile> students) {
		this.students = students;
	}
}
