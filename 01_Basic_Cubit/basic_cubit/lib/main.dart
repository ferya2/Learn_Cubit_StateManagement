import 'package:basic_cubit/bloc/counter.dart';
import 'package:basic_cubit/blocprovider/bloc_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Counter(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProviderPage(),
        ));
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;
  int? current;
  int? next;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer
  // - Memantau perubahan (onChange)
  // - Memantau error (onError)
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

CounterCubit mycounter = CounterCubit(initialData: 66);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Cubit'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: mycounter.initialData,
            builder: (context, snapshot) {
              return Center(
                  child: Column(
                children: [
                  Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   'Current: ${mycounter.current}',
                  //   style: const TextStyle(fontSize: 50),
                  // ),
                  // Text(
                  //   'Next: ${mycounter.next}',
                  //   style: const TextStyle(fontSize: 50),
                  // )
                ],
              ));
            },
            stream: mycounter.stream,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  mycounter.kurangData();
                },
                icon: const Icon(Icons.remove)),
            IconButton(
                onPressed: () {
                  mycounter.tambahData();
                },
                icon: const Icon(Icons.add)),
          ])
        ],
      ),
    );
  }
}
