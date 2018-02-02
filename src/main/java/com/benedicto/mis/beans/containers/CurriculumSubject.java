package com.benedicto.mis.beans.containers;

public class CurriculumSubject  implements Comparable<CurriculumSubject>{
	
	private String subjectCode;
	private String subjectDesc;
	private int labUnits;
	private int lecUnits;
	private String preRequisites;
	private boolean checked;
	
	
	
	private int year;
	private int sem;
	private boolean major;
	
	
	
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectDesc() {
		return subjectDesc;
	}
	public void setSubjectDesc(String subjectDesc) {
		this.subjectDesc = subjectDesc;
	}
	public int getLabUnits() {
		return labUnits;
	}
	public void setLabUnits(int labUnits) {
		this.labUnits = labUnits;
	}
	public int getLecUnits() {
		return lecUnits;
	}
	public void setLecUnits(int lecUnits) {
		this.lecUnits = lecUnits;
	}
	public String getPreRequisites() {
		return preRequisites;
	}
	public void setPreRequisites(String preRequisites) {
		this.preRequisites = preRequisites;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
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
