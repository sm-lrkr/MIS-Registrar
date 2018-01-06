package com.benedicto.mis.beans.containers;

public class CurriculumSubject extends Subject implements Comparable<CurriculumSubject>{
	private int year;
	private int sem;
	private boolean major;
	
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
	public boolean isMajor() {
		return major;
	}
	public void setMajor(boolean major) {
		this.major = major;
	}
	
	@Override
	public int compareTo(CurriculumSubject s) {
		// TODO Auto-generated method stub
		if(s.getYear()==this.getYear()) {
			if(s.getSem()==this.getSem()) {
				return this.getSubjectCode().compareTo(s.getSubjectCode());
			}
			return s.getSem() - this.getSem();
		}	
		
		return s.getYear() - this.getYear();
	}
	
	

	
}
