import 'package:flutter/material.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/styles/colors.dart';
import 'package:task/widget/elevatedbutton_widget.dart';

class UserData extends StatefulWidget {
  const UserData({
    Key? key,
  }) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff005DA3),
        title: const Text("User Data"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Name"),
              const Text("Email"),
              const Text("Phone"),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
              ),
              ElevatedButtonWidget(
                primary: AppColor.red,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                elevatedtext: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
