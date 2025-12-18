import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/custom_circle_pro_ind.dart';
import 'package:flutter_app_std/core/function/show_msg.dart';
import 'package:flutter_app_std/views/auth/cubit/authentication_cubit.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_arrow_btn.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
// import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // عشان اتاكد ان الفورم  مش فاضي ياعنب
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          showMsg(context, "Email was sent");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is PasswordResetLoading
              ? CustomerCircleProglndicator()
              : SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Enter Your Email to Reset Password ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
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
                                customArrowBtn(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<AuthenticationCubit>()
                                          .resetPassword(
                                            email: emailController.text,
                                          );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
    super.dispose();
  }
}
