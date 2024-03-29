bool isProd = false;
// call this if you are setting the env of the sdk to production
void setToProduction(){
  isProd = true;
}
String baseUrl = isProd ? "https://gatherer.helixworlds.io" : "https://gatherer.d.helixworlds.io";
// const String baseUrl = isProd ? "http://192.168.254.102:3000" : "https://gatherer.d.helixworlds.io";
String inventoryUrl = isProd ? "" : "https://localhost:8080/dev/api";









