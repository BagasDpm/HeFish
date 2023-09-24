import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hefish/auth/loginScreen.dart';
import 'package:hefish/model/authenticate.dart';
import 'package:hefish/model/ecosystem_slider_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hefish/pages/ecosystem_page.dart';
import 'package:hefish/utility/session.dart';
import 'package:hefish/utility/util.dart';
import 'package:get/get.dart';

import 'animation/page_route_animation.dart';
import 'constant/styles/imagePallet.dart';
import 'model/google_auth.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listTopSlide = [tslid0, tslid1, tslid2, tslid3];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        primary: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Transform.scale(
            scale: 4,
            child: Image.asset(appbar),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              try {
                await GoogleAuth.googleLogout();
              } catch (e) {}
              logOut(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.5),
              child: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 50,
              width: _size.width,
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Hello, Stefano Yauris',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // ============== Slider Top =================
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: SizedBox(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                  ),
                  items: listTopSlide
                      .map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 1000.0,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            // ========== Slider Ecosystem ==============
            Container(
              width: _size.width,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Ecosystem',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(AnimatedPageRouteLeft(
                              child: EcosystemPage(
                                collectProduct: 'All',
                         
                              ),
                            ));
                          },
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 150, 150, 150),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                FontAwesomeIcons.angleRight,
                                color: Color.fromARGB(255, 150, 150, 150),
                                size: 18,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        color: Colors.transparent,
                        width: _size.width * 0.9,
                        height: _size.height * 0.37,
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 250,
                            scrollDirection: Axis.vertical,
                            autoPlay: false,
                            aspectRatio: 1.0,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            viewportFraction: 0.52,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.of(context)
                                      .push(AnimatedPageRouteLeft(
                                    child: EcosystemPage(
                                      collectProduct: 'Salt Water',
                                 
                                    ),
                                  ));
                                } else if (index == 1) {
                                  Navigator.of(context)
                                      .push(AnimatedPageRouteLeft(
                                    child: EcosystemPage(
                                      collectProduct: 'Fresh Water',
                                   
                                    ),
                                  ));
                                } else if (index == 2) {
                                  Navigator.of(context)
                                      .push(AnimatedPageRouteLeft(
                                    child: EcosystemPage(
                                      collectProduct: 'Mix Water',
                                    ),
                                  ));
                                }
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 8.0,
                                shadowColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              listEcoType[index].image,
                                              width: 150,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            listEcoType[index].ecoType,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          FontAwesomeIcons.angleRight,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: listEcoType.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
