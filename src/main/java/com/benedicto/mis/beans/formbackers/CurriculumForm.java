package com.benedicto.mis.beans.formbackers;

import java.util.List;

import com.benedicto.mis.beans.containers.Curriculum;
import com.benedicto.mis.beans.containers.CurriculumSubject;

public class CurriculumForm {
	private Curriculum curriculum;
	private List<CurriculumSubject> curricSubjects;
	

	
	public Curriculum getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(Curriculum curriculum) {
		this.curriculum = curriculum;
	}

	public List<CurriculumSubject> getCurricSubjects() {
		return curricSubjects;
	}

	public void setCurricSubjects(List<CurriculumSubject> curricSubjects) {
		this.curricSubjects = curricSubjects;
	}

}
