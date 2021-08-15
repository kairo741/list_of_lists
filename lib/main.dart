import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/my-app.dart';

import 'core/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupInjection();
  runApp(MyApp());
}
