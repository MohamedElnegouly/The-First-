import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/modules/counter/cubit/states.dart';
import 'cubit/cubit.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer< CounterCubit, CounterStates>(
            listener: (context,state)
            {
              if(state is CounterMinusStates) //print('ZeroStates${state.counter}');
              if(state is CounterPlusStates) {
                //print('PlusStates${state.counter}');
              }
            },
            builder: (context,state)
            {
             return Scaffold(
                appBar: AppBar(

                  title: const Text(
                      "سبحه",
                  ),
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: ()
                        {
                          CounterCubit.get(context).minus();
                          },
                        child: const Text(
                          'صفر يا غالى',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${CounterCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        child:  const Text(
                          'كمان واحديه',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
      ),
    );
  }
}
