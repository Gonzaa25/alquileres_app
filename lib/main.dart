import 'package:alquileres_app/pages/home.dart';
import 'package:alquileres_app/providers/favsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavsProvider())],
      child: MaterialApp(
        title: 'Web demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'DEMO APP'),
      ),
    );
  }
}
