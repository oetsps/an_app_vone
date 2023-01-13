import 'package:an_app_vone/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import '../../profile/views/profile_antara.dart';
import '../../resource/color.dart';
import '../../resource/string.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/text_antara_appbar.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 260,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/signup_banner.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringClass.DAFTAR_TEXT,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringClass.DAFTAR_TEXT_DESC,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      StringClass.USERNAME_TITLE_TEXT,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      // controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: StringClass.USERNAME_HINT_TEXT,
                        prefixIcon:
                            Image.asset('assets/icons/icon_profile.png'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      StringClass.NO_HP_TITLE_TEXT,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      // controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: StringClass.NO_HP_HINT_TEXT,
                        prefixIcon:
                        Image.asset('assets/icons/icon_profile.png'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      StringClass.PASSWORD_TITLE_TEXT,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      // controller: _userPasswordController,
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: StringClass.PASSWORD_TITLE_TEXT,
                        hintText: StringClass.PASSWORD_HINT_TEXT,
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 48,
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                        ),
                      ),
                      child: Text(StringClass.BUTTON_SIGNUP_TEXT),
                      onPressed: () {},
                    ),
                  ),
                  const Divider(
                      color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/icon_google.png'),
                      label: Text(
                        StringClass.BUTTON_SIGNUP_TEXT_GOOGLE,
                        style: const TextStyle(
                            color: ColorClass.TEXT_COLOR_BUTTON_GOOGLE),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringClass.AKUN2_TEXT,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: ColorClass.BLACK_TEXT_2),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextButton(
                        child: Text(
                          StringClass.MASUK_SEKARANG_TEXT,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 13,
                              color: ColorClass.DAFTAR_SEKARANG_TEXT_COLOR,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          //signup screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
