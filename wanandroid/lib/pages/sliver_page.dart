import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TyhjHomePage extends StatefulWidget {
  @override
  _TyhjHomePageState createState() => _TyhjHomePageState();
}

class _TyhjHomePageState extends State<TyhjHomePage> {
  var products = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  ScrollController _scrollController = ScrollController();
  var title = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels == 0) {
        setState(() {
          title = "";
        });
      } else {
        setState(() {
          title = "首页";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(title),
            centerTitle: true, //标题居中
            expandedHeight: 200.0, //展开高度200
            floating: false, //不随着滑动隐藏标题
            pinned: true, //固定在顶部
            leading: null,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                centerTitle: true,
                background: buildBannerLayout()),
          ),

          ///如果要添加常规widget到CustomScrollView中，必须用SliverToBoxAdapter包裹起来
          SliverToBoxAdapter(
            child: _buildSearch(),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,

            ///SliverChildListDelegate会一次性把全部item绘制出来
            delegate: SliverChildListDelegate(
              products.map((product) {
                return _buildItemList(product);
              }).toList(),
            ),
          ),
          SliverList(

              ///SliverChildBuilderDelegate之渲染屏幕范围内的item
              delegate: SliverChildBuilderDelegate(
            (context, index) => renderItem(context, index),
            childCount: 10,
          )),
          SliverToBoxAdapter(
            child: _buildFooter(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(product) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        "NO.$product",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      color: Colors.blue,
    );
  }

  Widget _buildSearch() {
    return Container(
      height: 100,
      color: Colors.red,
      child: Text("这里放按钮"),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 100,
      color: Colors.red,
      child: Text("这里是footer"),
    );
  }

  buildBannerLayout() {
    return new Container(
      height: 200,
      child: Swiper(
        itemCount: 3,
        itemBuilder: _buildBanner,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1577759731,3108671782&fm=27&gp=0.jpg", //datas[index]["imagePath"]
      fit: BoxFit.fill,
    );
  }

  renderItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        "NO.$index",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      color: Colors.amber,
    );
  }
}
