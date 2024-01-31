import 'package:basic_cubit/bloc/counter.dart';
import 'package:basic_cubit/blocprovider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 100,
      width: 250, // Atau sesuaikan dengan kebutuhan Anda
      child: Center(
        child: BlocBuilder(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              '$state',
              style: const TextStyle(fontSize: 50, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
