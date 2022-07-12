import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_street_map/app/data/models/direcciones.dart';
import 'package:open_street_map/app/global_widgets/splash.dart';
import 'package:open_street_map/app/modules/home/home_controller.dart';
import 'package:open_street_map/app/modules/home/local_widgets/direccion_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'home',
      builder: (_) {
        if (_.loading) {
          return const Splash(mensaje: "Loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Direcciones"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              final Direcciones direcciones = _.direcciones[index];
              return DireccionItem(direccion: direcciones);
            },
            itemCount: _.direcciones.length,
          ),
        );
      },
    );
  }
}
