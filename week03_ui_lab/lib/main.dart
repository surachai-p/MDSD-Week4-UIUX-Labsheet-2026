import 'package:flutter/material.dart';
import 'theme.dart'; // Theme ที่ Export จาก Material Theme Builder
import 'screens/home_screen.dart'; // หน้า Home ของแอป

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(
      ThemeData(useMaterial3: true).textTheme,
    );

    return MaterialApp(
      title: 'Green Market App',
      debugShowCheckedModeBanner: false,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.dark, // TODO(Exp.5.1): ทดสอบชั่วคราว เปลี่ยนกลับเป็น ThemeMode.system หลังเช็คเสร็จ
      home: const HomeScreen(),
    );
  }
}
