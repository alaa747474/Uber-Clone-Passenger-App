import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/trip/domain/entities/place_prediction_entity.dart';
import 'package:uber_clone/features/trip/presentation/blocs/map_bloc/map_bloc.dart';

class SearchedPlaceCard extends StatelessWidget {
  const SearchedPlaceCard({super.key, required this.placePrediction});
  final PlacePredictionEntity placePrediction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MapBloc>().add(GetPlaceDetails(placePrediction.placeId));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 55.h,
            maxWidth: MediaQuery.sizeOf(context).width * 0.8,
            minHeight: 40.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomCard(
                height: 45.r,
                width: 45.r,
                child: Icon(
                  Icons.location_pin,
                  color: Theme.of(context).primaryColor,
                  size: 25.r,
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placePrediction.mainText,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    placePrediction.secondaryText,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
