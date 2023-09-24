import 'package:flutter/material.dart';
import 'package:hefish/pages/detail_fish_page.dart';
import 'package:hefish/utility/util.dart';

import '../animation/page_route_animation.dart';
import '../constant/styles/imagePallet.dart';
import '../model/authenticate.dart';
import 'add_Fish_Page.dart';

class EcosystemPage extends StatefulWidget {
  final String collectProduct;
  EcosystemPage({
    required this.collectProduct,
    super.key,
  });

  @override
  State<EcosystemPage> createState() => _EcosystemPageState();
}

class _EcosystemPageState extends State<EcosystemPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    if (widget.collectProduct == "All") {
      _tabController.animateTo(0);
    } else if (widget.collectProduct == "Salt Water") {
      _tabController.animateTo(1);
    } else if (widget.collectProduct == "Fresh Water") {
      _tabController.animateTo(2);
    } else if (widget.collectProduct == "Mix Water") {
      _tabController.animateTo(3);
    } else {
      _tabController.animateTo(0);
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                spreadRadius: 0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              ),
            ]),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.black,
          onPressed: () async {
            Navigator.of(context).push(
              AnimatedPageRoutedDiagonal(
                child: AddFishPage(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Image.asset(appbar),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => logOut(context),
            child: InkWell(
              onTap: () => logOut(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: _size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Salt Water',
                    ),
                    Tab(
                      text: 'Fresh Water',
                    ),
                    Tab(
                      text: 'Mix Water',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: _size.width,
              height: _size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    width: 40,
                    height: 60,
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Example Item 1
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(AnimatedPageRouteLeft(
                                child: DetailFishPage(),
                              ));
                            },
                            child: Container(
                              width: 180,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 101, 101, 101),
                                    spreadRadius: -3,
                                    blurRadius: 4,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(itemFish),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 30, bottom: 5),
                                    child: Text('Rose red discus'),
                                  ),
                                  Text('Rp. 100.000'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: _size.width,
                    child: Center(
                      child: Text('Page Salt Water'),
                    ),
                  ),
                  Container(
                    width: _size.width,
                    child: Center(
                      child: Text('Page Fresh Water'),
                    ),
                  ),
                  Container(
                    width: _size.width,
                    child: Center(
                      child: Text('Page Mix Water'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
