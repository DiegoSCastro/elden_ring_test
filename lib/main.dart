import 'package:elden_ring_test/screens/get_item/cubit/get_item_cubit.dart';
import 'package:elden_ring_test/screens/home_page.dart';
import 'package:elden_ring_test/screens/npc/cubit/npc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetItemCubit(),
        ),
        BlocProvider(
          create: (context) => NpcCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Elden Ring test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
