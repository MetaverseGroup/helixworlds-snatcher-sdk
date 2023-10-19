class ObjectImage {
  const ObjectImage._();

  static String getImage(String item) {
    if (item.contains('p001')) {
      return 's_cow.png';
    } else if (item.contains('p002')) {
      return 's_pants.png';
    } else if (item.contains('p003')) {
      return 's_shirt.png';
    } else if (item.contains('p004')) {
      return 's_woolen.png';
    } else if (item.contains('p005')) {
      return 's_metaverse.png';
    } else if (item.contains('p006')) {
      return 's_hulks.png';
    } else if (item.contains('p007')) {
      return 's_polysleep.png';
    } else if (item.contains('p008')) {
      return 's_polysleep.png';
    } else if (item.contains('p009')) {
      return 's_polysleep.png';
    } else {
      return '';
    }
  }
}
