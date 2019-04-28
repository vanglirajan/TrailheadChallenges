@isTest
public class ParkLocatorTest 
{
    @isTest static void testSoapCallout() 
    {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        string[] result = ParkLocator.country('India');
        System.assertEquals('park1', result[0]); 
    }
}