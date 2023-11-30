import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/auth_checker/presentation/bloc/auth_checker_bloc.dart';
import 'features/auth/signup/presentation/bloc/sign_up_bloc.dart';
import 'route/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return SignUpBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return AuthCheckerBloc();
          },
        ),
      ],
      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),

      ),
    );
  }
}
