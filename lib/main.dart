import 'package:flutter/material.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  await initializeSupabase();
  runApp(Application());
}

Future<void> initializeSupabase() async => await Supabase.initialize(
      url:
          'https://jiustusjsmvfyweumaip.supabase.co', //TODO remove hardcoded values to config file
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppdXN0dXNqc212Znl3ZXVtYWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcxOTM0MzcsImV4cCI6MjAxMjc2OTQzN30.jcIbuM4-2ETToiBiTjQPB06NaQt2LPrq6iywpCMF_YI',
    );
