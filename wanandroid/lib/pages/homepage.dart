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
    //获取banners
    getBanners();
    //获取首页文章
    getArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: ListView.builder(
            itemBuilder: _buildItem,
            itemCount: datas.length,
          )),
    );
  }

  /// 列表item
  Widget _buildItem(BuildContext context, int index) {
    return Card(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          leading: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg',
            width: 50,
            height: 50,
          ),
          title: Text(
            datas[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("副标题"),
          trailing: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text("阅读量"),
                Text("时间"),
              ],
            ),
          ),
          onTap: () {
            print("点击了第$index");
          },
        ));
  }

  /// banner
  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      datas[index].imagePath,
      fit: BoxFit.fill,
    );
  }

  ///获取banner数据
  void getBanners() async {
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

  ///banner
  Widget buildBannerLayout(BuildContext context, int index) {
    if (datas.length > 0) {
      return new Container(
        height: 200,
        child: Swiper(
          itemCount: datas.length,
          itemBuilder: _buildBanner,
          pagination: new SwiperPagination(),
          autoplay: true,
          onTap: clickBanner,
        ),
      );
    } else {
      return Container(
        child: LinearProgressIndicator(
          backgroundColor: Colors.blueAccent,
          valueColor: AlwaysStoppedAnimation(Colors.yellow),
        ),
      );
    }
  }

  /// 获取首页文章
  void getArticles() {
    HttpClient client = HttpClient();
    client
        .getUrl(Uri.parse("http://www.wanandroid.com/article/list/0/json"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {

      });
    });
  }

  ///顶部banner和标题栏
  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        title: Text("首页"),
        centerTitle: true, //标题居中
        expandedHeight: 200.0, //展开高度200
        floating: false, //不随着滑动隐藏标题
        pinned: false, //固定在顶部
        leading: null,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Swiper(
            itemCount: 3,
            itemBuilder: buildBannerLayout,
            pagination: new SwiperPagination(),
            autoplay: true,
          ),
        ),
      )
    ];
  }
}
