import 'package:flutter/material.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/main.dart';

void main() {
  AppEnvironment.setupEnv(Environment.prod);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
