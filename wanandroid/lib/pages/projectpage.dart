import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    print("2创建");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("项目"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: new Swiper(
              itemCount: 3,
              itemBuilder: _buildBanner,
              pagination: new SwiperPagination(),
              autoplay: true,
            ),
          ),
          Container(
            child: new ListView.builder(
              itemBuilder: _buildItem,
              itemCount: 10,
            ),
            margin: const EdgeInsets.only(top: 200),
          )
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg",
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.yellow,
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("item$index"),
        ),
      ),
      onTap: () {
        print("item$index");
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
