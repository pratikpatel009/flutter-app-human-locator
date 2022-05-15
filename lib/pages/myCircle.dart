import 'package:flutter/material.dart';
import 'package:location_tracking/model/add_member_request_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../config.dart';
import '../services/api_services.dart';

class MyCircle extends StatefulWidget {
  const MyCircle({Key? key}) : super(key: key);

  @override
  State<MyCircle> createState() => _MyCircleState();
}

class _MyCircleState extends State<MyCircle> {

  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? username;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283b71"),
        body: ProgressHUD(
          child: Form(key: globalFormKey, child: _loginUI(context)),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.location_on, size: 140,)
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text(
              "Add  Member",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
              context,
              "userName",
              "userName",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Name cannot be empty.";
                }
                return null;
              },
                  (onSavedVal) {
                    username = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              prefixIcon: const Icon(Icons.person)
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),

          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "AddMember",
                  () {
                print(username);
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  AddMemberRequestModel model = AddMemberRequestModel(

                    username: username!,

                  );

                  APIService.addMember(model).then((response) {
                    setState(() {
                      isAPIcallProcess = false;
                    });
                    if (response.message == "user is add") {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Add member",
                        "OK",
                            () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/location_tracker',
                                (route) => false,
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Something went wrong",
                        "OK",
                            () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  });
                }
              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}