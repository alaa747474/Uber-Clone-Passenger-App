import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppClipper(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200.h),
        child: Container(
          height: double.maxFinite,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: child,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size(0, 100.h);
}

class CustomAppClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 70);
    path.quadraticBezierTo(width / 3, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
