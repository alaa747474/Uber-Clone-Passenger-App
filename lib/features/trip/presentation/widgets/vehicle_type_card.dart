import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/trip/presentation/bloc/trip_bloc.dart';

class VehicleTypeCard extends StatelessWidget {
  const VehicleTypeCard({
    Key? key,
    required this.price,
    required this.image,
    required this.carName,
    required this.carDescription,
  }) : super(key: key);
  final int price;
  final String image;
  final String carName;
  final String carDescription;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripState>(
      builder: (context, state) {
        return InkWell(
          highlightColor: Colors.black,
          focusColor: Colors.red,
          splashColor: Colors.amber,
          onTap: () {
            context.read<TripBloc>().add(const SaveTripRequests('Econmy'));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(
              height: 55.h,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        image,
                        width: 80.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  carName,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  '$price\$ : ${(price * 1.2).truncate()}\$',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Text(
                              carDescription,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
