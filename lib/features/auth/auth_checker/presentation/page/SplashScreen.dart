import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../component/snack_bar/error_snack_bar.dart';
import '../../../../../route/app_routes.dart';
import '../bloc/auth_checker_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCheckerBloc, AuthCheckerState>(
        listener: (context, state) {
          if (state is AuthCheckerFail) {
            ErrorSnackBar(context);
          } else if (state is AuthCheckerLoaded) {
            if (state.user.result?.user == null &&
                state.user.result?.tenant == null) {
              context.pushReplacementNamed(AppRoutes.signUpSecPage);
            }else{
              context.pushReplacementNamed(AppRoutes.home);
            }
          }
        },
        builder: (context, state) {
          if (state is AuthCheckerInitial) {
            context.read<AuthCheckerBloc>().add(const CheckAuthChecker());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
