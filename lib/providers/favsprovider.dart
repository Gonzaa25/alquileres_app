import 'package:alquileres_app/resources/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Casa> _myfavs = [];
  List<Casa> get myfavs => _myfavs;

  void addFav(Casa casa) {
    _myfavs.add(casa);
    print(_myfavs.toString());
    notifyListeners();
  }

  void removeFav(Casa casa) {
    _myfavs.remove(casa);
    print(_myfavs.toString());
    notifyListeners();
  }
}
