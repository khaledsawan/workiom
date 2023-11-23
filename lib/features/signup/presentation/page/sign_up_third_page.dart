import 'package:clean_architecture_flutter/component/input_text_form.dart/text_form_filed.dart';
import 'package:clean_architecture_flutter/component/text/small_text.dart';
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

class SignUpThirdPage extends StatefulWidget {
  const SignUpThirdPage({Key? key}) : super(key: key);

  @override
  State<SignUpThirdPage> createState() => _SignUpThirdPageState();
}

class _SignUpThirdPageState extends State<SignUpThirdPage> {
  final _workSpaceFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _workSpaceFocusNode.addListener(() {
      if (!_workSpaceFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(WorkSpaceChangeUnFocus());
        FocusScope.of(context).requestFocus(_firstNameFocusNode);
      }
    });
    _firstNameFocusNode.addListener(() {
      if (!_firstNameFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(FirstNameChangeUnFocus());
        FocusScope.of(context).requestFocus(_lastNameFocusNode);
      }
    });
    _lastNameFocusNode.addListener(() {
      if (!_lastNameFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(LastNameChangeUnFocus());
      }
    });
  }

  @override
  void dispose() {
    _workSpaceFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    super.dispose();
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
              title: 'Enter your company name',
            ),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
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
                              SmallText(body: 'Your company or team name'),
                              TextFormFiled(
                                onChanged: (_) => context
                                    .read<SignUpBloc>()
                                    .add(WorkSpaceChange(workSpace: _)),
                                iconData: 'assets/team.svg',
                                focusNode: _workSpaceFocusNode,
                                initialValue: state.workSpace.value,
                                suffixText: '.workiom.com',
                                hintText: 'Workspace name*',
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SmallText(body: 'Your first name'),
                              TextFormFiled(
                                onChanged: (_) => context
                                    .read<SignUpBloc>()
                                    .add(FirstNameChange(firstName: _)),
                                iconData: 'assets/list.svg',
                                focusNode: _firstNameFocusNode,
                                initialValue: state.firstName.value,
                                suffixText: '',
                                hintText: 'Enter your First name',
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SmallText(body: 'Your last name'),
                              TextFormFiled(
                                onChanged: (_) => context
                                    .read<SignUpBloc>()
                                    .add(LastNameChange(lastName: _)),
                                iconData: 'assets/list.svg',
                                focusNode: _lastNameFocusNode,
                                initialValue: state.lastName.value,
                                suffixText: '',
                                hintText: 'Enter your Last name',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              SubmitButton(
                                'Create Workspace',
                                isValid: context.select((SignUpBloc bloc) => bloc.state.isValid),
                                fun: () {context.pushNamed(AppRoutes.home);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
            StayOrganizedComponent(),
          ],
        ),
      ),
    );
  }
}
