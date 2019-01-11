import 'dart:ui' as ui;

import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import '../data/banneritem.dart';
import '../data/banner.dart';

///主页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<String> _banners;
  BannerItem bannerItem;
  List datas;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    getBanners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
    double screenHeight = MediaQueryData.fromWindow(ui.window).size.height;
    print("+++屏幕宽度：$screenWidth");
    _banners = [
      "http://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
      "http://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: datas.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        child: BannerView(data: _banners, buildShowView: _buildBanners),
      );
    } else {
      return Card(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          children: <Widget>[
            Image.network(
              "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg",
              width: 60,
              height: 60,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(datas[index].title),
                        Text("标题2"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text("阅读量"),
                        Text("时间"),
                      ],
                    ),
                  ),
                ],
              ),
              flex: 1,
            )
          ],
        ),
      );
    }
  }

  Widget _buildBanners(int index, itemData) {
    return Image.network(
      itemData,
      fit: BoxFit.fill,
    );
  }

  Widget _buildSwiper(BuildContext context, int index) {
    return Image.network(
      _banners[index],
      fit: BoxFit.fill,
    );
  }

  void getBanners() {
    HttpClient client = HttpClient();
    client
        .getUrl(Uri.parse("http://www.wanandroid.com/banner/json"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {
        // handle data
        Map<String, dynamic> user = json.decode(contents);
        bannerItem = BannerItem.fromJson(user);
        print("==================");

        print(bannerItem.data.first.url) ;
        print(bannerItem.errorCode);

        setState(() {
          datas = bannerItem.data;
        });

        print(datas[1].title);
      });
    });
  }
}
