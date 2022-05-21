public class EdDelCont {
      public List<Order__C> odd{ get; set; }
      public Boolean isEdit {get; set;}
      public String delId{ get; set; }
    public EdDelCont() {   
        LoadData();
}
           private void LoadData() {
           odd = [Select Name,Customer_Name__c,Email_Address__c,Phone_Number__c,Address__c,Product__c,Quantity__c,GST_INN__c,Status__c,Date_of_Order__c,Total_Price__c from Order__C limit 20];
}
           public void DeleteAccount(){
           system.debug('delId' + delId);
         Order__C ord = [select id,Name from Order__C where Id =:delId];
         if (ord != null) {
          Delete ord;
          LoadData();
}
}
}