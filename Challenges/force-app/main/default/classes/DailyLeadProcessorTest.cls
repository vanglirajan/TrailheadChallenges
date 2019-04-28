@isTest(seeAllData = false)
public class DailyLeadProcessorTest 
{
    public static void setupLeads()
    {
        Lead[] leads = new Lead[]{};
        for(integer i=0; i< 200 ; i++)
        {
            leads.add(new Lead(LastName = 'test_' + i+1, Company = 'Aethna Home Products'));
        }
        insert leads;
    }
    
    @isTest
    public static void testLeads()
    {
        setupLeads();
        string dummyCronExp = '0 0 0 15 3 ? 2022';
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        
        Test.startTest();
        system.Schedule('Lead Update',dummyCronExp,dlp );
        Test.stopTest();
        
        Lead[] leads = [select Id from Lead Where LeadSource = 'Dreamforce'];
        system.assertEquals(200, leads.size());
    }
}