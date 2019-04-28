public with sharing class CaseService 
{
    public static void closeCases(set<id> caseIds, String closeReason)
    {
    	Case[] cases = new Case[]{};
    	for(Case c:  [select Reason,Status from Case where Id IN :caseIds])
    	{
    		c.Status='Closed';
    		c.Reason=closeReason;
    		cases.add(c);
    	}
    	
    	if(cases.size() > 0)
    	{
    		upsert cases;
    	}
    }
}