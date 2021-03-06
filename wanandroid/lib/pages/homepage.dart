import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

import '../data/article_list.dart';
import '../data/banneritem.dart';

///主页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  BannerItem bannerItem;
  int currentPage = 0;
  List datas = [];
  List articlLists = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMoreArticles();
      }
    });

    //获取banners
    getBanners();
    //获取首页文章
    getArticles(currentPage);

    print("1创建");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: RefreshIndicator(child: _buildArticleList(), onRefresh: _onRefresh)),
    ));
  }

  /// 列表item
  Widget _buildItem(BuildContext context, int index) {
    if (index == articlLists.length) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          ),
          Text("加载更多……")
        ],
      ));
    } else {
      Datas datas = articlLists[index];
      //滑动删除widget
      return Dismissible(
        key: Key(datas.title),
        onDismissed: (direction) {
          setState(() {
            articlLists.removeAt(index);
          });
        },
        child: Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                datas.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(datas.author),
              trailing: Container(
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    children: <Widget>[
                      Text(datas.chapterName),
//                      Text(datas.niceDate),
                    ],
                  ),
                ),
              ),
              onTap: () {
                print(datas.link);
                jumpToWebView(datas.link);
              },
            )),
      );
    }
  }

  /// banner
  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      datas[index].imagePath, //datas[index]["imagePath"]
      fit: BoxFit.fill,
    );
  }

  ///获取banner数据
  void getBanners() async {
    String dataURL = "http://www.wanandroid.com/banner/json";
    http.Response response = await http.get(dataURL);
    bannerItem = BannerItem.fromJson(json.decode(response.body));
    setState(() {
//      datas = json.decode(response.body)["data"];//这种方式不用json序列化，要什么字段直接取
      datas = bannerItem.data;
    });
  }

  ///点击banner
  void clickBanner(int index) {
    print(datas[index].url);
    jumpToWebView(datas[index].url);
  }

  ///banner
  Widget buildBannerLayout() {
    if (datas.length > 0) {
      return Container(
        height: 200,
        child: Swiper(
          itemCount: datas.length,
          itemBuilder: _buildBanner,
          pagination: SwiperPagination(),
          autoplay: true,
          onTap: clickBanner,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
          valueColor: AlwaysStoppedAnimation(Colors.yellow),
        ),
      );
    }
  }

  /// 获取首页文章
  void getArticles(int page) async {
    String url = "http://www.wanandroid.com/article/list/$page/json";
    http.Response response = await http.get(url);
    ArticleList articleList = ArticleList.fromJson(json.decode(response.body));
    if (page == 0) {
      articlLists.clear();
    }
    setState(() {
      articlLists.addAll(articleList.data.datas);
      currentPage++;
    });
  }

  ///顶部banner和标题
  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        title: Text("首页"),
        centerTitle: true, //标题居中
        expandedHeight: 200.0, //展开高度200
        floating: false, //不随着滑动隐藏标题
        pinned: true, //固定在顶部
        leading: null,
        flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none, centerTitle: true, background: buildBannerLayout()),
      )
    ];
  }

  ///加载更多
  void loadMoreArticles() {
    print("加载更多");
    getArticles(currentPage);
  }

  Future<void> _onRefresh() async {
    await Future.sync(() {
      print("下拉刷新");
      getArticles(0);
    });
  }

  _buildArticleList() {
    if (articlLists.length > 0) {
      return ListView.builder(
        itemBuilder: _buildItem,
        itemCount: articlLists.length + 1,
        controller: _scrollController,
      );
    } else {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          ),
          Text("加载中……")
        ],
      ));
    }
  }

  ///跳转到webview
  void jumpToWebView(url) {
//    Navigator.push(context, new MaterialPageRoute(builder: (context) {
//      return WebviewScaffold(url: url);
//    }));
  }

  ///设置为true，页面切换会保存状态
  @override
  bool get wantKeepAlive => true;
}
