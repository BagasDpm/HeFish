import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hefish/constant/components/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/styles/imagePallet.dart';
import '../model/authenticate.dart';
import '../utility/config.dart';
import '../utility/util.dart';
import 'package:http/http.dart' as http;

class AddFishPage extends StatefulWidget {
  const AddFishPage({
    super.key,
  });

  @override
  State<AddFishPage> createState() => _AddFishPageState();
}

class _AddFishPageState extends State<AddFishPage> {
  bool _obscureText = true;
  final ecoType = ['Salt Water', "Mix Water", "Fresh Water"];
  String ecoTypeDefault = 'Salt Water';

  TextEditingController nameFishController = new TextEditingController();
  TextEditingController priceFishController = new TextEditingController();
  TextEditingController descFishController = new TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Image.asset(appbar),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () => logOut(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Color.fromARGB(255, 243, 243, 243),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          getImage();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: image != null
                            ? Container(
                                constraints: const BoxConstraints.expand(
                                  width: 160,
                                  height: 240,
                                ),
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.edit,
                                          size: 18,
                                        ),
                                        Text(
                                          " Choose Image",
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            : Container(
                                color: Color.fromARGB(255, 218, 212, 212),
                                width: _size.width * 0.7,
                                height: 200,
                                padding: EdgeInsets.only(top: 60, bottom: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text('Choose Image'),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: CustomTextFormField(
                      fieldController: nameFishController,
                      hintText: "Fish Name",
                      keyboardType: TextInputType.name,
                      top: 40,
                      suffixIcon: Icons.abc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          underline: Container(),
                          borderRadius: BorderRadius.circular(10),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: ecoTypeDefault,
                          style: const TextStyle(fontSize: 16),
                          iconEnabledColor: Colors.grey,
                          elevation: 0,
                          hint: Text(
                            "Fish Type",
                            style: TextStyle(
                              color: Color.fromARGB(255, 179, 179, 179),
                            ),
                          ),
                          items: ecoType.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              alignment: AlignmentDirectional.centerStart,
                              enabled: true,
                              child: Text(
                                items,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              ecoTypeDefault = value!;
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: CustomTextFormField(
                      fieldController: priceFishController,
                      hintText: "Fish Price",
                      keyboardType: TextInputType.number,
                      top: 15,
                      suffixIcon: Icons.abc,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: TextField(
                        controller: descFishController,
                        style: TextStyle(fontSize: 16),
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        decoration: InputDecoration(
                          hintText: "Fish Description",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 179, 179, 179),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                                width: 0,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // ========== Button Post Data ==========
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: _size.width * 0.9,
                      child: RawMaterialButton(
                        fillColor: Colors.lightBlue,
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function
  Future getImage() async {
    XFile? picked;
    try {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                alignment: Alignment.center,
                insetPadding: EdgeInsets.zero,
                content: Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Colors.white,
                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              children: [
                                const Text(
                                  "Choose a image",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          picked = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          if (picked == null) {
                                            return;
                                          } else {
                                            setState(() =>
                                                image = File(picked!.path));
                                          }
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        alignment: Alignment.center,
                                        icon: const Icon(
                                          FontAwesomeIcons.upload,
                                          color: Colors.black,
                                          size: 40,
                                        )),
                                    Container(
                                      width: 50,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          picked = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          if (picked == null) {
                                            return;
                                          } else {
                                            setState(() =>
                                                image = File(picked!.path));
                                          }
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        alignment: Alignment.center,
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.black,
                                          size: 45,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )));
    } on PlatformException {
      const pwRecMsg = SnackBar(
        content: Text("Access Denied!"),
        backgroundColor: Color.fromARGB(255, 250, 69, 56),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(pwRecMsg);
    }
  }
}
