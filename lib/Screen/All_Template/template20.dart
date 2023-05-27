import 'package:employe_id/Provider/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:provider/provider.dart';

class Template20 extends StatefulWidget {
  const Template20({
    Key? key,
  }) : super(key: key);

  @override
  State<Template20> createState() => _Template20();
}

class _Template20 extends State<Template20> {
  @override
  Widget build(BuildContext context) {
    // data controller provider
    final data = Provider.of<DataController>(context);

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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              // color: Colors.red,
              child: ListView(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // Template Front part
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.11,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      image: DecorationImage(
                        image: Image.asset("assets/raw/tm20_front.png").image,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        // Company name text
                        Text(
                          "${data.userCompanyName}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        // user Image
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: ClipPolygon(
                            sides: 4,
                            borderRadius: 20,
                            rotate: 180.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: data.userImage != null
                                  ? Image.file(
                                data.userImage!,
                                fit: BoxFit.cover,
                              )
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    "assets/images/templet_image.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // User name
                        const SizedBox(
                          height: 40,
                        ),
                        // user name text
                        Text(
                          "${data.userName}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Job Position
                        Text(
                          "${data.userJobPosition}",
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
                                  text: 'ID NO    : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${data.userIdNo}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              // user phone
                              data.userPhone != null ? RichText(
                                text: TextSpan(
                                  text: 'Phone   : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${data.userPhone}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ) : const Text(""),
                              // user E-mail
                              data.userEmail != null ? RichText(
                                text: TextSpan(
                                  text: 'E-mail   : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${data.userEmail}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ) : const Text(""),
                              // user blood group
                              data.userBlood != null ? RichText(
                                text: TextSpan(
                                  text: 'Blood    : ',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${data.userBlood}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ) : const Text(""),
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
                        image: Image.asset("assets/raw/tm20_back.png").image,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50,),
                        Text(
                          "${data.userCompanyName}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 100,),
                        // // Term 1
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 8),
                        //   child: data.userTerm1 != null ? Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         height: 20,
                        //         width: 20,
                        //         decoration: const BoxDecoration(
                        //           color: Colors.blueAccent,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 10,
                        //       ),
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width / 1.4,
                        //         child: Text(
                        //           "${data.userTerm1}",
                        //           style: const TextStyle(fontSize: 15),
                        //         ),
                        //       ),
                        //     ],
                        //   ) : const Text(""),
                        // ),
                        // // Term 2
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 3),
                        //   child: data.userTerm2 != null ? Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         height: 20,
                        //         width: 20,
                        //         decoration: const BoxDecoration(
                        //           color: Colors.blueAccent,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 10,
                        //       ),
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width / 1.4,
                        //         child: Text(
                        //           "${data.userTerm2}",
                        //           style: const TextStyle(fontSize: 15),
                        //         ),
                        //       ),
                        //     ],
                        //   ) : const Text(""),
                        // ),

                        const SizedBox(
                          height: 150,
                        ),

                        // user join & expire date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Join Date      : ',
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${data.userJoinDate}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500, color: Colors.black87,),),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Expire Date   : ',
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${data.userExpireDate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500, color: Colors.black87,)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        // Authorised Sincerely
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 70),
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.black54,
                          ),
                        ),
                        const Text(
                          "Authorised Sincerely",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Save Template
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black87,
                  ),
                  child: const Text(
                    "Save Template",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
