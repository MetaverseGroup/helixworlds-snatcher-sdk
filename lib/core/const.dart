bool isProd = false;
// call this if you are setting the env of the sdk to production
void setToProduction() {
  isProd = true;
}

/// Reference
/// vUrl -> valor URL,
/// inventUrl -> inventory URL,
/// gathererUrl -> gatherer URL,
void setBaseSDKUrl(String gathererUrl, String inventUrl, String vUrl) {
  valorUrl = vUrl;
  baseUrl = gathererUrl;
  inventoryUrl = inventUrl;
}

String? baseUrl;
String? valorUrl;
String? inventoryUrl;
