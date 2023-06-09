import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.label,
      required this.controller,
      this.validator,
      this.icon,
      this.obscure = false});
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool obscure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          floatingLabelStyle:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 17.sp),
          labelStyle: TextStyle(
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.normal,
              fontSize: 20.sp),
          label: Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hintColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
