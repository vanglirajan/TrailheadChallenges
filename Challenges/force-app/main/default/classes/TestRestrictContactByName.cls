@isTest (seeAllData = false)
public class TestRestrictContactByName 
{
	 @isTest static void TestRestrictContact() 
    { 
       Contact contact = new Contact(LastName = 'INVALIDNAME');
       
       Database.SaveResult res = Database.insert(contact, true) ;
        
       system.assertEquals(res.isSuccess(),false);
        
    }
}