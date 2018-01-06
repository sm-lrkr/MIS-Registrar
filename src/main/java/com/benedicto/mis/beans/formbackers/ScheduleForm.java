package com.benedicto.mis.beans.formbackers;


import com.benedicto.mis.beans.containers.Schedule;

public class ScheduleForm {
	Schedule schedule;
	DaysCollector lecDays;
	DaysCollector labDays;

	
	
	public DaysCollector getLecDays() {
		return lecDays;
	}
	public void setLecDays(DaysCollector lecDays) {
		this.lecDays = lecDays;
	}
	public DaysCollector getLabDays() {
		return labDays;
	}
	public void setLabDays(DaysCollector labDays) {
		this.labDays = labDays;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	
}
