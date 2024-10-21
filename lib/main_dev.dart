import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/API%20Service/env/env.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/main.dart';

void main() async {
  AppEnvironment.setupEnv(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  //token service on here in app

  final tokenService = await Get.putAsync(() => TokenService().init());

  runApp(const MyApp());
}
