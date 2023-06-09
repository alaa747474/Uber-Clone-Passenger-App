import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_button.dart';
import 'package:uber_clone/core/widgets/custom_text_field.dart';
import 'package:uber_clone/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:uber_clone/features/Auth/presentation/widgets/user_profile_pic_stack.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const UserProfilePicStack(),
          SizedBox(
            height: 40.h,
          ),
          CustomTextField(label: 'Name', controller: _nameController),
          CustomTextField(label: 'E-mail', controller: _emailController),
          CustomTextField(label: 'Address', controller: _addressController),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 120.h),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return CustomButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SaveUserInformation(
                          _nameController.text,
                          _emailController.text,
                          _addressController.text));
                    },
                    text: 'Continue');
              },
            ),
          )
        ],
      ),
    ));
  }
}
