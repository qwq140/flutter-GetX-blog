import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            hint: "password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(HomePage());
              }
            },
          ),
        ],
      ),
    );
  }
}
