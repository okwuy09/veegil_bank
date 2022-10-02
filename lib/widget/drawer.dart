import 'package:flutter/material.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isdarkmode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/person.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Maduka Okwuchukwu',
                  style: style.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile '),
            onTap: () {
              //Navigator.pop(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile '),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings '),
            onTap: () {
              //Navigator.pop(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            trailing: Switch(
              value: isdarkmode,
              activeColor: AppColor.primaryColor,
              onChanged: (on) {
                setState(() {
                  isdarkmode = on;
                });
              },
            ),
            title: const Text('Dark Mode '),
          ),
          const Divider(height: 5),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Privacy Policy '),
            onTap: () {
              //Navigator.pop(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help '),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          const Divider(height: 5),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
