import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hefish/pages/ecosystem_page.dart';
import 'package:hefish/pages/edit_Fish_Page.dart';

import '../animation/page_route_animation.dart';
import '../constant/styles/imagePallet.dart';

import 'package:freestyle_speed_dial/freestyle_speed_dial.dart';

import '../model/authenticate.dart';
import '../utility/util.dart';

class DetailFishPage extends StatefulWidget {
  DetailFishPage({
    super.key,
  });

  @override
  State<DetailFishPage> createState() => _DetailFishPageState();
}

class _DetailFishPageState extends State<DetailFishPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButton: SpeedDialBuilder(
        buttonAnchor: Alignment.center,
        itemAnchor: Alignment.center,
        buttonBuilder: (context, isActive, toggle) => FloatingActionButton(
          onPressed: toggle,
          backgroundColor: Colors.black,
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubicEmphasized,
            turns: isActive ? 0.4 : 0,
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
            ),
          ),
        ),
        itemBuilder: (context, Widget item, i, animation) {
          // radius in relative units to each item
          const radius = 1.3;
          // angle in radians
          final angle = i * (pi / 2) + pi;

          final targetOffset = Offset(
            radius * cos(angle),
            radius * sin(angle),
          );

          final offsetAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: targetOffset,
          ).animate(animation);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: item,
            ),
          );
        },
        items: [
          FloatingActionButton.small(
            backgroundColor: Colors.red,
            onPressed: () {},
            child: const Icon(Icons.delete),
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              Navigator.of(context).push(AnimatedPageRoutedDiagonal(
                child: EditFishPage(),
              ));
            },
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: ClipRRect(
              child: Image.asset(itemFish),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Container(
              height: 70,
              width: _size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(AnimatedPageRouteLeft(
                          child: EcosystemPage(
                            collectProduct: 'All',
                          ),
                        ));
                      },
                      child: Container(
                        width: 50,
                        height: 60,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => logOut(context),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: _size.height * 0.45,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fish Type
                  Text(
                    'Rose red Discus',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Price Fish
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    child: Text(
                      'Rp ' + '2.000.000',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Author Name
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Poster's",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Stefano Yauris',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Type Ecosystem
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Fresh Water'),
                    ],
                  ),

                  // Fish Description
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: _size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "The Rose Red Discus, It's one of the most beautiful fishes that can be found in any aquarium today",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
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
