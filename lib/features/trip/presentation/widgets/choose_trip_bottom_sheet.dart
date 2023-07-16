import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/features/trip/presentation/widgets/cancel_trip_request_card.dart';
import 'package:uber_clone/features/trip/presentation/widgets/vehicle_type_card.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_card.dart';
import '../bloc/trip_bloc.dart';

class ChooseTrioBottomSheet extends StatelessWidget {
  const ChooseTrioBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripState>(
      builder: (context, state) {
        if (state.tripRequestState == RequestState.loading) {
          return const CanelTripRequestCard();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomCard(
            height: 280.h,
            child: Column(
              children: [
                Text(
                  'choose vehicel !!!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                VehicleTypeCard(
                  price: state.bikeTotalFare!.truncate(),
                  carName: 'Bike',
                  carDescription: 'Electrically powered motorcycles',
                  image: AppAssets.bike,
                ),
                VehicleTypeCard(
                  price: state.standardTotalFare!.truncate(),
                  carName: 'Economy Car',
                  carDescription:
                      'provides taxi service throughout Central Oregon',
                  image: AppAssets.normalCar,
                ),
                VehicleTypeCard(
                  price: state.vipTotalFare!.truncate(),
                  carName: 'Vip Car',
                  carDescription: 'premium taxi services',
                  image: AppAssets.vipCar,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
