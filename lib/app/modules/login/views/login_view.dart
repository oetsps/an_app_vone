import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


class LoginView extends GetView<LoginController> {
  final String title = ' Login';
  final authC = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: PopupMenuButton(
          color: Colors.grey[300],
          icon: const Icon(Icons.list, color: Colors.black87),
          itemBuilder: (context) => authC.getLoginStatus() ? popupMenuLoggedIn : popupMenu,
          onSelected: (String newValue) {
            if (newValue != Routes.LOGIN) {
              // Navigator.of(context).pushNamed(newValue);
              Get.offAllNamed(newValue);
            }
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/antara.png',
              fit: BoxFit.contain,
              height: 22,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              height: 200,
              // color: Color(0xFF0B5D98),
              child: Image.asset(
                "assets/images/antara-id.png",
                fit: BoxFit.contain,
              )
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: const Text(
                'Silahkan masuk dengan email.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailC,
                      decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email_outlined),),
                      keyboardType: TextInputType.emailAddress,
                      // onChanged: (val) {setState(() {_emailVal = val;});},
                      validator: (val) {
                        if (
                          val!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)
                        ) {
                          return 'Masukan akun email yang benar !';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      controller: controller.passC,
                      decoration: const InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock_outline),),
                      validator: (val) => val!.length < 6 ? 'Masukan kata sandi minimal 6 karakter !' : null,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ]
                ),
              )
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {}
                else {
                  String? error = await authC.login(controller.emailC.text, controller.passC.text);
                  // if (userLog) {Get.offAllNamed(Routes.HOME);}
                  if (error != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error),));
                  }
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300],),
              child: const Text('LOGIN', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {Get.toNamed(Routes.SIGNUP);},
                  text: 'Daftar',
                  style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33), fontStyle: FontStyle.italic),
                  children: const [
                    TextSpan(
                      text: ' atau masuk menggunakan',
                      style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
                    ),
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    print('klik Facebook');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 30)
                      ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF3B5998),
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fb.png'),
                      const SizedBox(width: 7,),
                      const Text(
                        'Facebook',
                        style: TextStyle(fontSize: 16, color: Color(0xFF3B5998)),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    print('klik Twitter');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 30)
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF1DA1F2),
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/twitter.png'),
                      const SizedBox(width: 7,),
                      const Text(
                        'Twitter',
                        style: TextStyle(fontSize: 16, color: Color(0xFF1DA1F2)),
                      ),
                    ],
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

// 00:40:15