package com.benedicto.mis.beans.formbackers;

public class DaysCollector {
	private boolean[] days = new boolean[7];

	public boolean[] getDays() {
		return days;
	}

	public void setDays(boolean[] days) {
		this.days = days;
	} 
	
	public String getStringDays() {
		String _days="";
		
		if(days[0]) 
			_days = _days.concat("M");
		if(days[1]) 
			_days = _days.concat("T");
		if(days[2]) 
			_days = _days.concat("W");
		if(days[3]) 
			_days = _days.concat("Th");
		if(days[4]) 
			_days = _days.concat("F");
		if(days[5]) 
			_days = _days.concat("S");
		if(days[6]) 
			_days = _days.concat("Su");
		
		return _days;
	}

}
