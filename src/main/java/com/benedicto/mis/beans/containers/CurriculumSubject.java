package com.benedicto.mis.beans.containers;

public class CurriculumSubject extends Subject implements Comparable<CurriculumSubject>{
	
	private int year;
	private int sem;
	private boolean major;
	
	
	
	/**
	 * @return the year
	 */
	public int getYear() {
		return year;
	}



	/**
	 * @param year the year to set
	 */
	public void setYear(int year) {
		this.year = year;
	}



	/**
	 * @return the sem
	 */
	public int getSem() {
		return sem;
	}



	/**
	 * @param sem the sem to set
	 */
	public void setSem(int sem) {
		this.sem = sem;
	}



	/**
	 * @return the major
	 */
	public boolean isMajor() {
		return major;
	}



	/**
	 * @param major the major to set
	 */
	public void setMajor(boolean major) {
		this.major = major;
	}



	@Override
	public int compareTo(CurriculumSubject s) {
		if(s.getYear()==this.getYear()) {
			if(s.getSem()==this.getSem()) {
				return this.getSubjectCode().compareTo(s.getSubjectCode());
			}
			return s.getSem() - this.getSem();
		}	
		
		return s.getYear() - this.getYear();
	}
}
