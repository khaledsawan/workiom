import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/Home/presentation/pages/home_screen.dart';
import '../features/signup/presentation/page/sign_up_first_page.dart';
import '../features/signup/presentation/page/sign_up_page.dart';
import '../features/signup/presentation/page/sign_up_sec_page.dart';
import '../features/signup/presentation/page/sign_up_third_page.dart';

class AppRoutes {
  static const home = 'home';
  static const loginPage = 'loginPage';
  static const signUpPage = 'signupPage';
  static const signUpFirstPage = 'signupFirstPage';
  static const signUpSecPage = 'signupSecondPage';
  static const signUpThirdPage = 'signupThirdPage';

  static animatedPage(BuildContext context, GoRouterState state, Widget widget) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: '/signUp',
    navigatorKey: GlobalKey<NavigatorState>(),
    errorBuilder: (BuildContext context, GoRouterState state) {
      return SignUpPage();
    },

    routes: [
      GoRoute(
        name: home,
        path: '/',
        builder: (context, state) => HomeScreen(),
        pageBuilder: (context, state) {
          return animatedPage(context, state, HomeScreen());
        },
      ),
      GoRoute(
          name: signUpPage,
          path: '/signUp',
          pageBuilder: (context, state) {
            return animatedPage(context, state, SignUpFirstPage());
          },
          routes: [
            GoRoute(
              name: signUpFirstPage,
              path: 'first',
              pageBuilder: (context, state) {
                return animatedPage(context, state, SignUpFirstPage());
              },
            ),
            GoRoute(
              name: signUpSecPage,
              path: 'second',
              pageBuilder: (context, state) {
                return animatedPage(context, state, SignUpSecPage());
              },
            ),
            GoRoute(
              name: signUpThirdPage,
              path: 'third',
              pageBuilder: (context, state) {
                return animatedPage(context, state, SignUpThirdPage());
              },
            ),
          ]),
    ],
    //TODO
    redirect: (BuildContext context, GoRouterState state) {
      //  final isAuthenticated = getIt<SharedPreferences>().containsKey(AppApiUrl.TOKEN);
      // if (!isAuthenticated) {
      //   return '/signUp';
      // } else {
      return null;
      //  }
    },
  );
}
