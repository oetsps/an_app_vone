import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/search_help.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final String title = ' Signup';
  final authC = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/antara.png',
              fit: BoxFit.contain,
              height: 22,
            ),
            const Text(
              ' Signup',
              style: TextStyle(
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
                'Lengkapi nama, akun email dan kata sandi anda.',
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
                      controller: controller.nameC,
                      decoration: const InputDecoration(labelText: "Nama", prefixIcon: Icon(Icons.person_outline),),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Masukan nama anda';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      controller: controller.emailC,
                      decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email_outlined),),
                      keyboardType: TextInputType.emailAddress,
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
                      decoration: const InputDecoration(labelText: "Sandi", prefixIcon: Icon(Icons.lock_outline),),
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
            Row(
              children: [
                Obx((() => Checkbox(
                  activeColor: const Color.fromARGB(255, 162, 41, 33),
                    value: controller.markCheckBox.value,
                    onChanged: (value) => controller.markCheckBox.toggle(),
                  )),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Saya menyetujui ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('klik syarat');
                            },
                          text: 'syarat',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33), fontStyle: FontStyle.italic),
                        ),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('klik ketentuan');
                            },
                          text: 'ketentuan',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33), fontStyle: FontStyle.italic),
                        ),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(color: Colors.black),
                        ),
                        const TextSpan(
                          text: 'dan ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('klik privasi');
                            },
                          text: 'privasi',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33), fontStyle: FontStyle.italic),
                        ),
                        const TextSpan(
                          text: ' ANTARA Kantor Berita Indonesia.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {}
                if (controller.markCheckBox.value) {
                  String? error = await authC.signup(controller.nameC.text, controller.emailC.text, controller.passC.text);
                  if (error != null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error),));
                  }
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lengkapi tanda/checkbox menyetujui!'),)
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(color: Colors.black),
              ),
            ),
        ]),
      )
    );
  }
}
