trigger units on Order__c (after insert,after update,after delete,after undelete) {
List<id> idList = new List<id> ();
if(trigger.isinsert || trigger.isundelete){
    for(Order__c ord : Trigger.new){
       idList.add(ord.Product__c);
}
      Map<id,Our_Product__c> prodMap = new Map<id, Our_Product__c>([select id,Units_Available__c from Our_Product__c where id in :idList]);
      for(Order__c oc : Trigger.new )
{
      Our_Product__c prod = prodMap.get(oc.Product__c);
      if(prod.Units_Available__c>= oc.Quantity__c){
      prod.Units_Available__c = prod.Units_Available__c-oc.Quantity__c;
      update prodMap.values();
}
  else{
  Order__c var = Trigger.newMap.get(oc.id);
  var.Quantity__c.addError('Quantity is exceeding the total number of units available!');
}
}
}
   Else if(trigger.isdelete){
   for(Order__c itr : Trigger.old){
   idList.add(itr.Product__c);
}
   Map<id,Our_Product__c> proMap = new Map<id, Our_Product__c>([select id,Units_Available__c from Our_Product__c where id in :idList]);
   for(Order__c itr1 : Trigger.old )
{
   Our_Product__c pro = proMap.get(itr1.Product__c);
   pro.Units_Available__c = pro.Units_Available__c+ itr1.Quantity__c;
}
   update proMap.values();
}
   Else if(trigger.isupdate){
   List<id> updateid = new List<id> ();
   List<order__c> orderList = [select id,Product__c,Quantity__c from Order__c where id in:Trigger.new ];
   for(Order__c itr2 : orderList){
   updateid.add(itr2.Product__c);
}
   Map<id,Our_Product__c> productmap = new Map<id, Our_Product__c>([select id,Units_Available__c from Our_Product__c where id in :updateid]);
   for(Order__c itr3 : orderList)
{
   Our_Product__c pr = productMap.get(itr3.Product__c);
   Order__c oldd = Trigger.oldmap.get(itr3.id);
   pr.Units_Available__c = pr.Units_Available__c - ( itr3.Quantity__c - oldd.Quantity__c );
}
   update productmap.values();
}
}