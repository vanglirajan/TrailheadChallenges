public class AccountHandler 
{
	public static Account insertNewAccount(string accountName)
    {
        Account account;
        
        if(!string.isBlank(accountName))
        {
            account = new Account(Name = accountName);
            Insert account;
        }
        
        return account;
    }
}