import 'package:clean_architecture_flutter/features/signup/presentation/page/sign_up_first_page.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const SignUpFirstPage();
  }
}
