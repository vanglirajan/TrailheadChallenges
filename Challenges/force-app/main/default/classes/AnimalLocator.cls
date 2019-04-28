public class AnimalLocator 
{
	public static String getAnimalNameById(Integer id)
    {
        String name = '';
		
        HttpResponse animalNameResponse = callAnimalService(id);
        if(animalNameResponse.getStatusCode() == 200)
        {
        	Map<string,Object> result = (Map<string,Object>)JSON.deserializeUntyped(animalNameResponse.getBody());
        	Map<string,Object> animalInfo = (Map<String,Object>)result.get('animal');
            name = (string)animalInfo.get('name');
        }
        return name;
    }
    
    public static HttpResponse callAnimalService(Integer id)
    {
        Http animalNameHttp = new Http();

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setMethod('GET');
        
        return animalNameHttp.send(req);
    }
}