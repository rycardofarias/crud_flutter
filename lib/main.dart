import 'package:crudapp/provider/users.dart';
import 'package:crudapp/routes/AppRoutes.dart';
import 'package:crudapp/views/user_form.dart';
import 'package:crudapp/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (ctx) => new Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_)=> UserForm()
        },
      ),
    );
  }
}
