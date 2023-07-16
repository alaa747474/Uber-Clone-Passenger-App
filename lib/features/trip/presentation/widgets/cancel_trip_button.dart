import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelTripButton extends StatelessWidget {
  const CancelTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){} , icon: Icon(Icons.cancel_rounded,color:Theme.of(context).primaryColor,size: 100.r,));
  }
}