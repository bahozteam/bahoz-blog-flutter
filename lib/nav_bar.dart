import 'package:bahoz_blog/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          // showSelectedLabels: false, // با آنکامنت کردن این نقطه های زیر نویگیشن باز مخفی میشن
          selectedFontSize: 16,
          selectedItemColor: const Color(0xFF159F91),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
          items: [
            BottomNavigationBarItem(
              tooltip: 'خانه',
              label: '•',
              icon: SvgPicture.asset(
                'images/icons/nav_bar/linear/home.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'images/icons/nav_bar/bold/home.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'اکسپلور',
              label: '•',
              icon: SvgPicture.asset(
                'images/icons/nav_bar/linear/explore.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'images/icons/nav_bar/bold/explore.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'ذخیره شده',
              label: '•',
              icon: SvgPicture.asset(
                'images/icons/nav_bar/linear/save.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'images/icons/nav_bar/bold/save.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'پروفایل',
              label: '•',
              icon: SvgPicture.asset(
                'images/icons/nav_bar/linear/profile.svg',
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(
                  'images/icons/nav_bar/bold/profile.svg',
                ),
              ),
            ),
          ],
        ),
      ),

      // بعدا اسکرین های کامل شده در اینجا قرار میگیره
      body: IndexedStack(
        index: _selectedBottonNavItem,
        children: [
          const HomeScreen(), // فعلا فقط اسکرین هوم رو قرار دادم
          Container(
            color: Colors.blue[300],
          ),
          Container(
            color: Colors.green[300],
          ),
          Container(
            color: Colors.red[300],
          ),
        ],
      ),
    );
  }
}







