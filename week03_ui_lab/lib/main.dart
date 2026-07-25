import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart';
import 'util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // สร้าง TextTheme และ MaterialTheme จาก theme.dart / util.dart
    // ที่ Export มาจาก Material Theme Builder (การทดลองที่ 1)
    final TextTheme textTheme = createTextTheme(context, 'Roboto', 'Roboto');
    final MaterialTheme materialTheme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Week 03 UI Lab',
      debugShowCheckedModeBanner: false,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
