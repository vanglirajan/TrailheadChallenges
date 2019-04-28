global class DailyLeadProcessor implements Schedulable
{
	global void execute(SchedulableContext ctx)
    {
        Lead[] leadsToUpdate = new Lead[]{};
        for(Lead lead : [select LeadSource from Lead where LeadSource = NULL OR LeadSource = '' Limit 200])
        {
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }
        upsert(leadsToUpdate);
    }
}