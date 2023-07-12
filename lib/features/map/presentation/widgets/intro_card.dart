import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 100.h,
          right: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          child: CustomCard(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,)),
                Text('Welcome to Wasalni',style: Theme.of(context).textTheme.bodyLarge),
                const Text('Happy to have you, Access a trip is just a tap ,Happy to have you, Access a trip is just a tap'),
                Text('Ride with Wasalni',style: Theme.of(context).textTheme.titleMedium)
              ],
            ),
          ),
        );
  }
}