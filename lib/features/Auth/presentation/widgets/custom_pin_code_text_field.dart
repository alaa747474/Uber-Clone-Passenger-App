import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, required this.controller});
   final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      boxShadows: const[
        BoxShadow(
            color: Colors.black12,
            spreadRadius:3,
            offset: Offset(0, 5),
            blurRadius: 10)
      ],
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.slide,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5.r),
        fieldHeight: 50.r,
        fieldWidth: 50.r,
        inactiveColor: Colors.grey[200],
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.grey[200],
        selectedFillColor: Colors.white,
        disabledColor: Colors.white,
        activeColor: Colors.white,
        selectedColor: Colors.white
      ),
      controller:controller ,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
