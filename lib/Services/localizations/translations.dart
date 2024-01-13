import 'package:get/get.dart';
import 'package:yitirdim/Services/localizations/ru_locale.dart';
import 'package:yitirdim/Services/localizations/tkm_locale.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'ru': RuLocale.ru,
        'tkm': TkmLocale.tkm,
      };
}
