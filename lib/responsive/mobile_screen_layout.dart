import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:paragram/screens/add_post_screen.dart';
import 'package:paragram/utils/colors.dart';
import 'package:paragram/utils/global_variables.dart';

import '../screens/add_post_screen_2.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            label: '',
          )
        ],
        onTap: navigationTapped,
        backgroundColor: mobileBackgroundColor,
      ),
      floatingActionButton: Builder(builder: (context) {
        return FabCircularMenu(
            alignment: Alignment.bottomCenter,
            ringColor: secondaryColor,
            ringDiameter: 300,
            ringWidth: 80,
            animationCurve: Curves.fastOutSlowIn,
            fabOpenIcon: Icon(Icons.add),
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPostScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.photo_album),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPostScreen2()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {},
              ),
            ]);
      }),
    );
  }
}
