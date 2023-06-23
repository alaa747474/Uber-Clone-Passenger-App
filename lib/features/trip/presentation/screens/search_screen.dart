import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';

import '../blocs/map_bloc/map_bloc.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: MediaQuery.sizeOf(context).height * 0.1),
          child: Column(
            children: [
              CustomCard(
                height: 40.h,
                child: BlocBuilder<MapBloc, MapState>(
                  builder: (context, state) {
                    return Center(
                        child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Theme.of(context).hintColor,
                        ),
                        Text(
                          '${state.placeMarks!.first.country}, ${state.placeMarks!.first.administrativeArea}, ${state.placeMarks!.first.locality}.',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ));
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
             const SearchTextField()
            ],
          )),
    );
  }
}
