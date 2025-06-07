import 'package:flutter/material.dart';
import 'package:archive_infotech_assignment/Views/LeaderBoardScreen/leader_border_screen.dart';
import 'package:archive_infotech_assignment/Views/Navbar/contact_screen.dart';
import 'package:archive_infotech_assignment/Views/Navbar/match_machine_screen.dart';
import 'package:archive_infotech_assignment/Views/Navbar/vip_screen.dart';
import 'package:archive_infotech_assignment/Views/ProfileScreen/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    LeaderboardScreen(),
    MatchMachineScreen(),
    UserVipScreen(),
    UserContactScreen(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF071A2E), Color(0xFF0D1E3B)], // dark blue gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_rows_outlined),
              label: 'Match Machine',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              label: 'Vip',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
