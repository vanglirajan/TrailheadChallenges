public class AccountProcessor 
{
    @future
	public static void countContacts(Id[] accountIds)
     {
         Account[] contactsNoUpdatedAccounts= new Account[]{};
         for(Account acc : [select Id, 
                               		  Number_of_Contacts__c,
                                	  (select Id from Contacts)
                               from Account 
                               where Id IN :accountIds])
         {
			acc.Number_of_Contacts__c = acc.contacts != null && acc.contacts.size() > 0 ? acc.contacts.size() : 0;
            contactsNoUpdatedAccounts.add(acc);
         }
         upsert contactsNoUpdatedAccounts;
     }
}