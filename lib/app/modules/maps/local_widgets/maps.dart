import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_street_map/app/modules/maps/maps_controller.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      builder: (_) {
        return Container(
          width: 350.0,
          height: 460.0,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(_.latitud, _.longitud),
              zoom: 14.2,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    point: LatLng(_.direccion.latitud, _.direccion.longitud),
                  ),
                  Marker(
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    point: LatLng(_.latitud, _.longitud),
                  ),
                ],
              ),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: <LatLng>[
                      LatLng(_.latitud, _.longitud),
                      LatLng(_.direccion.latitud, _.direccion.longitud),
                    ],
                    color: Colors.green,
                    strokeWidth: 3.0,
                  )
                ],
              )
            ],
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
          ),
        );
      },
    );
  }
}
