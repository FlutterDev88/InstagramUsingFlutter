import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/constants/size.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _searchData = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _searchInput(),
          _scrollImage(),
        ],
      ),
    );
  }

  SizedBox _searchInput() {
    return SizedBox(
      height: 40,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: common_xs_gap),
          child: TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            decoration: InputDecoration(
              labelText: _searchData.length > 0 ? '' : 'Search',
            ),
            onFieldSubmitted: (String textInput) {
              setState(() {
                _searchData = textInput;
              });
            },
          ),
        ),
      ),
    );
  }

  _scrollImage() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1,
              children: List.generate(30, (index) => _gridImgItem(index)),
            ),
          )
        ],
      )
    );
  }

  CachedNetworkImage _gridImgItem(int index) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: "https://picsum.photos/id/$index/100/100",
    );
  }
}