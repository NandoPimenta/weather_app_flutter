enum ImageTag {
  logo,
}

class StaticImageTag {
  static const _logo = 'assets/logos/logo.png';

  static getAssetImage({required ImageTag tag}) {
    switch (tag) {
      case ImageTag.logo:
        return _logo;

      default:
        return _logo;
    }
  }
}
