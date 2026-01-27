import 'package:bloc_practice/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                 
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Incremented')));
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Decremented')));
          }
      
                },
                builder: (context, state) {
                
                      if (state.counterValue < 0) {
                        return Text(
                          'Bro its nagetive value' +
                              state.counterValue.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      } else if (state.counterValue % 2 == 0) {
                        return Text('Yayy' + state.counterValue.toString());
                      } else if (state.counterValue == 5) {
                        return Text('Hmm its 5');
                      } else
                        return Text(state.counterValue.toString());
                    },
                  
              
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}
