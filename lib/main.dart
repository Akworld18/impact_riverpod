import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impact_mentor/mentorship/presentation/ui/book_session.dart';
import 'package:impact_mentor/mentorship/presentation/ui/bookings.dart';
import 'package:impact_mentor/mentorship/presentation/ui/mentor_dashboard.dart';

void main() {
  runApp(ProviderScope(child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BookSession(),
    );
  }
}

