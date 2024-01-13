import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yitirdim/Screens/OnboardingScreen/onboarding_screen.dart';
import 'package:yitirdim/Services/localizations/translations.dart';
import 'package:yitirdim/Theme/theme/dark_theme.dart';
import 'package:yitirdim/Theme/theme/light_theme.dart';
import 'package:yitirdim/Theme/theme/theme_service.dart';

import 'Screens/BottomNavBar/bottomNavBar_screen.dart';

var initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('api');
  Box dataBox = Hive.box('api');
  print(dataBox.get('accessToken'));
  initScreen = dataBox.get('onboardingComplete');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Box langBox = Hive.box('api');
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightThemeConst().lightTheme,
      darkTheme: DarkThemeConst().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      fallbackLocale: Locale('tkm'),
      locale: langBox.get('lancode') != null
          ? Locale(langBox.get('lancode'))
          : Locale('tkm'),
      translations: AppTranslations(),
      home: initScreen == null ? OnboardingScreen() : BottomNavBarView(),
    );
  }
}
