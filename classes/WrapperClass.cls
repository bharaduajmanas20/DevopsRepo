public class WrapperClass {
    public Our_Product__c prodWrap{get;set;}
    public boolean isSelected{get;set;}

    public WrapperClass(Our_Product__c prodWrap)
{
             this.prodWrap= prodWrap;
              isSelected=false;
}
}