import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = '';
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    setState(() {
      pageController.jumpToPage(page);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
    // print(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          // ignore: prefer_const_literals_to_create_immutables
          children: homeScreenItems),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: navigationTapped,
        selectedItemColor: Colors.blue,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home,
                  color: _page == 0 ? Colors.blue : secondaryColor),
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                Icons.search,
                color: _page == 1 ? Colors.blue : secondaryColor,
              ),
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              label: 'Add',
              icon: Icon(
                Icons.add_circle,
                color: _page == 2 ? Colors.blue : secondaryColor,
              ),
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite,
                  color: _page == 3 ? Colors.blue : secondaryColor),
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person,
                  color: _page == 4 ? Colors.blue : secondaryColor),
              backgroundColor: primaryColor),
        ],
      ),
    );
  }
}
