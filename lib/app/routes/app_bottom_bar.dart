import 'package:an_app_vone/app/routes/search_initialpage.dart';
import 'package:an_app_vone/app/routes/search_page.dart';
import 'package:flutter/material.dart';

import '../modules/home/views/rubrik_antara.dart';
import '../modules/login/views/login_antara.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize() {
      return MediaQuery.of(context).size;
    }

    return SizedBox(
      height: 73,
      child: Container(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
            children: [
              // const SizedBox(width: 36,),
              Container(width: (screenSize().width - 56*5 - 10*4) / 2),
              SizedBox(
                width: 56,
                height: 57,
                // color: Colors.grey,
                child: Row(
                  children: [
                    const SizedBox(width: 9,),
                    Expanded(
                      child: GestureDetector(
                        // onTap: () {},
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RubrikView(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              const SizedBox(height: 6,),
                              SizedBox(
                                height: 24,
                                child: Image.asset(
                                  'assets/icons/Home.png',
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                              ),
                              // Icon(Icons.favorite_outline),
                              const SizedBox(height: 8,),
                              const Text('Beranda', style: TextStyle(fontSize: 10),),
                            ]
                        ),
                      ),
                    ),
                    const SizedBox(width: 9,),
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 56,
                height: 57,
                // color: Colors.grey,
                child: Row(
                  children: [
                    const SizedBox(width: 9,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchInitialPage(),
                            ),
                          );
                        },
                        child: Column(
                            children: [
                              const SizedBox(height: 6,),
                              SizedBox(
                                height: 24,
                                child: Image.asset(
                                  'assets/icons/Search.png',
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                              ),
                              // Icon(Icons.favorite_outline),
                              const SizedBox(height: 8,),
                              const Text('Cari', style: TextStyle(fontSize: 10),),
                            ]
                        ),
                      ),
                    ),
                    const SizedBox(width: 9,),
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RubrikView(),
                    ),
                  );
                },
                child: Container(
                  width: 56,
                  height: 57,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  // color: Colors.black,
                  child: Row(
                    children: [
                      const SizedBox(width: 9,),
                      Expanded(
                        child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 8.5,
                                          height: 8.5,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                                          ),
                                        ),
                                        const SizedBox(width: 1,),
                                        Container(
                                          width: 8.5,
                                          height: 8.5,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 1,),
                                    Row(
                                      children: [
                                        Container(
                                          width: 8.5,
                                          height: 8.5,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                                          ),
                                        ),
                                        const SizedBox(width: 1,),
                                        Container(
                                          width: 8.5,
                                          height: 8.5,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],

                                ),
                              ),
                              const SizedBox(height: 6,),
                              const Text('Rubrik', style: TextStyle(fontSize: 10, color: Colors.white),),
                            ]
                        ),
                      ),
                      const SizedBox(width: 9,),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 56,
                height: 57,
                // color: Colors.grey,
                child: Row(
                  children: [
                    const SizedBox(width: 9,),
                    Expanded(
                      child: GestureDetector(
                        // onTap: () {},
                        onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Login();
                            }
                        ))),
                        child: Column(
                            children: [
                              const SizedBox(height: 6,),
                              SizedBox(
                                height: 24,
                                child: Image.asset(
                                  'assets/icons/Heart.png',
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                              ),
                              // Icon(Icons.favorite_outline),
                              const SizedBox(height: 8,),
                              const Text('Disuka', style: TextStyle(fontSize: 10),),
                            ]
                        ),
                      ),
                    ),
                    const SizedBox(width: 9,),
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 56,
                height: 57,
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: GestureDetector(
                  // onTap: () {},
                  onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Login();
                      }
                  ))),
                  child: Column(
                      children: [
                        const SizedBox(height: 2,),
                        SizedBox(
                          height: 26,
                          child: Image.asset(
                            'assets/icons/Profile.png',
                            fit: BoxFit.contain,
                            color: Colors.black,
                          ),
                        ),
                        // Icon(Icons.favorite_outline),
                        const SizedBox(height: 6,),
                        const Text('Akun', style: TextStyle(fontSize: 10),),
                      ]
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
