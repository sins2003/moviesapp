import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../screens/FavoriateList.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class drawerfunc extends StatefulWidget {
  drawerfunc({
    super.key,
  });

  @override
  State<drawerfunc> createState() => _drawerfuncState();
}

class _drawerfuncState extends State<drawerfunc> {
  File? _image;

  // Future<void> SelectImage() async {
  //   // final pickedfile =
  //   //     await ImagePicker().(source: ImageSource.gallery);
  //   // if (pickedfile != null) {
  //   //   CroppedFile? cropped = await ImageCropper().cropImage(
  //   //     sourcePath: pickedfile.path,
  //   //     aspectRatioPresets: [
  //   //       CropAspectRatioPreset.square,
  //   //       CropAspectRatioPreset.ratio3x2,
  //   //       CropAspectRatioPreset.original,
  //   //       CropAspectRatioPreset.ratio4x3,
  //   //       CropAspectRatioPreset.ratio16x9
  //   //     ],
  //   //   );
  //   //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   //   sp.setString('imagepath', cropped!.path);
  //   //   _image = cropped as File?;
  //   // } else {
  //   //   print('No image selected.');
  //   // }
  // }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        _image = File(sp.getString('imagepath')!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Color.fromRGBO(18, 18, 18, 0.9),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            listtilefunc('Home', Icons.home, ontap: () {
              //close drawer
              Navigator.pop(context);
            }),
            listtilefunc('Favorite', Icons.favorite, ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriateMovies()));
            }),
            listtilefunc('Quit', Icons.exit_to_app_rounded, ontap: () {
              SystemNavigator.pop();
            }),
          ],
        ),
      ),
    );
  }
}

Widget listtilefunc(String title, IconData icon, {Function? ontap}) {
  return GestureDetector(
    onTap: ontap as void Function()?,
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
