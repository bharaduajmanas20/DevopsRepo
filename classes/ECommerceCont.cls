public class ECommerceCont {
public PageReference product(){
PageReference pr=new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/New_Product');
return pr;
}
public PageReference order(){
PageReference pr=new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/New_Order');
return pr;
}
}