import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:test1/wavy_clipper.dart';

class BottomBarWithNormalStyle extends StatefulWidget {
  const BottomBarWithNormalStyle({super.key});

  @override
  State<BottomBarWithNormalStyle> createState() =>
      _BottomBarWithNormalStyleState();
}

class _BottomBarWithNormalStyleState extends State<BottomBarWithNormalStyle> {
  List<TabData> tabs = [];
  final Color _inactiveColor = Colors.black;
  Color _currentColor = Colors.black;
  int _currentPage = 0;
  late String _currentTitle;

  @override
  void initState() {
    super.initState();
    tabs = [
      TabData(
        iconData: Icons.home,
        title: "Home",
        tabColor: Colors.deepPurple,
        tabGradient: getGradient(Colors.deepPurple),
      ),
      TabData(
        iconData: Icons.search,
        title: "Search",
        tabColor: Colors.pink,
        tabGradient: getGradient(Colors.pink),
      ),
      TabData(
        iconData: Icons.alarm,
        title: "Alarm",
        tabColor: Colors.amber,
        tabGradient: getGradient(Colors.amber),
      ),
      TabData(
        iconData: Icons.settings,
        title: "   Settings ",
        tabColor: Colors.teal,
        tabGradient: getGradient(Colors.teal),
      ),
    ];
    _currentTitle = tabs[0].title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Normal Style Demo"),
      ),
      body: Center(
        child: Text(
          _currentTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: _currentColor),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // لون الظل
              offset: Offset(0, 95), // تحريك الظل للأسفل
              blurRadius: 8, // تأثير الضبابية
              spreadRadius: 4, // انتشار الظل
            ),
          ],
        ),
        child: ClipPath(
          clipper: WavyClipper(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: CubertoBottomBar(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              key: const Key("BottomBar"),
              inactiveIconColor: _inactiveColor,
              tabStyle: CubertoTabStyle.styleNormal,
              selectedTab: _currentPage,
              tabs: tabs
                  .map(
                    (value) => TabData(
                  key: Key(value.title),
                  iconData: value.iconData,
                  title: value.title,
                  tabColor: value.tabColor,
                  tabGradient: value.tabGradient,
                ),
              )
                  .toList(),
              onTabChangedListener: (position, title, color) {
                setState(() {
                  _currentPage = position;
                  _currentTitle = title;
                  if (color != null) {
                    _currentColor = color;
                  }
                });
              },
            ),
          ),
        ),
      )
      ,
    );
  }
}

LinearGradient getGradient(Color color) => LinearGradient(
      colors: [
        color.withOpacity(0.5),
        color.withOpacity(0.1),
      ],
      stops: const [0.0, 0.7],
    );
