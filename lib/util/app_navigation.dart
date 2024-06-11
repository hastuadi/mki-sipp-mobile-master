import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/util/cache_manager.dart';
import 'package:sipp_mobile/view/dashboard/bottom_nav_bar.dart';
import 'package:sipp_mobile/view/detector/detector_screen.dart';
import 'package:sipp_mobile/view/login/login_screen.dart';
import 'package:sipp_mobile/view/register/register_screen.dart';
import 'package:sipp_mobile/view/research/research_list_screen.dart';
import 'package:sipp_mobile/view/splash_screen.dart';

import '../view/research/research_detail_screen.dart';
import '../view/research/research_location_screen.dart';

class AppNavigation {
  AppNavigation._private();

  static AppNavigation instance = AppNavigation._private();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory AppNavigation() {
    return instance;
  }

  BuildContext? getContext() {
    return AppNavigation.navigatorKey.currentContext;
  }

  neglect({required String path}) {
    if(kIsWeb) {
      Router.neglect(AppNavigation.instance.getContext()!, () => AppNavigation.instance.getContext()!.go(path));
    } else {
      AppNavigation.instance.getContext()!.pushReplacement(path);
    }
  }

  push({required String path}) {
    if(kIsWeb) {
      Router.navigate(AppNavigation.instance.getContext()!, () => AppNavigation.instance.getContext()!.go(path));
    } else {
      AppNavigation.instance.getContext()!.push(path);
    }
  }

  pop<T extends Object?>([T? result])  {
    AppNavigation.instance.getContext()!.pop(result);
  }

  GoRouter route = GoRouter(
      routes: [
        GoRoute(
            name: "main",
            path: AppConstant.mainRoute,
          builder: (context, state) => const SplashBase(),
        ),
        GoRoute(
          name: "login",
          path: AppConstant.loginRoute,
          builder: (context, state) => const LoginBase(),
        ),
        GoRoute(
          name: "register",
          path: AppConstant.registerRoute,
          builder: (context, state) => const RegisterBase(),
        ),
        GoRoute(
          name: "dashboard",
          path: AppConstant.dashboardRoute,
          builder: (context, state) => const DashboardBottomNavBar(),
        ),
        GoRoute(
          name: "researchList",
          path: AppConstant.researchListRoute,
          builder: (context, state) => const ResearchListScreen(),
        ),
        GoRoute(
          name: "researchLocation",
          path: AppConstant.researchLocationRoute,
          builder: (context, state) => const ResearchLocationScreen(),
        ),
        GoRoute(
          name: "researchDetect",
          path: AppConstant.researchDetectRoute,
          builder: (context, state) => const DetectorScreen(),
        ),
        GoRoute(
          name: "researchDetail",
          path: AppConstant.researchDetailRoute,
          builder: (context, state) => ResearchDetail(
            researchId: int.parse(state.pathParameters["id"] ?? "0").toInt(),
          ),
        )
      ],
    debugLogDiagnostics: true,
    navigatorKey: AppNavigation.navigatorKey,
    redirect: (context, state) async {
      String? token = await CacheManager.instance.getUserToken();
      if((token == "" || token == null || token == " ") && (state.matchedLocation != AppConstant.registerRoute)) {
        return AppConstant.loginRoute;
      } else {
        return state.matchedLocation;
      }
    },
  );

}