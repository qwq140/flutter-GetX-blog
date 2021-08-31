import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/components/custom_text_area.dart';
import 'package:flutter_blog/pages/post/detail_page.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validateTitle(),
                value: "제목1", // 나중에 서버에서 받아올 값
              ),
              CustomTextArea(
                hint: "Content",
                funValidator: validateContent(),
                value: "내용1" * 20, // 나중에 서버에서 받아올 값
              ),
              CustomElevatedButton(
                text: "글수정하기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back(); // 상태관리 GetX 라이브러리 - Obs
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
