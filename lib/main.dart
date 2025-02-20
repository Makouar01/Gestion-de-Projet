import 'package:flutter/material.dart';
import 'package:gestionprojet/CreateProject/CreateProjectPage.dart';
import 'package:gestionprojet/Schedule/Schedule.dart';
import 'package:gestionprojet/profil/SettingsPage.dart';
import 'Home/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF202932), // Updated background color
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF202932), // Updated AppBar background color
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CreateProjectPage(), // Updated placeholder colors
    SchedulePage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF202932), // Set bottom nav background color
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Added to ensure all items are visible
          backgroundColor: Color(0xFF202932),
          selectedItemColor: Color(0xFFFED36A),
          unselectedItemColor: Colors.white54,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}