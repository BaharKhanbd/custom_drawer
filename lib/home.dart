import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DashboardPage(),
    DiscoverPage(),
    ProfilePage(),
  ];
  BoxDecoration _neumorphicBox() {
    return BoxDecoration(
      color: const Color(0xFFE0E5EC),
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(color: Colors.white, offset: Offset(-5, -5), blurRadius: 15),
        BoxShadow(
            color: Color(0xFFA3B1C6), offset: Offset(5, 5), blurRadius: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? GestureDetector(
                          child: Icon(Icons.arrow_back_ios),
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: Icon(Icons.menu),
                          onTap: () {
                            setState(() {
                              xOffset = 290;
                              yOffset = 80;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  Text(
                    'Beautiful Drawer',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        decoration: TextDecoration.none),
                  ),
                  GestureDetector(
                    child: Icon(Icons.notifications_none),
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    key: ValueKey<int>(_selectedIndex),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 220,
                    child: _pages[_selectedIndex],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: _neumorphicBox(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: GNav(
                      gap: 10,
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      backgroundColor: Colors.transparent,
                      color: Colors.grey[700],
                      activeColor: Colors.white,
                      tabBackgroundColor: const Color.fromARGB(255, 49, 68, 97),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      tabs: const [
                        GButton(icon: Icons.dashboard, text: 'Dashboard'),
                        GButton(icon: Icons.search, text: 'Discover'),
                        GButton(icon: Icons.person, text: 'Profile'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Container(
        height: 2000,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text('🏡 Dashboard',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
      )),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Container(
        height: 2000,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text('🔎 Discover',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
      )),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Container(
        height: 2000,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text('🙍‍♂️ Profile',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
      )),
    );
  }
}
