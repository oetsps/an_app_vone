import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:an_app_vone/app/routes/app_pages.dart';

import '../controllers/auth_controller.dart';


class NavBar extends StatelessWidget {
  final authC = Get.find<AuthController>();

  NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? userName = authC.auth.currentUser!.displayName;
    String? email = authC.auth.currentUser!.email;
    return Drawer(
      width: 200,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName!),
            accountEmail: Text(email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[600],
              child: ClipOval(
                child: Image.asset(
                  'assets/images/bije.png',
                  fit: BoxFit.contain,
                  width: 90,
                  height: 90,
                  scale: 0.5,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/profile-bg3.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Request'),
            onTap: () {},
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () {},
          ),
          const Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
          const Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              authC.logout();
              Get.offAllNamed(Routes.HOME);
              // Navigator.of(context).pushNamed(Routes.HOME);
            },
          ),
        ],
      ),
    );
  }
}
