import 'dart:io';

import 'package:employe_id/constents.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  // Image File
  File? imageFile;

  // Join Current date
  DateTime? joinCurrentDate;
  String? joinFinalDate;
  // Expire Current date
  DateTime? expireCurrentDate;
  String? expireFinalDate;

  // Text editing controller
  TextEditingController companyNameController = TextEditingController();
  TextEditingController yourNameController = TextEditingController();
  TextEditingController jobPositionController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  // Optional Text editing controller
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController term1Controller = TextEditingController();
  TextEditingController term2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Global key for validation
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fill All Items",
        ),
        backgroundColor: primary_color,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First part
            Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  //   ----- Image ----->
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            color: secondary_color,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: primary_color,
                              width: 5,
                            ),
                          ),
                          child: imageFile == null
                              ? const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 45,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    imageFile!,
                                    height: 170,
                                    width: 170,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110, left: 120),
                          child: GestureDetector(
                            onTap: () async {
                              Map<Permission, PermissionStatus> statuses = await [
                                Permission.storage,
                                Permission.camera,
                              ].request();

                              if (statuses[Permission.storage]!.isGranted &&
                                  statuses[Permission.camera]!.isGranted) {
                                _showImagePicker(context);
                                Fluttertoast.showToast(
                                    msg: "Permission Granted",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: secondary_color,
                                    textColor: Colors.black87,
                                    fontSize: 18.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Permission Not Granted",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: secondary_color,
                                    textColor: Colors.black87,
                                    fontSize: 18.0);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    252, 0, 77, 0.6901960784313725),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              // add icon
                              child: const Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //-------------//
                  const SizedBox(
                    height: 30,
                  ),
                  // Company name
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your value";
                        }
                        return null;
                      },
                      controller: companyNameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Write Company name :',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primary_color, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  // Name
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your value";
                        }
                        return null;
                      },
                      controller: yourNameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Write Your Name :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  // Job Position
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your value";
                        }
                        return null;
                      },
                      controller: jobPositionController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Write Job Position :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  // Id Number
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your value";
                        }
                        return null;
                      },
                      controller: idNumberController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Write Id Number :',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Join & Expire date
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Join date
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                DateTime? datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050),
                                );
                                if (datePicked == null) {
                                  return;
                                } else {
                                  setState(() {
                                    joinCurrentDate = datePicked;
                                    joinFinalDate =
                                        "${joinCurrentDate!.day}/${joinCurrentDate!.month}/${joinCurrentDate!.year}";
                                  });
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: secondary_color,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: primary_color, width: 2)),
                                child: const Text(
                                  "Join Date",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              joinFinalDate != null ? joinFinalDate! : "dd/mm/yy",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Expire date
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                DateTime? datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050),
                                );
                                if (datePicked == null) {
                                  return;
                                } else {
                                  setState(() {
                                    expireCurrentDate = datePicked;
                                    expireFinalDate =
                                        "${expireCurrentDate!.day}/${expireCurrentDate!.month}/${expireCurrentDate!.year}";
                                  });
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: secondary_color,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: primary_color, width: 2),
                                ),
                                child: const Text(
                                  "Expire Date",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              expireFinalDate != null
                                  ? expireFinalDate!
                                  : "dd/mm/yy",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Second part
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Optional Items", style: TextStyle(fontSize:21, fontWeight: FontWeight.w500,),),
                const SizedBox(
                  height: 15,
                ),
                // Phone Number
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: 'Write Phone number :',
                      // label: Text("Optional"),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: primary_color, width: 2.0),
                      ),
                    ),
                  ),
                ),
                // Email Address
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: emailAddressController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Email Address',
                     // label: Text("Optional"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Blood Group
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: bloodGroupController,
                    decoration: const InputDecoration(
                      hintText: 'Write Blood Group :',
                      // label: Text("Optional"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Term 2
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: term1Controller,
                    decoration: const InputDecoration(
                      hintText: 'Write Term 1 :',
                      // label: Text("Optional"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Term 2
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: term2Controller,
                    decoration: const InputDecoration(
                      hintText: 'Write Term 2 :',
                      // label: Text("Optional"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      if(globalKey.currentState!.validate()){

                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primary_color,
                      ),
                      child: const Text("Submit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -------> Show Image Picker  <---------

  final picker = ImagePicker();

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.0,
            //margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _imageFromGallery();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.image_outlined,
                          size: 65,
                          color: primary_color,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: primary_color,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _imageFromCamera();
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 65,
                          color: primary_color,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: primary_color,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --------- Image From Gallery ---------->
  _imageFromGallery() async {
    await picker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    )
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  // --------- Image From Camera ---------->
  _imageFromCamera() async {
    await picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    )
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  // <------ Crop Image ------->
  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();

      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

}
