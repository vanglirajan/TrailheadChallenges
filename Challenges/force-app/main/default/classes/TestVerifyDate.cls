@isTest (seeAllData = false)
public class TestVerifyDate 
{  
    @isTest static void TestVerifyDate() 
    { 
       Date date1 =  Date.newInstance(2019, 2, 16);
       Date date2 =  Date.newInstance(2019, 3, 17);     
       Date date3 =  Date.newInstance(2019, 4, 01);
       Date date4 =  Date.newInstance(2019, 4, 20);      
       Date lastDayOfMarch = Date.newInstance(2019, 3, 31);
        
       //within30 days
       system.assertEquals(date3, VerifyDate.CheckDates(date2,date3));
       
        //more than 30 days
       system.assertEquals(lastDayOfMarch, VerifyDate.CheckDates(date2,date4));
        
        //date2 in the past
        system.assertEquals(lastDayOfMarch, VerifyDate.CheckDates(date2,date1));
    }
}