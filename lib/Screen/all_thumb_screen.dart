import 'dart:io';

import 'package:employe_id/Screen/template_card_screen.dart';
import 'package:flutter/material.dart';

import '../constents.dart';

class AllThumbScreen extends StatefulWidget {
  File? userImage;
  String? userCompanyName;
  String? userName;
  String? userJobPosition;
  String? userIdNo;
  String? userPhone;
  String? userBlood;
  String? userEmail;
  String? userTerm1;
  String? userTerm2;
  String? userJoinDate;
  String? userExpireDate;

  AllThumbScreen({
    Key? key,
    this.userImage,
    this.userCompanyName,
    this.userName,
    this.userJobPosition,
    this.userIdNo,
    this.userPhone,
    this.userBlood,
    this.userEmail,
    this.userTerm1,
    this.userTerm2,
    this.userJoinDate,
    this.userExpireDate,
  }) : super(key: key);

  @override
  State<AllThumbScreen> createState() => _AllThumbScreenState();
}

class _AllThumbScreenState extends State<AllThumbScreen> {

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemplateCardScreen(
                      userCompanyName: widget.userCompanyName,
                      userImage: widget.userImage,
                      userName: widget.userName,
                      userJobPosition: widget.userJobPosition,
                      userIdNo: widget.userIdNo,
                      userBlood: widget.userBlood,
                      userPhone: widget.userPhone,
                      userEmail: widget.userEmail,
                      userTerm1: widget.userTerm1,
                      userTerm2: widget.userTerm2,
                      userJoinDate: widget.userJoinDate,
                      userExpireDate: widget.userExpireDate,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 210,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/raw/thumb1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
