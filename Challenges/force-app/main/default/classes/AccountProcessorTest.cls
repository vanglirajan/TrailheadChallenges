@isTest (seeAllData = false)
public class AccountProcessorTest 
{
	public static Account account;
	
	public static void setupTestData() 
    { 
    	account = new Account(Name = 'Test Account ');
        insert account;
        
        Contact contact = new Contact (LastName = 'User' , AccountId = account.Id);
        insert contact;
    }
    
    @isTest public static void TestRestrictContact() 
    { 
    	setupTestData();
    	
    	Test.startTest();
    	AccountProcessor.countContacts(new Id[]{account.Id});
    	Test.stopTest();      
    }
}