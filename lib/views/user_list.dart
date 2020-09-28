import 'package:crudapp/components/user_title.dart';
import 'package:crudapp/models/user.dart';
import 'package:crudapp/provider/users.dart';
import 'package:crudapp/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                //arguments: user,
              );
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTitle(users.byIndex(i)),

      ),
    );
  }
}
