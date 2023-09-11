import 'package:flutter/material.dart';
import 'package:quickbreak/components/text_field_container.dart';
import 'package:quickbreak/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFieldContainer(
      child: TextField(
        toolbarOptions: ToolbarOptions(
            copy:false,
            paste: false,
            cut: false,
            selectAll: true
          //by default all are disabled 'false'
        ),
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility_off,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}