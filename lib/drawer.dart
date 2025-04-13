import 'package:custom_drawer/setting.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 32, 63, 88),
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'BK APPS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                NewRow(
                  text: 'Settings',
                  icon: Icons.settings_outlined,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
                  },
                  text: 'Profile',
                  icon: Icons.person_2_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
                  },
                  text: 'Messages',
                  icon: Icons.messenger_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
                  },
                  text: 'Saved',
                  icon: Icons.bookmark_add_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                    },
                    text: 'Favorites',
                    icon: Icons.favorite_outline),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
                  },
                  text: 'Hint',
                  icon: Icons.light_outlined,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.white.withOpacity(0.5),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log out',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const NewRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
