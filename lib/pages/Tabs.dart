import 'package:flutter/material.dart';
import 'package:myjingdong/pages/tabs/HomePage.dart';
import 'package:myjingdong/pages/tabs/MinePage.dart';
import 'package:myjingdong/pages/tabs/ShoppingCartPage.dart';
import 'tabs/Category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 1;

  //首页  分类  购物车  我的
  final List<Widget> _pageList = [HomePage(),Category(), ShoppingCartPage(), MinePage()];

  late PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        minTextAdapt: true,
        orientation: Orientation.landscape,
        context: context
    );

    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        onPageChanged: (int index){//切换页面的时候会执行这里
          print('这是我要打印的--${index}');
        },

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//设置这个才能有多个item,不然不显示
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            //跳转页面
            this._pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '我的',
          ),
        ],
      ),

    );
  }
}
