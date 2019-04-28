@isTest (seeAllData = false)
public class UnitOfWorkTest 
{
    @isTest public static void challengeComplete() 
    { 
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
                    new Schema.SObjectType[] {
                        Account.SObjectType,
                        Contact.SObjectType,
                        Note.SObjectType
                    }
        );

        for(integer accountIndex = 0 ; accountIndex < 100; accountIndex++)
        {
            Account account = new Account(Name = 'Test Account_' + accountIndex);
            uow.registerNew(account);

            for(integer contactIndex = 0 ; contactIndex < 5; contactIndex++)
            {   
                Contact contact = new Contact (LastName = account.Name + '_Contact_' + contactIndex);
                uow.registerNew(contact, Schema.SObjectType.Contact.fields.AccountId.getSobjectField(), account);

                note note = new note();
                note.body='More info about Note'; 
                note.title= 'Notes for ' + contact.LastName ; 
                note.isPrivate=false; 
                 uow.registerNew(note);
                 uow.registerRelationship(note, Schema.SObjectType.Note.fields.ParentId.getSobjectField(), contact);
            }
        }

        uow.commitWork();

    	System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());      
    }
}