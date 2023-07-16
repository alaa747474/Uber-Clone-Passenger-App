import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: FloatingActionButton.small(
              onPressed: onTap,
              elevation: 10,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).cardColor,
              child: const Center(child: Icon(Icons.arrow_back))),
        );
      },
    );
  }
}
