import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/firebase/firebase_options.dart';
import 'package:oracle_digital/presentation/providers/app_bloc_providers.dart';
import 'package:oracle_digital/presentation/providers/app_repo_providers.dart';
import 'package:oracle_digital/presentation/screens/auth/logget_out_screen.dart';
import 'package:oracle_digital/presentation/screens/auth/login_screen.dart';
import 'package:oracle_digital/presentation/screens/main_navigation_screen.dart';
import 'package:oracle_digital/presentation/screens/auth/register_screen.dart';
import 'package:oracle_digital/presentation/screens/auth/sign_up_screen.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Здравствуйте, добрый день!

// Хочу выразить благодарность за возможность выполнить это тестовое задание. Я приложил максимум усилий и сделал всё возможное за последние 12 часов, так как ранее у меня не было достаточно времени. Приношу извинения за возможные ошибки в коде, так как работал над заданием без перерыва и даже не спал всю ночь.
//Буду очень признателен, если вы внимательно оцените мою работу. Я постарался оптимизировать код, чтобы избежать повторений, и оставил комментарии в ключевых местах для лучшего понимания.
// С уважением,
// Орозбек

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repositoryProviders = buildAppProviders(
      buildAppBlocProviders(
        context,
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColor.white,
                inputDecorationTheme: const InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColor.black,
                      ),
                      borderRadius: BorderRadius.zero),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColor.black,
                      ),
                      borderRadius: BorderRadius.zero),
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColor.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: AppColor.black),
                ),
              ),
              home: FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder:
                      (context, AsyncSnapshot<SharedPreferences> snapshot) {
                    if (snapshot.hasData) {
                      bool isLoggedIn =
                          snapshot.data?.getBool('isLoggedIn') ?? false;
                      return isLoggedIn
                          ? const MainNavigationScreen()
                          : const LoggetOutScreen();
                    }
                    return const CircularProgressIndicator();
                  }),
              routes: {
                '/login_screen': (context) => const LoginScreen(),
                '/register_screen': (context) => const RegisterScreen(),
                '/sign_up_screen': (_) => const SingUpScreen(),
                '/main_navigation_screen': (_) => const MainNavigationScreen(),
              },
            );
          },
        ),
      ),
    );
    return repositoryProviders;
  }
}
