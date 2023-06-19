import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:uber_clone/core/constants/app_assets.dart';
import 'package:uber_clone/core/widgets/custom_button.dart';
import 'package:uber_clone/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:uber_clone/features/Auth/presentation/widgets/custom_pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LottieBuilder.asset(
                AppAssets.animatedSms,
                fit: BoxFit.cover,
                height: 350.h,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Phone Verification',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Enter your OTP code',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Enter the 4-digit code sent to you at ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                    TextSpan(
                      text: '+2015550034700',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700),
                    )
                  ])),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: CustomPinCodeTextField(
                  controller: _otpController,
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is OTPVerified) {
                    context.read<AuthBloc>().add(GetUserState());
                  }
                  if (state is InitialRouteScreenLoaded) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => state.screen));
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(VerifyOTP(_otpController.text));
                      },
                      text: 'Verify');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
