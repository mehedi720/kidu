import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidu/components/inputs.dart';
import 'package:kidu/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var nameCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ImagePicker imgPick = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("Settings"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "Contact");
                  },
                  child: ListTile(
                    title: Text("Contact"),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "About");
                  },
                  child: ListTile(
                    title: Text("About"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Profile",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? img = await imgPick.pickImage(
                            source: ImageSource.gallery);
                        if (img != null) {
                          SharedPreferences storage =
                              await SharedPreferences.getInstance();
                          storage.setString("img", img.path);
                          Fluttertoast.showToast(
                              msg: "Profile picture has been changed",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: GREEN_2,
                              textColor: GREEN_PR,
                              fontSize: 16.0);

                          Navigator.pushNamed(context, "DashBoard");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 40,
                        child: Icon(
                          Icons.add,
                          color: Colors.grey.shade700,
                        ),
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
              ),
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  TextInput(
                    LabelText: "Change UserName",
                    BackgroundColor: Colors.transparent,
                    ContentColor: Colors.grey,
                    contrl: nameCntrl,
                  ),
                  GestureDetector(
                    onTap: () async {
                      String txt = nameCntrl.text;
                      if (txt != null) {
                        SharedPreferences storage =
                            await SharedPreferences.getInstance();
                        storage.setString("kidName", txt);
                        Navigator.pushNamed(context, "DashBoard");

                        Fluttertoast.showToast(
                            msg: "User Name has been changed",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: GREEN_2,
                            textColor: GREEN_PR,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                        height: 50,
                        width: 40,
                        color: Colors.grey.shade300,
                        child: Icon(Icons.add)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
