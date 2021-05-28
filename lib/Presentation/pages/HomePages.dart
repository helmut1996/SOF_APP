import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Container(
                    width: 700,
                    height: 50,
                    color: Color(0xFFd4d7dd),
                    child: PreferredSize(
                      preferredSize: new Size(700, 200),
                      child: Container(
                        height: 200,
                        child: TabBar(
                          indicatorColor: Color(0xFFd4d7dd),
                          unselectedLabelColor: Colors.grey,
                          tabs: <Widget>[
                            Container(
                              height: 200,
                              child: Tab(
                                  child: Text(
                                "Facturas\nMARNOR",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                            Container(
                              height: 200,
                              child: Tab(
                                  child: Text(
                                "Facturas\nNORMA",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                            Container(
                              height: 200,
                              child: Tab(
                                  child: Text(
                                "Prefacturas\nMARNOR",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ),
                            Container(
                              height: 200,
                              child: Tab(
                                  child: Text(
                                "Prefacturas\nNORMA",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ),
                    )

                    /*
                  CupertinoTabBar.CupertinoTabBar(
                    const Color(0xFFd4d7dd),
                    const Color(0xFFf7f7f7),
                    [
                      Container(
                        decoration: BoxDecoration(color: Colors.black),
                        child: const Text(
                          "Facturas\n MARNOR",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            fontFamily: "SFProRounded",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "Facturas\n NORMA",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          fontFamily: "SFProRounded",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Prefacturas\n MARNOR",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          fontFamily: "SFProRounded",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Prefacturas\n Norma",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          fontFamily: "SFProRounded",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    cupertinoTabBarValueGetter,
                    (int index) {
                      setState(() {
                        cupertinoTabBarValue = index;
                      });
                    },
                    useShadow: false,
                    innerHorizontalPadding: 5,
                  ),*/
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
