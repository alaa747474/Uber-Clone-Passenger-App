import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/map/presentation/widgets/search_results_bottom_sheet.dart';

class DisabledSearchContainer extends StatelessWidget {
  const DisabledSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return const SearchResultsBottomSheet();
              });
        },
        child: CustomCard(
          height: 50.h,
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Theme.of(context).hintColor,
              ),
              Text('Search Destination',
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ));
  }
}
