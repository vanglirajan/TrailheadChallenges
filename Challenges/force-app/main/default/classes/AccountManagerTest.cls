@isTest
public class AccountManagerTest 
{	
    static Account acc;
    public static void setupData()
    {
         acc = new Account(Name = 'NY', BillingState = 'NY');
         insert acc;
         
         Contact c= new Contact(LastName = 'raj', AccountId = acc.Id);
         insert c;
    }
    @isTest static void testSoapCallout() 
    {     
        setupData();
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na91.salesforce.com/services/apexrest/Account/'
            + acc.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account a = AccountManager.getAccount();
        
        system.assertEquals(true, a != null);
        
    }
}