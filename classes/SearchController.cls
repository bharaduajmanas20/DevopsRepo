public class SearchController {
   public String productName{get;set;}    
    public List<Our_Product__c> prod{get;set;}
     public void doSearch()
    {
        String s ='%' + productName + '%';
        prod = [select name,List_of_Products__c,Approval_Status__c,Cost_of_Products__c,Brand_Names__c,Models__c from Our_Product__c where name like :s];
    }   
}