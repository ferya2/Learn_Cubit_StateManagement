import 'package:basic_cubit/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter mycounter = Counter();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Builder',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
        elevation: 5,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // BLOC BUILDER

        // BlocBuilder<Counter, int>(
        //     bloc: mycounter,
        //     builder: (context, state) {
        //       return Text(
        //         '$state',
        //         style: const TextStyle(fontSize: 50),
        //       );
        //     }),

        // BLOC LISTENER
        // BlocListener<Counter, int>(
        //   bloc: mycounter,
        // listener: (context, state) {
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       duration: Duration(seconds: 1),
        //       content: Text('Ini Data Genap')));
        // },
        // listenWhen: (previous, current) {
        //   if (current % 2 == 0) {
        //     return true;
        //   } else {
        //     return false;
        //   }
        // },
        //   child: BlocBuilder<Counter, int>(
        //     bloc: mycounter,
        // builder: (context, state) {
        //   return Text(
        //     '$state',
        //     style: const TextStyle(fontSize: 50),
        //   );
        // },
        //   ),
        // ),

        // BLOC CUNSUMER
        // gabungan antara bloc builder dan bloc listener
        BlocConsumer<Counter, int>(
          buildWhen: (previous, current) {
            if (current >= 10) {
              return true;
            } else {
              return false;
            }
          },
          bloc: mycounter,
          builder: (context, state) {
            return Text(
              '$state',
              style: const TextStyle(fontSize: 50),
            );
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Ini Data Genap')));
          },
          listenWhen: (previous, current) {
            if (current % 2 == 0) {
              return true;
            } else {
              return false;
            }
          },
        ),

        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                mycounter.decrement();
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                mycounter.increment();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ]),
    );
  }
}

final Counter mycounter = Counter();
