import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../screens/home.dart';
import '../../screens/explore.dart';
import '../../screens/save.dart';
import '../../screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedBottonNavItem = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    SaveScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: (Platform.isIOS) ? 8 : 14,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    spreadRadius: 5,
                    color: Colors.black12,
                    blurRadius: 30,
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
                selectedItemColor: const Color(0xFF2E8EFF),
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w900),
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
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedBottonNavItem = index;
                });
              },
              selectedIndex: _selectedBottonNavItem,
              destinations: [
                NavigationRailDestination(
                  label: Text('•'),
                  icon: SvgPicture.asset(
                    'assets/icons/icn_navbar/linear/home.svg',
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/icn_navbar/bold/home.svg',
                  ),
                ),
                NavigationRailDestination(
                  label: Text('•'),
                  icon: SvgPicture.asset(
                    'assets/icons/icn_navbar/linear/explore.svg',
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/icn_navbar/bold/explore.svg',
                  ),
                ),
                NavigationRailDestination(
                  label: Text('•'),
                  icon: SvgPicture.asset(
                    'assets/icons/icn_navbar/linear/save.svg',
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/icn_navbar/bold/save.svg',
                  ),
                ),
                NavigationRailDestination(
                  label: Text('•'),
                  icon: SvgPicture.asset(
                    'assets/icons/icn_navbar/linear/profile.svg',
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/icn_navbar/bold/profile.svg',
                  ),
                ),
              ],
              labelType: NavigationRailLabelType.selected,
              selectedLabelTextStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'IranSans-medium',
                color: Color(0xFF2E8EFF),
                // fontWeight: FontWeight.w900
              ),
              useIndicator: true,
              indicatorColor: Color(0xFFEFEFEF),
            ),
          Expanded(child: _screens[_selectedBottonNavItem])
        ],
      ),
    );
  }
}
// [ Note ]
// body: IndexedStack(
//   index: _selectedBottonNavItem,
//   children: [
//     HomeScreen(),
//     ExploreScreen(),
//     SaveScreen(),
//     ProfileScreen(),
//   ],
// ),