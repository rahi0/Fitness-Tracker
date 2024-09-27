import 'package:fitness_tracker/utils/translation/languages/en.dart';
import 'package:get/get.dart';

abstract class AppTranslation extends Translations {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": EnLanguage().en,
  };
}
