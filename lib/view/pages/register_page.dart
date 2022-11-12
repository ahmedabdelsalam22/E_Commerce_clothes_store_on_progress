import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/color_manager.dart';
import '../../utilities/routes.dart';
import '../widgets/main_button.dart';
import '../widgets/text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ColorManager.backGround,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  DefaultTextField(
                    controller: _nameController,
                    inputType: TextInputType.name,
                    label: 'Name',
                    hint: 'Enter your Name',
                    validateMessage: 'Enter valid Name',
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DefaultTextField(
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    label: 'Email',
                    hint: 'Enter your email',
                    validateMessage: 'Enter valid Email',
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  DefaultTextField(
                    controller: _passwordController,
                    inputType: TextInputType.visiblePassword,
                    label: 'Password',
                    hint: 'Enter your password',
                    validateMessage: 'Enter valid password',
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      const Text('I already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.loginPageRoute);
                        },
                        child: const Text('Login'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  MainButton(
                    text: 'SIGN UP',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or sign up with social account',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: ColorManager.primary,
                            )),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(FontAwesomeIcons.facebookF,
                                color: ColorManager.primary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
