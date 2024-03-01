import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project1/shared/cubit/cubit.dart';

Widget defaultButton({
  double Width = double.infinity,
  Color background = Colors.blueAccent,
  bool isuppercase = true,
  required Function function,
  required String text,
}) =>
    Container(
      width: Width,
      color: background,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isuppercase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defauldformField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  Function? onChange,
  required Function validate,
  required String label,
  required IconData prefix,
  bool isClickable = true,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      obscureText: isPassword,
      onChanged: (s) {
        onChange!(s);
      },
      onFieldSubmitted: (value) {
        onSubmit!();
      },
      validator: (s) {
        validate(s);
      },
      onTap: () {
        onTap!();
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDataBase(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDataBase(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.archive_outlined,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction)
      {
      AppCubit.get(context).deleteDataBase(id: model["id"],);
      },
    );

Widget tasksBuilder (
{
  required List<Map> tasks
}
    ) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          buildTaskItem(tasks[index], context),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.menu,
          size: 90.0,
          color: Colors.grey,
        ),
        Text(
          'NO Tasks yet , Please add some tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 17.0,
          ),
        ),

      ],
    ),
  ),
);
