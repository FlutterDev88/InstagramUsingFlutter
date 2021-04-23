import 'package:flutter/material.dart';
import 'package:instagram/constants/size.dart';
import 'package:instagram/utils/profile_image_parser.dart';

class Follow extends StatelessWidget{
  final List<String> users = List.generate(10, (index) => '$index');
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey[300], thickness: 1,);
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return _item(users[index]);
        }
      ),
    );
  }

  ListTile _item(String user) {
    return ListTile(
      leading: CircleAvatar(
        radius: profile_radius,
        backgroundImage: NetworkImage(getProfileImgPath(user)),
      ),
      title: Text(user),
      subtitle: Text('aaa~~~~~~~~~~~~~~~~bbb'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.black87, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Following',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}