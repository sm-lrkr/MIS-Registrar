package com.benedicto.mis.beans.containers;

public class StrandSubject  implements Comparable<StrandSubject>{
	
	private SubjectSHS subject;
	private int year;
	private int sem;
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSem() {
		return sem;
	}
	public void setSem(int sem) {
		this.sem = sem;
	}


	@Override
	public int compareTo(StrandSubject s) {
		// TODO Auto-generated method stub
		if(s.getYear()==this.getYear()) {
			if(s.getSem()==this.getSem()) {
				return this.getSubject().getSubjectCode().compareTo(s.getSubject().getSubjectCode());
			}
			return s.getSem() - this.getSem();
		}	
		
		return s.getYear() - this.getYear();
	}
	public SubjectSHS getSubject() {
		return subject;
	}
	public void setSubject(SubjectSHS subject) {
		this.subject = subject;
	}
}
