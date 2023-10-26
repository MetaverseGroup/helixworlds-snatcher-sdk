class ObjectUrl {
  const ObjectUrl._();

  static String getUrl(String item) {
    if (item.contains('p001')) {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    } else if (item.contains('p002')) {
      return 'https://northboundgear.co/collections/mens-waterproof-pants/products/outdoor-waterproof-pants';
    } else if (item.contains('p003')) {
      // return 'https://google.com';
      return 'https://mvgapparel.myshopify.com/products/mvg-t-shirt';
    } else if(item.contains("p010")) {
      return "https://www.circlek.com";
    } else {
      return 'https://polysleep.ca/?esl-k=google-ads%7Cng%7Cc627335090052%7Cmb%7Ckpolysleep%7Cp%7Ct%7Cdc%7Ca105306157164%7Cg10444348233&gad=1&gclid=CjwKCAjw6eWnBhAKEiwADpnw9iQO2Gs7PRf9_1T4mvkyygyO8tlTmP_lEbAgDFam_8WfqOb4T6uj6hoCDkYQAvD_BwE';
    }
  }
}
