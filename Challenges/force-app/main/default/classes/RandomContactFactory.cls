public class RandomContactFactory 
{
     public static Contact[] generateRandomContacts(integer totalNumberRec , String lastName)
     {
         Contact[] generatedContacts = new Contact[]{};
         for(integer num = 1 ; num <= totalNumberRec ; num++)
         {
			Contact con = new Contact(FirstName = 'Contact_' + num ,LastName = lastName);
            generatedContacts.add(con);
         }
         return generatedContacts;
     }
}