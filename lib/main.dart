import 'package:flutter/material.dart';
import 'package:gu_mobile/di/injector.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(GuMobileApp());
}
