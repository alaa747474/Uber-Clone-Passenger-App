import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedPlaceButton extends StatelessWidget {
  const SavedPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FloatingActionButton.small(
                  elevation: 3,
                  backgroundColor: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: null,
                  child: Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Choose a Saved place',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
