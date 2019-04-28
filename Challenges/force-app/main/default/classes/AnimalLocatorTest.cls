@isTest(seeAllData = false)
public class AnimalLocatorTest 
{
	@isTest static void testPostCallout() 
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
       
        string name = AnimalLocator.getAnimalNameById(1);
        
        System.assertEquals('bear',name);
    }	
}