import 'dart:math';

import 'package:bloc_api/data/model/post_model.dart';
import 'package:bloc_api/data/repositories/post_repositories.dart';
import 'package:bloc_api/logic/cubit/post_cubit/post_cubit.dart';
import 'package:bloc_api/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PostCubit(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),);
  }
}


