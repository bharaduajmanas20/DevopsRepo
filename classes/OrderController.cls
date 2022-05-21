public class OrderController {
    public Order__c ord{get;set;}
    public OrderController(){
        ord= new Order__c();
    }
     public PageReference CancelOrder()
    {
        PageReference pageRef = new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/Order_Details');
        pageRef.setRedirect(true);
        return pageRef;
    }
         public PageReference saveOrder()
    {
        Database.saveResult res = Database.insert(ord,false);
        
        if(res.isSuccess())
        {         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,
                                                    'Order Inserted') ); 
            PageReference ord=new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/Order_Details');
          
            return ord;
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