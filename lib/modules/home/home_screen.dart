import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
       appBar: AppBar(
           leading: const Icon(
               Icons.menu),
           title: const Text(
               'Dark App'),
           actions:  [
            IconButton( icon:const Icon(
              Icons.notification_important,),onPressed: notification, ),
             IconButton(icon: const Icon(Icons.search,),onPressed: (){print('search presed');},)
           ],
           centerTitle: true,
           backgroundColor: Colors.teal,
           elevation: 50.0,
         ),
        body: Container(
          color: Colors.black,
          width: double.infinity ,
          child: Column(
            mainAxisSize: MainAxisSize.max  ,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: const Text(
                  'First Text',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Secand Text',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Third Text',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
    ),
      );


        /*body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
           children: [
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'first',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),
             Text(
               'secand',
               style: TextStyle(
                 fontSize: 30.0,

               ),
             ),

           ],
          ),
        )
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Image(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                      ),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 200.0,
                      color: Colors.black.withOpacity(.7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: const Text(
                        'Flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );*/

  }
  void notification(){
        print('notifications presed');
  }
}