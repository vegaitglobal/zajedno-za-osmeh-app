import 'package:flutter/material.dart';
import 'package:gu_mobile/di/injector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencyInjection();
  await initializeSupabase();
  runApp(const Application());
}

String _supabaseUrl = dotenv.env['SUPABASE_URL'] ?? "";
String _supabaseKey = dotenv.env['SUPABASE_API_KEY'] ?? "";

Future<void> initializeSupabase() async => await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );
