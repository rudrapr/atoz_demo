import 'package:flutter/material.dart';
import 'package:lrnr_demo/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrnr_demo/home/home_bloc/home_bloc.dart';

void main() {
  runApp(BlocProvider<HomeBloc>(
    create: (context) => HomeBloc()..add(HomeInit()),
    child: const MyApp(),
  ));
}
