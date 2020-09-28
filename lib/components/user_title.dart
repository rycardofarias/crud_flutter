import 'package:crudapp/models/user.dart';
import 'package:crudapp/provider/users.dart';
import 'package:crudapp/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserTitle extends StatelessWidget {
  final User user;
  const UserTitle(this.user);
  @override
  Widget build(BuildContext context){
    final avatar = user.avatarUrl==null||user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                Provider.of<Users>(context, listen: false).remove(user);
              },
            ),
          ],
        ),
      )
    );
  }
}
