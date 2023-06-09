import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:uber_clone/core/constants/app_assets.dart';
import 'package:uber_clone/core/widgets/custom_button.dart';
import 'package:uber_clone/features/Auth/presentation/screens/otp_screen.dart';
import 'package:uber_clone/features/Auth/presentation/widgets/privacy_policy_text.dart';
import 'package:uber_clone/features/Auth/presentation/widgets/phone_text_field.dart';

import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LottieBuilder.asset(
                  AppAssets.animatedPhone,
                  height: 250.h,
                  width: double.maxFinite,
                ),
                Text(
                  'Hello, nice to meet you',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Join our company!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PhoneTextField(
                  controller: _phoneController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PrivacyPolicyText(),
                SizedBox(
                  height: 50.h,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is PhoneNumberSubmited) {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPScreen()));
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(VerifyPhone(_phoneController.text));
                          _formKey.currentState!.validate();
                        },
                        text: 'Login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
