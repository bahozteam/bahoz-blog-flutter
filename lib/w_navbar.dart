import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/home.dart';
import '../screens/explore.dart';
import '../screens/save.dart';
import '../screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedBottonNavItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 14,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 2,
              color: Colors.black38,
              blurRadius: 100,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedBottonNavItem,
          onTap: (int index) {
            setState(() {
              _selectedBottonNavItem = index;
            });
          },
          showUnselectedLabels: false,
          selectedFontSize: 16,
          selectedItemColor: const Color(0xFF159F91),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
          items: [
            BottomNavigationBarItem(
              tooltip: 'خانه',
              label: '•',
              icon: SvgPicture.asset(
                'assets/icons/icn_navbar/linear/home.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'assets/icons/icn_navbar/bold/home.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'اکسپلور',
              label: '•',
              icon: SvgPicture.asset(
                'assets/icons/icn_navbar/linear/explore.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'assets/icons/icn_navbar/bold/explore.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'ذخیره شده',
              label: '•',
              icon: SvgPicture.asset(
                'assets/icons/icn_navbar/linear/save.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'assets/icons/icn_navbar/bold/save.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'پروفایل',
              label: '•',
              icon: SvgPicture.asset(
                'assets/icons/icn_navbar/linear/profile.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'assets/icons/icn_navbar/bold/profile.svg',
                ),
              ),
            ),
          ],
        ),
      ),

      body: IndexedStack(
        index: _selectedBottonNavItem,
        children: [
          HomeScreen(),
          ExploreScreen(),
          SaveScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
