import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/constants/app_assets.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/core/widgets/custom_back_button.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';
import 'package:uber_clone/features/map/presentation/widgets/current_location_card.dart';
import 'package:uber_clone/features/map/presentation/widgets/details_bottom_sheet.dart';
import 'package:uber_clone/features/map/presentation/widgets/disabled_search_container.dart';
import 'package:uber_clone/features/trip/presentation/bloc/trip_bloc.dart';
import 'package:uber_clone/features/trip/presentation/widgets/vehicle_type_card.dart';

import '../widgets/map_view.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const MapView(),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomBackButton(),
                    SizedBox(
                      width: 15.w,
                    ),
                    const CurrentLocationCard(),
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                )),
          ),
          BlocConsumer<MapBloc, MapState>(
            listener: (context, state) {
              if (state.polylineState == RequestState.loaded) {
                context
                    .read<TripBloc>()
                    .add(const CalculateFare(VehicleType.premium));
              }
            },
            builder: (context, state) {
              if (state.polylineState == RequestState.loaded) {
                return BlocBuilder<TripBloc, TripState>(
                  builder: (context, state) {
                    return Padding(
                      padding:  EdgeInsets.all(10.r),
                      child: CustomCard(
                        height: 350.h,
                        child: Column(
                          children: [
                            Text('choose vehicel type',style: Theme.of(context).textTheme.labelLarge,),
                            VehicleTypeCard(
                              price: state.bikeTotalFare!.truncate(),
                              carName: 'Bike',
                              carDescription: 'Electrically powered motorcycles',
                              image: AppAssets.bike,
                            ),
                            VehicleTypeCard(
                              price: state.standardTotalFare!.truncate(),
                              carName: 'Economy Car',
                              carDescription: 'provides taxi service throughout Central Oregon',
                              image: AppAssets.normalCar,
                            ),
                            VehicleTypeCard(
                              price: state.vipTotalFare!.truncate(),
                              carName: 'Vip Car',
                              carDescription: 'premium taxi services',
                              image: AppAssets.vipCar,
                            ),
                             Text('Change Destination !!!',style: Theme.of(context).textTheme.labelLarge,),
                            Padding(
                              padding:  EdgeInsets.all(8.0.r),
                              child: const DisabledSearchContainer(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const DetailsBottomSheet();
            },
          )
        ],
      ),
    );
  }
}
