import 'package:bloc_practice/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/presentation/screens/home_screen.dart';
import 'package:bloc_practice/presentation/screens/router/app_router.dart';
import 'package:bloc_practice/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// final CounterCubit _counterCubit = CounterCubit();
final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
        // routes: {
        //   '/' : (context) => BlocProvider.value(value:_counterCubit,
        //     child: HomeScreen(title: 'Flutter Demo Home Page', color: Colors.blueAccent,)),
        //   '/second' : (context) => BlocProvider.value(value: _counterCubit,
        //     child: SecondScreen(title: 'Second Screen', color: Colors.redAccent)),
        //   '/third' : (context) => BlocProvider.value(value: _counterCubit, child: SecondScreen(title: 'Third Screen', color: Colors.greenAccent))

        // },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
       
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _counterCubit.close();
    _appRouter.dispose();
  }
}

