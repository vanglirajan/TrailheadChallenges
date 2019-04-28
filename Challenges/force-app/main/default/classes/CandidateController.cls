public with sharing class CandidateController 
{
    public CandidateController() 
    {
        
    }

    public static CandidateModel getCandidateInfo(string candidateId)
    {
        CandidateModel candidateInfo = new CandidateModel();
        Candidate__c[] candidates = [select Name,
                                        First_Name__c,
                                        Last_Name__c,
                                        Education__c,
                                        City__c
                                    From  Candidate__c
                                    where Name =: candidateId Limit 1];
        if(candidates.size() >0)
        {
            candidateInfo = new CandidateModel(candidates[0]);
        }
    
        return candidateInfo;
    }

    public class CandidateModel 
    {   
        public string id;
        public string name;
        public string education;
        public string city;

        public CandidateModel() 
        {
        }
        public CandidateModel(Candidate__c candidateRecord) 
        {
            id = candidateRecord.Name;
            name = candidateRecord.First_Name__c + ' ' + candidateRecord.Last_Name__c;
            education = candidateRecord.Education__c;
            city = candidateRecord.City__c;
        }
    }
}