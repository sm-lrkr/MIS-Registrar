package com.benedicto.mis.beans.containers;

public class SchoolYear {
	
	private int id;
	private String year_start;
	private String year_end;
	private int semester;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getYear_start() {
		return year_start;
	}
	public void setYear_start(String year_start) {
		this.year_start = year_start;
	}
	public String getYear_end() {
		return year_end;
	}
	public void setYear_end(String year_end) {
		this.year_end = year_end;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
}
