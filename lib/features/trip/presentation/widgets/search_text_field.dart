import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';

import '../blocs/map_bloc/map_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 40.h,
      child: Center(
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return TextField(
              onChanged: (placeName) {
                context.read<MapBloc>().add(GetPlaceSuggestions(placeName));
              },
              decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  hintText: 'Where to go?',
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            );
          },
        ),
      ),
    );
  }
}
