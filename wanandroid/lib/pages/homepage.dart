import 'dart:ui' as ui;

import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import '../data/banneritem.dart';
import '../data/banner.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///主页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerItem bannerItem;
  List datas = [];

  @override
  void initState() {
    super.initState();

    getBanners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: new Swiper(
              itemCount: datas.length,
              itemBuilder: _buildBanner,
              pagination: new SwiperPagination(),
              autoplay: true,
              onTap: clickBanner,
            ),
          ),
          Container(
            child: new ListView.builder(
              itemBuilder: _buildItem,
              itemCount: datas.length,
            ),
            margin: const EdgeInsets.only(top: 200),
          )
        ],
      ),
    );
  }

  /// 列表item
  Widget _buildItem(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: <Widget>[
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg',
            width: 50,
            height: 50,
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

  /// banner
  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      datas[index].imagePath,
      fit: BoxFit.fill,
    );
  }

  ///获取banner数据
  void getBanners() {
    HttpClient client = HttpClient();
    client
        .getUrl(Uri.parse("http://www.wanandroid.com/banner/json"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {
        // 拿到json数据
        Map<String, dynamic> user = json.decode(contents);
        //json解析
        bannerItem = BannerItem.fromJson(user);
        //刷新数据
        setState(() {
          datas = bannerItem.data;
        });
      });
    });
  }

  ///点击banner
  void clickBanner(int index) {
    print(datas[index].title);
  }
}
