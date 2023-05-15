import 'package:employe_id/Screen/template_screen.dart';
import 'package:employe_id/constents.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // <---------- TEMPLATE PART ---------->
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateScreen(),));
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 90),
                        height: 200,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: secondary_color,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'TEMPLATE',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: primary_color,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(75),
                            bottomRight: Radius.circular(75),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 9, bottom: 14),
                        child: Image.asset(
                          'assets/images/templet_image.png',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),

                // <---------- SAVED PART ---------->
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 90),
                      height: 200,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: secondary_color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'SAVED',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: primary_color,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(75),
                          bottomRight: Radius.circular(75),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 23, right: 23, top: 18, bottom: 22),
                      child: Image.asset(
                        'assets/images/saved_image.png',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
