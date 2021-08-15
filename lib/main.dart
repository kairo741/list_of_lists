import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/my-app.dart';

import 'core/injection.dart';

void main() async {
  setupInjection();
  runApp(MyApp());
}
