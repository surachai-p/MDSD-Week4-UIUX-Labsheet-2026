import 'package:flutter/material.dart';

// TODO(Exp.1): ไฟล์นี้ใช้ ColorScheme.fromSeed จาก Primary Color ที่ export
// มาจาก Material Theme Builder (#006a68) — หากต้องการ Tonal Palette แบบเป๊ะ
// ทุก role ตามที่ Theme Builder คำนวณจริง ให้แทนที่ไฟล์นี้ด้วยไฟล์ theme.dart
// ที่กด Export -> Flutter มาโดยตรง

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static const Color seedColor = Color(0xFF006A68);

  ThemeData light() {
    return theme(ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ));
  }

  ThemeData dark() {
    return theme(ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ));
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
      );
}
