import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'location_viewviewmodel.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.nonReactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Location'),
            leading: IconButton(
              icon: Image.asset('assets/cmbt.png'),
              onPressed: () {},
            ),
          ),
          body: GoogleMap(
            //onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: model.officeLocation,
              zoom: 11.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId("cmbt_office"),
                position: model.officeLocation,
                infoWindow: InfoWindow(
                  title: 'Cmbt Office',
                  snippet: 'Ahedrias',
                ),
                icon: BitmapDescriptor.defaultMarker,
              )
            },
          ),
        ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
