import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivepro/home.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('mylist');
  await Hive.openBox('secondbox');
  runApp(
    MaterialApp(
      home: Hivehomepage(),
    ),
  );
}
