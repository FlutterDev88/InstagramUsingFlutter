import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/size.dart';

class FeedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildAppBarIcon('assets/actionbar_camera.png', Colors.black, null),
        title: ImageIcon(AssetImage('assets/insta_text_logo.png'), size: 100,),
        actions: [
          _buildAppBarIcon('assets/actionbar_igtv.png', Colors.black, null),
          _buildAppBarIcon('assets/direct_message.png', Colors.black, null),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _feedHeader(index),
              _feedImage(index),
              _feedAction(index),
              _feedLikes(index),
              _feedCaption(context, index),
            ],
          );
        }
      )
    );
  }

  IconButton _buildAppBarIcon(String iconPath, Color color, onPressed) {
    return IconButton(icon: ImageIcon(AssetImage(iconPath), color: color), onPressed: onPressed);
  }

  CachedNetworkImage _feedImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }

  Row _feedHeader(int index) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(common_gap),
          child: CircleAvatar(
            radius: 16.0,
            backgroundImage: CachedNetworkImageProvider(
              'https://picsum.photos/id/$index/50/50'
            ),
          ),
        ),
        Expanded(child: Text('UserName')),
        IconButton(icon: Icon(Icons.more_horiz, color: Colors.black87,), onPressed: null),
      ],
    );
  }

  Row _feedAction(int index) {
    return Row(
      children: [
        _buildAppBarIcon('assets/heart_selected.png', Colors.black87, null),
        _buildAppBarIcon('assets/comment.png', Colors.black87, null),
        _buildAppBarIcon('assets/direct_message.png', Colors.black87, null),
         Spacer(),
        _buildAppBarIcon('assets/bookmark.png', Colors.black87, null),
      ],
    );
  }

  Padding _feedLikes(int index) {
    return Padding(
      padding: EdgeInsets.only(left: common_gap),
      child: Text('1750 likes', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  _feedCaption(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(text: 'username$index', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '   '),
            TextSpan(text: 'aaa~~~~~~~~~~~~~~bbb~~~~~ ~~~~~~~~ccc~~~~'),
          ],
        ),
      ),
    );
  }
}