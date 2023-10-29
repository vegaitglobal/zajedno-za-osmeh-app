import 'package:flutter/material.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  await initializeSupabase();
  runApp(const Application());
}

Future<void> initializeSupabase() async => await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );

const _supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppdXN0dXNqc212Znl3ZXVtYWlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcxOTM0MzcsImV4cCI6MjAxMjc2OTQzN30.jcIbuM4-2ETToiBiTjQPB06NaQt2LPrq6iywpCMF_YI';
const _supabaseUrl = 'https://jiustusjsmvfyweumaip.supabase.co';
