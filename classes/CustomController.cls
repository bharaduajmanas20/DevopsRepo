public class CustomController {
 public Our_Product__c prod{get;set;}
    public CustomController(){
        prod= new Our_Product__c();
    }
    public PageReference Cancel()
    {
        PageReference pageRef = new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/page/home');
        pageRef.setRedirect(true);
        return pageRef;
    }
    public PageReference saveProduct()
    {
        Database.saveResult res = Database.insert(prod,false);
        
        if(res.isSuccess())
        {         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,
                                                    'Product Inserted') ); 
             PageReference prod=new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/Product_Details');
          
            return prod;
        }
        else{
 List<Database.Error> errs= res.getErrors();
            for(Database.Error err : errs)
            {
            	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,err.getMessage()) );  
            }
            return null;
        }
        
    }
    
}