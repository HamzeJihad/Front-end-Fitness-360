// ignore_for_file: constant_identifier_names

class ConfigURL {
  static const PROJETOSOFTWARE = '{PROJETOSOFTWARE}';
  static const DIGITALTWIN = '{DIGITALTWIN}';

  Future<String?> url(String value) async {
    switch (value) {
      case PROJETOSOFTWARE:
        return 'https://deploy-fitness360-oibsq9txo-guihme.vercel.app/';

      case DIGITALTWIN:
        return 'https://deploy-fitness360-oibsq9txo-guihme.vercel.app/pessoas';

      default:
        return '';
    }
  }
}
