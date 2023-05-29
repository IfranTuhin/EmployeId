import 'dart:io';
import 'dart:typed_data';
import 'package:employe_id/Provider/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class Template1 extends StatefulWidget {
  const Template1({
    Key? key,
  }) : super(key: key);

  @override
  State<Template1> createState() => _Template1();
}

class _Template1 extends State<Template1> {
  // image screenshot
  Uint8List? _frontPartImage;
  ScreenshotController frontScreenshotController = ScreenshotController();
  Uint8List? _backPartImage;
  ScreenshotController backScreenshotController = ScreenshotController();

  // pdf
  final pdf = pw.Document();

  // image
  final image = Image.asset('assets/raw/thumb1.png');

  @override
  Widget build(BuildContext context) {

    // loader
    bool loader = false;
    // data controller provider
    final data = Provider.of<DataController>(context);

    List<File> imageFiles = [
      File("${_frontPartImage}"), // Replace with the path to your first image file
      File("${_backPartImage}"), // Replace with the path to your second image file
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // Template front part
                  Screenshot(
                    controller: frontScreenshotController,
                    child: Container(
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
                            "${data.userCompanyName}",
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
                              color: Colors.white,
                            ),
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
                                    text: 'ID NO   : ',
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
                                // user blood group
                                data.userBlood != null
                                    ? RichText(
                                        text: TextSpan(
                                          text: 'Blood   : ',
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '${data.userBlood}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const Text(""),
                                // user phone
                                data.userPhone != null
                                    ? RichText(
                                        text: TextSpan(
                                          text: 'Phone  : ',
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '${data.userPhone}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      )
                                    : const Text(""),
                                // user E-mail
                                data.userEmail != null
                                    ? RichText(
                                        text: TextSpan(
                                          text: 'E-mail  : ',
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '${data.userEmail}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      )
                                    : const Text(""),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Template Back Part
                  Screenshot(
                    controller: backScreenshotController,
                    child: Container(
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
                          const SizedBox(
                            height: 60,
                          ),
                          // Term 1
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: data.userTerm1 != null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                          "${data.userTerm1}",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(""),
                          ),
                          // Term 2
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 3),
                            child: data.userTerm2 != null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                          "${data.userTerm2}",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(""),
                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          // user join & expire date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Join Date     : ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${data.userJoinDate}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Expire Date  : ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${data.userExpireDate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
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
                            padding: EdgeInsets.symmetric(horizontal: 60),
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
                          const SizedBox(
                            height: 130,
                          ),
                          Text(
                            "${data.userCompanyName}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Save Template
            loader == true ? const Center(child: CircularProgressIndicator(),) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    loader = true;
                  });
                  frontPartScreenshotImage();
                  backPartScreenshotImage();
                  convertImageToPdf();
                  _saveImageToPdf();
                  setState(() {
                    loader = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueAccent,
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

  // Front Part Screenshot Image
  frontPartScreenshotImage() {
    frontScreenshotController.capture().then((Uint8List? image) {
      setState(() {
        _frontPartImage = image;
        print("front part image capture successfully");
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  // Back Part Screenshot Image
  backPartScreenshotImage() {
    backScreenshotController.capture().then((Uint8List? image) {
      setState(() {
        _backPartImage = image;
        print("back part image capture successfully");
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  // Converting the image to pdf
  convertImageToPdf() async {
    // var  convertFrontPartImage = PdfImage.file(pdf.document, bytes: ( _frontPartImage!.buffer.asUint8List()));
    // final convertFrontPartImage = pw.MemoryImage(_frontPartImage.readAsBytesSync());
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
           return pw.Center();
        },
      ),
    );
  }

  // Save the image to pdf
  _saveImageToPdf() async {
    try{
      final dir = await getApplicationDocumentsDirectory();
      final pdfFile = File('${dir.path}/fileName.pdf');
      await pdfFile.writeAsBytes(await pdf.save());
      print("Pdf Successfully saved document");
    }catch(e){
      print("error -------${e}");
    }
  }

}
