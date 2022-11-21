import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utilities/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../services/auth.dart';
import '../../../utilities/routes.dart';
import '../../widgets/main_button.dart';
import '../../widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);

    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(authBase: auth, context),
      child: Consumer<AuthController>(
        builder: (_, value, __) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
            ),
            backgroundColor: ColorManager.backGround,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 46.0, horizontal: 32.0),
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
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 34, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        DefaultTextField(
                          controller: _emailController,
                          fNode: _emailFocusNode,
                          // onChanged: value.updateEmail,
                          onComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          inputType: TextInputType.emailAddress,
                          label: 'Email',
                          hint: 'Enter your email',
                          validateMessage: 'Enter valid Email',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultTextField(
                          controller: _passwordController,
                          fNode: _passwordFocusNode,
                          // onChanged: value.updatePassword,
                          inputType: TextInputType.visiblePassword,
                          label: 'Password',
                          hint: 'Enter your password',
                          validateMessage: 'Enter valid password',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Text('Forget your password?'),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MainButton(
                          text: 'LOGIN',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              value.loginWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Text('I have\'t an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.registerPageRoute);
                              },
                              child: const Text('Register'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 130,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or login with social account',
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
        },
      ),
    );
  }
}
