import 'package:flutter_test/flutter_test.dart';
import 'package:helixworlds_snatcher_sdk/utils/object_url.dart';

main() {
  group("testing method getUrl", () {
    test("success p003", () {
      var result = ObjectUrl.getUrl("p003");
      expect(result, "https://shop.helixworlds.io/products/mvg-t-shirt");
    });
  });
}
