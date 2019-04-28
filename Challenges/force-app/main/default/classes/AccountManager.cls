@RestResource(urlMapping='/Account/*/contacts')
global class AccountManager 
{
	@HttpGet
    global static Account  getAccount() 
    {
		RestRequest request = RestContext.request;

        string[] parts = request.requestURI.split('/');
        Account ac =  [SELECT Id, Name,(select Id, Name from Contacts)
                       FROM Account
                       WHERE Id = :parts[parts.size()-2]];
        return ac;
    }
}