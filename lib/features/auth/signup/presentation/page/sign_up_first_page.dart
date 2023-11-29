import '../../../../component/text/very_small_text.dart';
import 'package:go_router/go_router.dart';
import '../../../../component/appbar/defualt_appbar.dart';
import '../../../../component/buttom/google_btn.dart';
import '../../../../component/buttom/submit_button.dart';
import '../../../../component/drop_language/drop_language.dart';
import '../../../../component/page_sections/first_section.dart';
import '../../../../component/stay_organized_component/stay_component.dart';
import '../../../../component/condesion_policy/condesion_terms.dart';
import '../../../../route/app_routes.dart';
import 'package:flutter/material.dart';

class SignUpFirstPage extends StatefulWidget {
  const SignUpFirstPage({super.key});

  @override
  State<SignUpFirstPage> createState() => _SignUpFirstPageState();
}

class _SignUpFirstPageState extends State<SignUpFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Sign in', context, isBack: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FirstSection(
                title: 'Create your free account',
              ),
              Column(
                children: [
                  GoogleBTN(),
                  SizedBox(
                    height: 30,
                  ),
                  VerySmallText(body: 'or'),
                  SizedBox(
                    height: 30,
                  ),
                  SubmitButton(
                    'Continue with email',
                    isValid: true,
                    fun: () {context.pushNamed(AppRoutes.signUpSecPage);},
                  ),
                  PolicyTerms(),
                ],
              ),
              Column(
                children: [
                  DropLanguage(),
                  StayOrganizedComponent(),
                ],
              )
            ],
          ),
        ));
  }
}
