package com.benedicto.mis.beans.containers;

public class SchoolYear {
	
	private int id;
	private String year_start;
	private String year_end;
	private int semester;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the year_start
	 */
	public String getYear_start() {
		return year_start;
	}
	/**
	 * @param year_start the year_start to set
	 */
	public void setYear_start(String year_start) {
		this.year_start = year_start;
	}
	/**
	 * @return the year_end
	 */
	public String getYear_end() {
		return year_end;
	}
	/**
	 * @param year_end the year_end to set
	 */
	public void setYear_end(String year_end) {
		this.year_end = year_end;
	}
	/**
	 * @return the semester
	 */
	public int getSemester() {
		return semester;
	}
	/**
	 * @param semester the semester to set
	 */
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	
	
}
