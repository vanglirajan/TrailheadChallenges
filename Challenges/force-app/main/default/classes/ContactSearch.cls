public class ContactSearch 
{
	public static List<Contact> searchForContacts(String lastName, String mailingPostalCode)
    {
        Contact[] mcs =new Contact[]{};
        for(Contact c : [select Id, Name from Contact where LastName =: lastName AND  MailingPostalCode =:mailingPostalCode ])
        {
            mcs.add(c);
        }
        return mcs;
    }
}