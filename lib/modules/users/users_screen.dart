import 'package:flutter/material.dart';
import 'package:project1/models/user/user_model.dart';

class UsersScreen extends StatelessWidget
{
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 2,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 3,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 4,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 5,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 6,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 7,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 8,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
    UserModel(
      id: 9,
      name: 'MOhamed yasser',
      phone: '+023637862647',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users',),
      ),
      body:ListView.separated(
          itemBuilder: (context , idex) => buildUserItem(users[idex]),
          separatorBuilder: (context , idex) => Padding(
            padding: const EdgeInsetsDirectional.only(
             start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ) ,
          itemCount:users.length )
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      //crossAxisAlignment: ,
      children: [
         CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style:const TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
         const SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize:  MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              user.name,
              style:const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
             user.phone,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
