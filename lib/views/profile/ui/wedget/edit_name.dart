import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/function/bulid_appbar.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidCustomAppBar("My Name " , context),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: customTextFormField(
              labelText: "Enter Your name",
              suffIcon: Icon(Icons.create),
            ),
          ),
          customTextButton(
            text: 'Update',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
