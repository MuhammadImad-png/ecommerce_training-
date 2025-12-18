import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/function/show_msg.dart';
import 'package:flutter_app_std/views/auth/cubit/authentication_cubit.dart';
import 'package:flutter_app_std/views/auth/logic/ui/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_std/views/auth/logic/ui/forgot_view.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/main_home_view.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_Arow_With_arow.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
// import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignupView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SignUpSuccess || State is GoogleSignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainHomeView()),
          );
        } else if (state is SignUpError) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: state is SignUpLoading
              ? const CircularProgressIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
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
                          const SizedBox(height: 30),
                          Image.asset(
                              "assets/images/undraw_mobile-log-in_0n4q.png"),
                          Card(
                            margin: const EdgeInsets.all(15),
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
                                    controller: _nameController,
                                    labelText: 'name',
                                    keybordType: TextInputType.name,
                                    isSecured: false,
                                    suffIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.person_sharp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  customTextFormField(
                                    controller: _emailController,
                                    labelText: 'Email',
                                    keybordType: TextInputType.emailAddress,
                                    isSecured: false,
                                    suffIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.email),
                                    ),
                                  ),
                                  const SizedBox(height: 31),
                                  customTextFormField(
                                    controller: _passwordController,
                                    labelText: 'Password',
                                    keybordType: TextInputType.visiblePassword,
                                    isSecured: true,
                                    suffIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.visibility_off_sharp),
                                    ),
                                  ),
                                  const SizedBox(height: 38),
                                  customRowWithArrowBtn(
                                    text: 'Sign Up',
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        context
                                            .read<AuthenticationCubit>()
                                            .registar(
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text);
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 38),
                                  customRowWithArrowBtn(
                                    text: "Sign UP With Google ",
                                    onTap: () {
                                      context
                                          .read<AuthenticationCubit>()
                                          .googleSignIn();
                                      // Future.delayed(
                                      //     const Duration(milliseconds: 200),
                                      //     () {
                                      //   Navigator.pushReplacement(
                                      //     // ignore: use_build_context_synchronously
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           MainHomeView(),
                                      //     ),
                                      //   );
                                      // });
                                    },
                                  ),
                                  const SizedBox(height: 38),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already Have an account?",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      customTextButton(
                                        text: "Login",
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginView()),
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
