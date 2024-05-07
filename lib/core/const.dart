bool isProd = false;
// call this if you are setting the env of the sdk to production
void setToProduction(){
  isProd = true;
}
void setBaseSDKUrl(String gathererUrl, String inventUrl){
  baseUrl = gathererUrl;
  inventoryUrl = inventUrl;
}
String? baseUrl;
String? inventoryUrl;









