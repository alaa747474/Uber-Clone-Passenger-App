import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/features/trip/presentation/widgets/search_container.dart';

class TripDetailsBottomSheet extends StatelessWidget {
  const TripDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        maxChildSize: 0.9,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black12,
                        blurRadius: 25,
                        spreadRadius: 5)
                  ],
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r))),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                    child: Text('Where do you want to go?',style: Theme.of(context).textTheme.titleMedium,),
                  ),
                  const SearchContainer()
                ],
              ));
        },
      ),
    );
  }
}
