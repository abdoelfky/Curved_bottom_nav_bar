// drawing clipper bottom nav bar
// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cuberto Bottom Bar Demo',
//       theme: ThemeData(
//         useMaterial3: true,
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

///expansion tile with multi controller

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expansion_tile_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final controller = Get.put(CustomExpansionTileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTile with GetX')),
      body: GetBuilder<CustomExpansionTileController>(builder: (context)
      {
        return ListView.builder(
          ///imp
          key: Key(controller.expandedIndex.toString()),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ExpansionTile(
              /// imp
              key: Key(controller.expandedIndex.toString()),
              initiallyExpanded: index == controller.expandedIndex,
              title: Text('ExpansionTile $index'),
              subtitle: Text('Trailing expansion arrow icon'),
              onExpansionChanged: ((newState) {
                if (newState) {
                  controller.toggleTile(index);
                } else {
                  controller.toggleTile(-1);
                }
              }),
              children: [
                ListTile(
                  title: Text('This is tile number $index'),
                ),
              ],
            );
          },
        );
      })
    );
  }
}
