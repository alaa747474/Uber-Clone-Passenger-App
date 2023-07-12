import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/core/widgets/error_widget.dart';
import 'package:uber_clone/core/widgets/loading_indicator.dart';
import '../blocs/map_bloc/map_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listener: (context, state) {
        if (state.currentLocationState == RequestState.loaded) {
          context.read<MapBloc>().add(const GetPlaceMarks());
        }
      },
      builder: (context, state) {
        if (state.currentLocationState == RequestState.loading) {
          return const LoadingIndicator();
        }
        if (state.currentLocationState == RequestState.loaded) {
          return GoogleMap(
              polylines: context.read<MapBloc>().polylines,
              padding: EdgeInsets.only(bottom: 150.h),
              onMapCreated: (controller) {
                if (!(context.read<MapBloc>().controller.isCompleted)) {
                  context.read<MapBloc>().controller.complete(controller);
                }
              },
              myLocationEnabled: true,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: false,
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      state.position!.latitude, state.position!.longitude),
                  zoom: 8));
        }
        return const ErrorTextWidget();
      },
    );
  }
}
