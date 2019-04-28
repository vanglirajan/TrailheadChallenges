public class ContactAndLeadSearch 
{
	public static List<List<SObject>> searchContactsAndLeads(String keyword)
    {
        List<List<SObject>> results = new List<List<SObject>>{};
        
        results  = [FIND :keyword IN ALL FIELDS
                	   Returning Contact(FirstName,LastName), Lead(FirstName, LastName)];
            
        return results;
    }
}