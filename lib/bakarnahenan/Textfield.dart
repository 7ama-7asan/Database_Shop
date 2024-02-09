// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfiled extends StatelessWidget {
  TextEditingController controller;
  String label;
  String help;
  // ignore: non_constant_identifier_names
  GlobalKey<FormState> globalkey;
  Textfiled(
      {super.key,
      required this.controller,
      required this.label,
      required this.globalkey,
      required this.help});
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.transparent, width: 1)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return help;
          } else
            return null;
        },
      ),
    );
  }
}
