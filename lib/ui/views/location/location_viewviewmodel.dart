import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class LocationViewModel extends BaseViewModel {
  final LatLng _center = const LatLng(34.994183, 25.226157);

  LatLng get officeLocation => _center;
}
