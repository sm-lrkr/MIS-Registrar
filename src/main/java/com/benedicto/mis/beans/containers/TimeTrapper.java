package com.benedicto.mis.beans.containers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.benedicto.mis.beans.studentdb;

public class TimeTrapper {
	
	 private final ArrayList<String> times = new ArrayList<String>();
	 
	 public TimeTrapper() {
	     times.add("");
	     times.add("05:00 AM");
	     times.add("05:30 AM");
	     times.add("06:00 AM");
	     times.add("06:30 AM");
	     times.add("07:00 AM");
	     times.add("07:30 AM");
	     times.add("08:00 AM");
	     times.add("08:30 AM");
	     times.add("09:00 AM");
	     times.add("09:30 AM");
	     times.add("10:00 AM");
	     times.add("10:30 AM");
	     times.add("11:00 AM");
	     times.add("11:30 AM");
	     times.add("12:00 PM");
	     times.add("12:30 PM");
	    
	     times.add("01:00 PM");
	     times.add("01:30 PM");
	     times.add("02:00 PM");
	     times.add("02:30 PM");
	     times.add("03:00 PM");
	     times.add("03:30 PM");
	     times.add("04:00 PM");
	     times.add("04:30 PM");
	     times.add("05:00 PM");
	     times.add("05:30 PM");
	     times.add("06:00 PM");
	     times.add("06:30 PM");
	     times.add("07:00 PM");
	     times.add("07:30 PM");
	     times.add("08:00 PM");
	     times.add("08:30 PM");
	     times.add("09:00 PM");
	     times.add("09:30 PM");
	     times.add("10:00 PM");
	 }

	

	 

     private Boolean daysConflict(String existingdays, String chosendays)
     {
         String[] Days = { "M", "T", "W", "Th", "F", "S", "Su" };

         for (int i = 0; i < 7; i++)
         {
             if (Days[i].equals(existingdays) || existingdays.contains(Days[i]))
             {
                 if (existingdays.contains("h") && Days[i].equals("T"))
                 {
                     int countT = 0;
                     for (int x = 0; x < existingdays.length() ; x++)
                     {
                         if (existingdays.charAt(x) == 'T')
                             ++countT;
                     }
                     //MessageBox.Show("T COunt: " + countT);
                     if (countT < 2)
                         continue;
                 }

                 if (existingdays.contains("u") && Days[i].equals("S"))
                 {
                     int countT = 0;
                     for (int x = 0; x < existingdays.length(); x++)
                     {
                         if (existingdays.charAt(x) == 'S')
                             ++countT;
                     }
                     if (countT < 2)
                         continue;
                 }
                 

                 if (Days[i].equals(chosendays) || (chosendays.contains(Days[i]) && chosendays.length() > Days[i].length()))
                 {
                     
                     if (chosendays.contains("h") && Days[i].equals("T"))
                     {
                         int countT = 0;
                         for (int x = 0; x < chosendays.length(); x++)
                         {
                             if (chosendays.charAt(x) == 'T')
                                 ++countT;
                         }
                         //MessageBox.Show("T COunt: " + countT);
                         if (countT < 2)
                             continue;
                         else
                             return true;
                     }

                     if (chosendays.contains("u") && Days[i].equals("S"))
                     {
                         int countT = 0;
                         for (int x = 0; x < chosendays.length(); x++)
                         {
                             if (chosendays.charAt(x) == 'S')
                                 ++countT;
                         }
                         if (countT < 2)
                             continue;
                         else
                             return true;
                     }

                     //MessageBox.Show("Chosen Days: " + chosendays + " Day: " + Days[i]);
                     return true;

                 }
             }
         }
         return false;
     }

     public Boolean timeConflict(List<Schedule> schedules, String timeStart, String timeEnd, String days, String room  )
     {
    	 System.out.println("TimeStart: "+ timeStart+" TimeEnd: "+ timeEnd + "Days: "+ days +"Room: " + room);
         for(Schedule S: schedules)
    	 {
        	 System.out.println(S.getScheduleID()+"-"+ S.getSubjectCode()+" - TimeStart: "+ S.getLecTimeStart() +" TimeEnd: "+ S.getLecTimeEnd() + " Days: "+ S.getLecDays() +"Room: " + S.getLecRoom());
        	 System.out.println(S.getScheduleID()+"-"+ S.getSubjectCode()+ "- TimeStart: "+ S.getLabTimeStart() +" TimeEnd: "+ S.getLabTimeEnd() + " Days: "+ S.getLabDays() +"Room: " + S.getLabRoom());
             
        	 
        	 int endIndex = times.indexOf(S.getLecTimeEnd());
             int startIndex = times.indexOf(S.getLecTimeStart());
           
             //if S.endTime is empty and S.timeEnd is > sched.timeStart
             if (endIndex > 0 && (endIndex > times.indexOf(timeStart) || times.indexOf(timeStart) >= times.indexOf(timeEnd)))
             {
            	 
                 if ((times.indexOf(timeEnd) > startIndex || times.indexOf(timeStart) >= times.indexOf(timeEnd)))
                 {
                     if (daysConflict(S.getLecDays(), days))
                     {
                         //MessageBox.Show("Warning! Conflict on times and days found on schedules in this class.");
                         System.out.println(S.getScheduleID()+"-"+ S.getSubjectCode()+""  +"- Conflict on lecture Time");
                    	 //if(!S.getLecRoom().equals("") || S.getLecRoom().equals(room))
                        	 return true;
                     }
                 }
             }
            
             endIndex = times.indexOf(S.getLabTimeEnd());
             startIndex = times.indexOf(S.getLabTimeStart());
             
             //Lab Time
             if (endIndex > 0 && (endIndex > times.indexOf(timeStart) || times.indexOf(timeStart) >= times.indexOf(timeEnd)))
             {

                 if ((times.indexOf(timeEnd) > startIndex || times.indexOf(timeStart) >= times.indexOf(timeEnd)))
                 {
                     if (daysConflict(S.getLabDays(), days))
                     {
                         //MessageBox.Show("Warning! Conflict on times and days found on schedules in this class.");
                    	 System.out.println(S.getScheduleID()+"-"+ S.getSubjectCode()+"Conflict on laboratory Time");
                    	 //if(!S.getLabRoom().equals("") || S.getLabRoom().equals(room))
                        	 return true;
                     }
                 }
             }
         }
         return false;
     }


	
	
}
