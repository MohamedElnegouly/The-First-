import 'package:flutter/material.dart';

class MessengerScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleSpacing: 20.0,
      title: Row(
        children: const [
          CircleAvatar(
            radius: 18.0,
            backgroundImage: NetworkImage(""),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Chats',
            style: TextStyle(
                color: Colors.black
            ),

          ),
        ],
      ),
      actions: [
        IconButton(icon: const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20.0,
          child: Icon(
            Icons.camera_alt,
            size: 16.0,
            color: Colors.white,
          ),
        )
          , onPressed: () { },),
        IconButton(icon: const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20.0,
          child: Icon(
            Icons.edit,
            size: 16.0,
            color: Colors.white,
          ),
        )
          , onPressed: () { },),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.grey[300],
              ),
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Text(
                      "Search",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 100.0,
              child: ListView.separated(
                scrollDirection:  Axis.horizontal,
                itemBuilder: (context , index) => buildStoryItem (),
                separatorBuilder: (context , index) => SizedBox(
                  width: 20,
                ),
                itemCount: 9,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, item)=> buildChatItem (),
                separatorBuilder: (context, item)=>const SizedBox(
                  height: 20.0,
                ),
                itemCount: 15,),
          ],
        ),
      ),
    ),
  );
  }
  Widget buildChatItem () =>  Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(""),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 1.0,
              right: 3.0,
            ),
            child: CircleAvatar(
              radius:5.0 ,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sayed Ali",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow:TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              children: [
                Text(
                   "ديييييييهن"
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                    "02:35 AM"
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem () => Container(
    width: 65.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(""),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 1.0,
                right: 3.0,
              ),
              child: CircleAvatar(
                radius:5.0 ,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          "Sayed Ali",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
