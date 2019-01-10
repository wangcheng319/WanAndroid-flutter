import 'package:flutter/material.dart';

///我
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> items = [];
    for (int i = 0; i < 100; i++) {
      items.add(i);
    }
    return Container(
      child: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: items.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        color: Colors.blueAccent,
        width: 200,
        height: 100,
      );
    } else {
      return Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            child: Image.network(
                "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg"),
          ),
          Expanded(
            child: new Column(
              children: <Widget>[
                Text("1"),
                Text("2"),
              ],
            ),
            flex: 1,
          )
        ],
      );
    }
  }
}
