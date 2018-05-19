package com.benedicto.mis.beans.formbackers;


import java.util.List;

import com.benedicto.mis.beans.containers.Curriculum;
import com.benedicto.mis.beans.containers.StrandSubject;

public class StrandSubjects {
	private Curriculum curriculum;
	private List<StrandSubject> subjects;
	

	
	public Curriculum getCurriculum() {
		return curriculum;
	}

	public List<StrandSubject> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<StrandSubject> subjects) {
		this.subjects = subjects;
	}

	public void setCurriculum(Curriculum curriculum) {
		this.curriculum = curriculum;
	}
}
