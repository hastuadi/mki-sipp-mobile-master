import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/injector.dart';
import 'package:sipp_mobile/provider/splash_provider.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/view/splash_screen.dart';

void main() async {

  await registerDependency();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SplashProvider())
    ],
      builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      navigatorKey: AppNavigation.instance.navigatorKey,
      home: const SplashScreen(),
    );
  }
}