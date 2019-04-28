trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) 
{
    Task[] tasks = new Task[]{};
        
    for(Opportunity op : Trigger.New)
    {
        if(op.StageName == 'Closed Won')
        {
            Task task = new Task();
            task.Subject = 'Follow Up Test Task';
            task.Status = 'Open';
            task.Priority = 'Normal';
            task.WhatId = op.Id;
            tasks.add(task);
        }
    }
    
     if(tasks.size() > 0)
     {
         upsert tasks;
     }
}