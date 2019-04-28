@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource 
{
	@HttpPost
    global static void closeCase(String reason)
	{
		RestRequest req = RestContext.Request;
		string[] uriparams = req.requestURI.split('/');
		Id caseId = uriparams[2];
		CaseService.closeCases(new set<Id>{caseId},reason);
	}    
}