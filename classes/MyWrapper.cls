public class MyWrapper {
    public Our_Product__c prodWrap{get;set;}
    public boolean isSelected{get;set;}
    
    public MyWrapper(Our_Product__c prodWrap)
    {
        this.prodWrap=prodWrap;
        isSelected=false;
    }
}