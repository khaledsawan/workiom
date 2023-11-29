import '../../../../component/input_text_form.dart/text_form_filed.dart';
import '../../../../component/text/small_text.dart';
import '../../../../component/validation%20list/valication_error_list.dart';
import '../../../../constant/color/colors.dart';
import '../../../common_forms/common_form.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../../../component/appbar/defualt_appbar.dart';
import '../../../../component/buttom/submit_button.dart';
import '../../../../component/page_sections/first_section.dart';
import '../../../../component/stay_organized_component/stay_component.dart';
import '../../../../route/app_routes.dart';
import '../bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpSecPage extends StatefulWidget {
  const SignUpSecPage({Key? key}) : super(key: key);

  @override
  State<SignUpSecPage> createState() => _SignUpSecPageState();
}

class _SignUpSecPageState extends State<SignUpSecPage> {
  double _strength = 0;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(EmailChangeUnFocus());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(PasswordChangeUnFocus());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  calculateError(List<ValidationError>? validationErrors) {
    if (validationErrors != null) {
      _strength =
          (validationErrors.where((error) => error.value == false).length) / 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar('', context, isBack: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstSection(
              title: 'Enter a strong password',
            ),
            BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state.status.isSuccess) {
                  context.goNamed(AppRoutes.home);
                }
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  calculateError(state.password.displayError);
                  return state.status.isInProgress
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : Form(
                    child: Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          SmallText(body: 'Your work email'),
                          TextFormFiled(
                            onChanged: (_) => context
                                .read<SignUpBloc>()
                                .add(EmailChange(email: _)),
                            suffixIcon: Icons.add_circle_outline,
                            iconData: 'assets/email.svg',
                            focusNode: _emailFocusNode,
                            initialValue: state.email.value,
                            suffixText: '',
                            hintText: 'e.g. joe@gmail.com',
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SmallText(body: 'Your password'),
                          TextFormFiled(
                            onChanged: (_) => context
                                .read<SignUpBloc>()
                                .add(PasswordChange(password: _)),
                            suffixIcon: Icons.remove_red_eye,
                            iconData: 'assets/change-password.svg',
                            focusNode: _passwordFocusNode,
                            initialValue: state.password.value,
                            suffixText: '',
                            hintText: '*****************',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: _strength,
                            backgroundColor: Colors.grey[300],
                            color: _strength < 2 / 5
                                ? Colors.grey
                                : _strength == 3 / 5 || _strength < 5 / 5
                                ? Colors.yellow
                                : _strength >= 5 / 5
                                ? AppColors.green
                                : AppColors.green,
                            minHeight: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PasswordValidationErrors(
                              validationErrors:
                              state.password.displayError != null ? state.password.displayError! : []),
                          SizedBox(
                            height: 35,
                          ),
                          SubmitButton(
                            'Confirm password',
                            isValid: context.select((SignUpBloc bloc) =>
                            bloc.state.email.isValid && _strength >= 1),
                            fun: () {context.pushNamed(AppRoutes.signUpThirdPage);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            StayOrganizedComponent(),
          ],
        ),
      ),
    );
  }
}
