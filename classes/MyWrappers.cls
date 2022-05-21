public class MyWrappers {
 public Account acWrap{get;set;}
    public boolean isSelected{get;set;}
    
    public MyWrappers(Account acWrap)// exposing it 
    {
        this.acWrap=acWrap;
        isSelected=false;
    }
}