import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app/constant/size_config.dart';
import 'package:test_app/views/home/binding/home_bindings.dart';
import 'package:test_app/views/home/page/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Locale? locale;
  const MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test ',
          initialBinding: HomeBindings(),
          home: const HomeScreen(),
        );
      });
    });
  }
}
