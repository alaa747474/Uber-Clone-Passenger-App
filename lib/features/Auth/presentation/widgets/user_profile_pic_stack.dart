import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../bloc/auth_bloc.dart';

class UserProfilePicStack extends StatelessWidget {
  const UserProfilePicStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CustomAppBar(),
        Positioned(
            top: 100.h,
            right: MediaQuery.of(context).size.width / 4,
            left: MediaQuery.of(context).size.width / 4,
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (context.read<AuthBloc>().imageUrl != null) {
                  return CircleAvatar(
                    radius: 80.r,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        NetworkImage(context.read<AuthBloc>().imageUrl!),
                  );
                }
                return InkWell(
                  onTap: () {
                    context.read<AuthBloc>().add(GetImageUrl());
                  },
                  child: CircleAvatar(
                    radius: 80.r,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person_add,
                      size: 100.r,
                      color: Colors.grey[400],
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
