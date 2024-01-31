import 'package:basic_cubit/bloc/counter.dart';
import 'package:basic_cubit/blocprovider/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderPage extends StatefulWidget {
  @override
  State<BlocProviderPage> createState() => _BlocProviderPageState();
}

class _BlocProviderPageState extends State<BlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'BLOC PROVIDER',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Buttom -
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {
                        myCounter.decrement();
                        print('klik -');
                      },
                      child: const SizedBox(
                        height: 100,
                        width: 70,
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //data counter
                  DataWidget(),
                  //Button +
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {
                        myCounter.increment();
                        print('klik +');
                      },
                      child: const SizedBox(
                        height: 100,
                        width: 70,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
