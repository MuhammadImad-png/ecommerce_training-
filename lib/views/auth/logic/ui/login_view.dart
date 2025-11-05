import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/function/navigate_without_back.dart';
import 'package:flutter_app_std/core/function/show_msg.dart';
import 'package:flutter_app_std/views/auth/logic/signup_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_std/views/auth/logic/ui/forgot_view.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/main_home_view.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_Arow_With_arow.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool PasswordisHideen = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess || State is GoogleSignInSuccess) {
          navigateWithBack(context, MainHomeView());
        } else if (state is LoginError) {
          showMsg(context, state.messege);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: state is LoginLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 18),
                          const Text(
                            "Welcome To Our Market ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Image.asset(
                            "assets/images/undraw_mobile-log-in_0n4q.png",
                            // height: 200,
                            // width: 900,
                            // fit: BoxFit.contain,
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 12),
                                  customTextFormField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    keybordType: TextInputType.emailAddress,
                                    isSecured: false,
                                    suffIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.person_sharp),
                                    ),
                                  ),
                                  const SizedBox(height: 31),
                                  customTextFormField(
                                    controller: passwordController,
                                    labelText: 'Password',
                                    keybordType: TextInputType.visiblePassword,
                                    isSecured: PasswordisHideen,
                                    suffIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          PasswordisHideen = !PasswordisHideen;
                                        });
                                      },
                                      icon: Icon(PasswordisHideen
                                          ? Icons.visibility_off_sharp
                                          : Icons.visibility),
                                    ),
                                  ),
                                  const SizedBox(height: 31),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      customTextButton(
                                        text: "Forgot password?",
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotView(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 38),
                                  customRowWithArrowBtn(
                                    text: 'Login',
                                    onTap: () {
                                      cubit.login(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    },
                                  ),
                                  const SizedBox(height: 38),
                                  customRowWithArrowBtn(
                                    text: "Login With Google ",
                                    onTap: () => cubit.googleSignIn(),
                                    // {
                                    //   Future.delayed(
                                    //       const Duration(milliseconds: 200),
                                    //       () {
                                    //     Navigator.pushReplacement(
                                    //       // ignore: use_build_context_synchronously
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MainHomeView(),
                                    //       ),
                                    //     );
                                    //   });
                                    // },
                                  ),
                                  const SizedBox(height: 38),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Don't Have an account?",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      customTextButton(
                                        text: "SignUp",
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupView()),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
