import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/modules/Archived_Tasks/Archived_Tasks_Screen.dart';
import 'package:project1/modules/Done_Tasks/Done_Tasks_Screen.dart';
import 'package:project1/modules/New_Tasks/New_Tasks_Screen.dart';
import 'package:project1/shared/cubit/states.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqflite.dart';

import '../components/constants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> Titels = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex (int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database dataBase;
  List<Map> newTasks = [];
  List<Map> archiveTasks = [];
  List<Map> doneTasks = [];

  void creatDataBase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (dataBase, version) {
        print('DataBase Created');
        dataBase.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT ,time TEXT , status TEXT )')
            .then((value) {
          print('Table Created ');
        }).catchError((error) {
          print('error when created database ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        print('DataBase Opened');
      },
    ).then((value){
      dataBase = value;
      emit(AppCreateDatabaseState());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  })async
  {
    await dataBase.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO Tasks (title , date , time , status) VALUES("$title", "$date" , "$time", "New" )')
          .then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(dataBase);
      }).catchError((error) {
        print('error when Inserting NEW Record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
        if (element['status'] == 'New') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateDataBase({
    required String  status,
    required int id,
})async {
     dataBase.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status,id]
    ).then((value){
      getDataFromDatabase(dataBase);
      emit(AppUpdateDatabaseState());
     });
  }
  void deleteDataBase({
    required int id,
  })async {
    dataBase.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id]
    ).then((value){
      getDataFromDatabase(dataBase);
      emit(AppDeleteDatabaseState());
    });
  }
  bool isButtomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeButtomSheetState ({
    required bool isShow,
    required IconData Icon,
}){
    isButtomSheetShown = isShow;
    fabIcon = Icon;
    emit(AppChangeBottomSheetState());
  }
}