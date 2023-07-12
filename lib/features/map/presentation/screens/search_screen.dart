import 'package:flutter/material.dart';
import '../widgets/map_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Stack(
      children: [
        const MapView(),
        Container(
          width: 200,height: 300,
          color: Colors.red,
        )
      ],
    ));
  }
}
