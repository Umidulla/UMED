import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_file_view/flutter_file_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterFileView.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
