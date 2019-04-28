trigger AccountAddressTrigger on Account (before insert, before update) 
{   
    for(Account acc : Trigger.New)
    {
        if(acc.Match_Billing_Address__c && acc.BillingPostalCode != null)
        {
            acc.ShippingCity = acc.BillingCity; 
			acc.ShippingCountry = acc.BillingCountry;
			acc.ShippingPostalCode = acc.BillingPostalCode;
			acc.ShippingState = acc.BillingState;
			acc.ShippingStreet = acc.BillingStreet;
        }
    } 
    
    List<Account> acctsWithOpps = 
        [SELECT Id,(SELECT Id,Name,CloseDate FROM Opportunities) 
         FROM Account WHERE Id IN :Trigger.New];
    
    if(acctsWithOpps.size() > 0)
    {
    	Opportunity[] ops = acctsWithOpps[0].Opportunities;
    }
}