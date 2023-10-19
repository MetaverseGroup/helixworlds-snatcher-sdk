class ObjectImage {
  const ObjectImage._();

  static String getImage(String item) {
    if (item.contains('p001')) {
      return 's_cow.svg';
    } else if (item.contains('p002')) {
      return 's_pants.svg';
    } else if (item.contains('p003')) {
      return 's_shirt.svg';
    } else if (item.contains('p004')) {
      return 's_woolen.svg';
    } else if (item.contains('p005')) {
      return 's_metaverse.svg';
    } else if (item.contains('p006')) {
      return 's_hulks.svg';
    } else if (item.contains('p007')) {
      return 's_polysleep.svg';
    } else if (item.contains('p008')) {
      return 's_polysleep.svg';
    } else if (item.contains('p009')) {
      return 's_polysleep.svg';
    } else {
      return '';
    }
  }
}
