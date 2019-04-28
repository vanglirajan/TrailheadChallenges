@isTest (seeAllData = false)
public class AddPrimaryContactTest 
{
    static Account[] nyAccounts;
    static Account[] caAccounts;
    static Contact tcontact;

    public static void setup() 
    {
        Account[] nyAccounts = new Account[]{};
        Account[] caAccounts = new Account[]{};
            
        for(integer i=0; i< 50 ; i++)
        {
            Account ny = new Account(Name = 'NY_' + i+1, BillingState = 'NY');
            nyAccounts.add(ny);
        }
        for(integer i=0; i< 50 ; i++)
        {
            Account ca = new Account(Name = 'CA_' + i+1, BillingState = 'CA');
            caAccounts.add(ca);
        }
          
        insert nyAccounts;
        insert caAccounts;
        
        tcontact = new Contact(LastName = 'User');
    }
    
    @isTest public static void TestRestrictContact() 
    { 
        setup();      
        AddPrimaryContact apt = new AddPrimaryContact(tcontact, 'CA');
        
    	Test.startTest();  
        system.enqueueJob(apt);
		Test.stopTest();      
        
        Contact[] cts = [select Account.Name, Name From Contact];
        system.assertEquals(50, cts.size());
    	
        
    }
}