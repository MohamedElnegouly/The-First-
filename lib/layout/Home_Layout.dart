// ignore_for_file: dead_code
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/modules/Archived_Tasks/Archived_Tasks_Screen.dart';
import 'package:project1/modules/Done_Tasks/Done_Tasks_Screen.dart';
import 'package:project1/modules/New_Tasks/New_Tasks_Screen.dart';
import 'package:project1/shared/components/components.dart';
import 'package:project1/shared/cubit/cubit.dart';
import 'package:project1/shared/cubit/states.dart';
//import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{
  Future<String> getName() async {
    return 'Mohamed';
  }
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titelController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..creatDataBase(),
      child: BlocConsumer<AppCubit,AppStates>(
            listener: (BuildContext context , AppStates state){
              if (state is AppInsertDatabaseState){
                Navigator.pop(context);
              }
            },
            builder: (BuildContext context , AppStates state){
              AppCubit Cubit = AppCubit.get(context);
              return Scaffold(
                key: ScaffoldKey,
                appBar: AppBar(
                  title: Text(Cubit.Titels[Cubit.currentIndex]),
                  backgroundColor: Colors.black,
                ),
                body: ConditionalBuilder(
                    condition: state is! AppGetDatabaseLoadingState,
                    builder: (context)=>Cubit.screens[Cubit.currentIndex],
                    fallback: (context) => const Center(child: CircularProgressIndicator(),)
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    if (Cubit.isButtomSheetShown)
                    {
                      Cubit.insertToDatabase(
                        title: titelController.text,
                          time: timeController.text,
                          date: dateController.text,
                      );
                    }
                    else {
                      ScaffoldKey.currentState?.showBottomSheet(
                            (context) => Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defauldformField(
                                  controller: titelController,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'title must not be Empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defauldformField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text = value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Time must not be Empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task TIme',
                                  prefix: Icons.watch_later_outlined,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defauldformField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: ()
                                  {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-10-15'),
                                    ).then((value){
                                      dateController.text = value.toString();
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Data must not be Empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Data',
                                  prefix: Icons.calendar_month_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      ).closed.then((value)
                      {
                        Cubit.changeButtomSheetState(
                            isShow: false,
                            Icon: Icons.edit,);
                      });
                      Cubit.changeButtomSheetState(
                        isShow: true,
                        Icon: Icons.add,);
                    }
                  },
                  child: Icon(
                    Cubit.fabIcon,
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: Cubit.currentIndex,
                  onTap: (index) {
                    Cubit.changeIndex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.menu,
                        ),
                        label: 'Tasks'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.check_circle_outline,
                        ),
                        label: 'Done'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.archive_outlined,
                        ),
                        label: 'Archived'),
                  ],
                ),
              );
            },
      ),
    );
  }
}


