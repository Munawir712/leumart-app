import 'package:flutter/material.dart';
import 'package:ransel_app/pages/home_page.dart';
import 'package:ransel_app/pages/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  late PageController pageController;

  List<String> iconImg = ['home', 'basket', 'store', 'menu'];

  @override
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            const HomePage(),
            Container(
              color: Colors.red[100],
            ),
            Container(
              color: Colors.purple[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: const Color(0xFFBDBDBD),
          showUnselectedLabels: true,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
            pageController.jumpToPage(selectedIndex);
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/icons/home${(selectedIndex == 0) ? ".png" : "-n.png"}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/icons/basket${(selectedIndex == 1) ? ".png" : "-n.png"}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Toko",
              icon: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/icons/store${(selectedIndex == 2) ? ".png" : "-n.png"}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Lainnya",
              icon: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/icons/menu${(selectedIndex == 3) ? ".png" : "-n.png"}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
