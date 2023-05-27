import 'dart:io';


import 'package:employe_id/Screen/All_Template/template1.dart';
import 'package:employe_id/Screen/All_Template/template10.dart';
import 'package:employe_id/Screen/All_Template/template11.dart';
import 'package:employe_id/Screen/All_Template/template12.dart';
import 'package:employe_id/Screen/All_Template/template13.dart';
import 'package:employe_id/Screen/All_Template/template14.dart';
import 'package:employe_id/Screen/All_Template/template15.dart';
import 'package:employe_id/Screen/All_Template/template17.dart';
import 'package:employe_id/Screen/All_Template/template18.dart';
import 'package:employe_id/Screen/All_Template/template19.dart';
import 'package:employe_id/Screen/All_Template/template2.dart';
import 'package:employe_id/Screen/All_Template/template20.dart';
import 'package:employe_id/Screen/All_Template/template21.dart';
import 'package:employe_id/Screen/All_Template/template22.dart';
import 'package:employe_id/Screen/All_Template/template23.dart';
import 'package:employe_id/Screen/All_Template/template24.dart';
import 'package:employe_id/Screen/All_Template/template25.dart';
import 'package:employe_id/Screen/All_Template/template3.dart';
import 'package:employe_id/Screen/All_Template/template4.dart';
import 'package:employe_id/Screen/All_Template/template5.dart';
import 'package:employe_id/Screen/All_Template/template6.dart';
import 'package:employe_id/Screen/All_Template/template7.dart';
import 'package:employe_id/Screen/All_Template/template8.dart';
import 'package:employe_id/Screen/All_Template/template9.dart';
import 'package:flutter/material.dart';

import '../constents.dart';

class AllThumbScreen extends StatefulWidget {
  const AllThumbScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllThumbScreen> createState() => _AllThumbScreenState();
}

class _AllThumbScreenState extends State<AllThumbScreen> {
  List images = [
    "assets/raw/thumb1.png",
    "assets/raw/thumb2.png",
    "assets/raw/thumb3.png",
    "assets/raw/thumb4.png",
    "assets/raw/thumb5.png",
    "assets/raw/thumb6.png",
    "assets/raw/thumb7.png",
    "assets/raw/thumb8.png",
    "assets/raw/thumb9.png",
    "assets/raw/thumb10.png",
    "assets/raw/thumb11.png",
    "assets/raw/thumb12.png",
    "assets/raw/thumb13.png",
    "assets/raw/thumb14.png",
    "assets/raw/thumb15.png",
    "assets/raw/thumb17.png",
    "assets/raw/thumb18.png",
    "assets/raw/thumb19.png",
    "assets/raw/thumb20.png",
    "assets/raw/thumb21.png",
    "assets/raw/thumb22.png",
    "assets/raw/thumb23.png",
    "assets/raw/thumb24.png",
    "assets/raw/thumb25.png",
  ];

  List pages = [
    Template1(),
    Template2(),
    Template3(),
    Template4(),
    Template5(),
    Template6(),
    Template7(),
    Template8(),
    Template9(),
    Template10(),
    Template11(),
    Template12(),
    Template13(),
    Template14(),
    Template15(),
    Template17(),
    Template18(),
    Template19(),
    Template20(),
    Template21(),
    Template22(),
    Template23(),
    Template24(),
    Template25(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Choose any card",
        ),
        backgroundColor: primary_color,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => pages[index],
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 210,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(images[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
