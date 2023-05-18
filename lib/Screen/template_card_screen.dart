import 'dart:io';

import 'package:flutter/material.dart';


class TemplateCardScreen extends StatefulWidget {

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

  TemplateCardScreen({Key? key,
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
  State<TemplateCardScreen> createState() => _TemplateCardScreenState();
}

class _TemplateCardScreenState extends State<TemplateCardScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              // color: Colors.red,
              child: ListView(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.11,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      image: DecorationImage(
                        image: Image.asset("assets/raw/tm1_front.png").image,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        // Company name text
                        Text(
                          "${widget.userCompanyName}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 31.8,
                        ),
                        // user Image
                        Container(
                          margin: const EdgeInsets.only(left: 9.5),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(widget.userImage!,fit: BoxFit.cover,),
                          ),
                        ),
                        // User name
                        const SizedBox(
                          height: 40,
                        ),
                        // user name text
                        Text(
                          "${widget.userName}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Job Position
                        Text(
                          "${widget.userJobPosition}",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // user id
                              RichText(
                                text: TextSpan(
                                  text: 'ID NO  : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '${widget.userIdNo}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              // user blood group
                              RichText(
                                text: TextSpan(
                                  text: 'Blood  : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '${widget.userBlood}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              // user phone
                              RichText(
                                text: TextSpan(
                                  text: 'Phone  : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '${widget.userPhone}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              // user E-mail
                              RichText(
                                text: TextSpan(
                                  text: 'E-mail  : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '${widget.userEmail}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Template Back Part
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.11,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      image: DecorationImage(
                        image: Image.asset("assets/raw/tm1_back.png").image,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        // Term 1
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/1.4,
                                child: Text(
                                  "${widget.userTerm1}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Term 2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/1.4,
                                child: Text(
                                  "${widget.userTerm2}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40,),

                        // user join & expire date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Join Date  : ',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: '${widget.userJoinDate}', style: const TextStyle(fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            RichText(
                              text: TextSpan(
                                text: 'Expire Date  : ',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: '${widget.userExpireDate}', style: const TextStyle(fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80,),
                        // Authorised Sincerely
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.black54,
                          ),
                        ),
                        const Text("Authorised Sincerely", style: TextStyle(fontSize: 18, color: Colors.black54,),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            // Save Template
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueAccent,
                  ),
                  child: const Text("Save Template", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
