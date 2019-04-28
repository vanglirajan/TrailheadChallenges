public class AddPrimaryContact implements Queueable
{
    public string state;
    public Contact tcontact;
    
    public AddPrimaryContact(Contact scontact, String state)
    {
        this.tcontact = scontact;
        this.state = state;
    }
	public void execute(QueueableContext ctxt)
    {       
        Contact[] newContacts = new Contact[]{};
        Account[] accounts = [select BillingState From Account WHERE BillingState = 'NY'];
   
        for(Account acc : accounts)
        {
            Contact contactToInsert = this.tcontact.clone(false,false,false,false);
            contactToInsert.AccountId = acc.ID;
            newContacts.add(contactToInsert);
        }        
        Database.SaveResult[] lsr = Database.insert(newContacts);
    }
}