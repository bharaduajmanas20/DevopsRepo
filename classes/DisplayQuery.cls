public class DisplayQuery {
    public Our_Product__c produ{get;set;}
    public List<Our_Product__c>prod{get;set;}
    public List<WrapperClass>lstWrap{get;set;}
     public string recId{get;set;} 
    public Boolean isEdit {get; set;}
    public String productName{get;set;}
      public DisplayQuery()
      {
          produ = new Our_Product__c();
          lstWrap=new List<WrapperClass>();
           loadProd();
       }
    public void loadProd()
    {
         prod = [select name,List_of_Products__c,Approval_Status__c,Cost_of_Products__c,Brand_Names__c,Models__c,Units_Available__c from Our_Product__c];
        lstWrap.clear();
        for(Our_Product__c a : prod){
         WrapperClass w = new WrapperClass(a);
          lstWrap.add(w);
    }
 }
     public PageReference doEdit()
    {
        produ = [select name,List_of_Products__c,Approval_Status__c,Cost_of_Products__c,Brand_Names__c,Models__c,Units_Available__c from Our_Product__c where id=:recId];
        PageReference pageRef = new PageReference('https://mirketasoftwarepvtltd-f-dev-ed--c.visualforce.com/apex/Product_Detail?core.apexpages.request.devconsole=1');
        pageRef.setRedirect(true);
        return pageRef;
    }
        public void doDelete()
    {
        List<Our_Product__c> ProdToBeDeleted =new List<Our_Product__c>();
        for(WrapperClass mw : lstWrap)
        {
            if(mw.isSelected)
            {
                ProdToBeDeleted.add(mw.prodWrap);
            }            
        }
        List<Database.DeleteResult> dd = Database.delete(ProdToBeDeleted,false);
        for(Database.DeleteResult rs : dd)
        {
         if(rs.isSuccess())
        {         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,
                                                    'Product Deleted') );             
         loadProd();
        }
        else{
            List<Database.Error> errs= rs.getErrors();
            for(Database.Error err : errs)
            {
            	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,err.getMessage()) );  
            }
       	 }
        }     
      }
    public void doSearch()
    {
        String s ='%' + productName + '%';
       prod = [select name,List_of_Products__c,Approval_Status__c,Cost_of_Products__c,Brand_Names__c,Models__c,Units_Available__c from Our_Product__c where name like :s];
    }   
}