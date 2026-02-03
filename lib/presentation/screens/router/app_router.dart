import 'package:bloc_practice/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/presentation/screens/home_screen.dart';
import 'package:bloc_practice/presentation/screens/second_screen.dart';
import 'package:bloc_practice/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
        case '/' : return MaterialPageRoute(builder: (_) => BlocProvider.value(value: _counterCubit,child: HomeScreen(title: 'Flutter Demo Home Page', color: Colors.blueAccent,)),);
      
        case '/second' : return MaterialPageRoute(builder: (_) => BlocProvider.value(value: _counterCubit,child: SecondScreen(title: 'Second Screen', color: Colors.redAccent)),);
       
        case '/third' : return MaterialPageRoute(builder: (_) => BlocProvider.value(value: _counterCubit,child: ThirdScreen(title: 'Third Screen', color: Colors.greenAccent)),);
        
        default: return null;
    
    }
  }
  @override
  void dispose() {
    _counterCubit.close();
  }
}
