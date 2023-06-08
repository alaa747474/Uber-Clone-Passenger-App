import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uber_clone/core/widgets/custom_card.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    String flag = 'eg'.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return CustomCard(
      height: 60.h,
      child: Row(
        children: [
          Text(
            flag,
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            width: 7.w,
          ),
          Text(
            '+20',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
          const VerticalDivider(),
          Flexible(
              child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter yout phone number!';
              } else if (value.length < 10) {
                return 'Too short for a phone number!';
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your phone num',
                hintStyle: Theme.of(context).textTheme.bodyLarge),
          ))
        ],
      ),
    );
  }
}
