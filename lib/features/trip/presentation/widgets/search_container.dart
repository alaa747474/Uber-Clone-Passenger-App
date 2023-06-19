import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(0.19),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            Text(
              'Search Destination',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor, fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }
}
