import 'package:flutter/material.dart';
import 'package:weincoders_app/config/app_routes.dart';
import 'package:weincoders_app/design/colors.dart';
import 'package:weincoders_app/design/copy.dart';
import 'package:weincoders_app/design/radius.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  late String userName;
  var userInputController = TextEditingController(text: "esteban");
  var pswController  =TextEditingController(text: "12345678");
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pwdContainerDecoration;

  final defaultContainerInputDecoration = const BoxDecoration(
    color: WeinFluColors.brandSecondaryColor,
    borderRadius: BorderRadius.all(WeinFluRadius.small),
  );
  final activeContainerInputDecoration = BoxDecoration(
    color: WeinFluColors.brandSecondaryColor,
    border: Border.all(color: WeinFluColors.brandPrimaryColor, width: 2),
    borderRadius: BorderRadius.all(WeinFluRadius.small),
  );

  final defaultInputBorder = InputBorder.none;

  final defaultInputLabelTheme = const TextStyle(
    fontSize: 13,
    color: WeinFluColors.brandLigthDarkColor,
  );

  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pwdContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              WeinfluCopys.hello,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.fromLTRB(16, 21, 16, 20),
              child: Text(
                WeinfluCopys.lorem,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formLoginKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 70,
                    padding: EdgeInsets.only(left: 24),
                    decoration: userContainerDecoration,
                    child: TextFormField(
                      controller: userInputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return WeinFluErrors.userError;
                        }
                        if (value.length < 7) {
                          return "The user name must be less than 7 characters";
                        }

                        return null;
                      },
                      onTapOutside:
                          (event) => {
                            setState(() {
                              userContainerDecoration =
                                  defaultContainerInputDecoration;
                            }),
                          },
                      onTap: () {
                        setState(() {
                          userContainerDecoration =
                              activeContainerInputDecoration;
                          pwdContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onSaved: (newValue) => userName = newValue!,
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        label: Text(
                          WeinfluCopys.userInputLabel,
                          style: defaultInputLabelTheme,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.only(left: 24),
                    decoration: pwdContainerDecoration,
                    child: TextFormField(
                      controller: pswController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return WeinFluErrors.userPsw;
                        }
                        if (value.length <= 7) {
                          return "The password must be less than 7 characters";
                        }

                        return null;
                      },
                      onTap: () {
                        setState(() {
                          pwdContainerDecoration =
                              activeContainerInputDecoration;
                          userContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onTapOutside:
                          (event) => {
                            setState(() {
                              pwdContainerDecoration =
                                  defaultContainerInputDecoration;
                            }),
                          },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        label: Text(
                          WeinfluCopys.userPswInputLabel,
                          style: defaultInputLabelTheme,
                        ),
                        hintText: "Enter your password",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: checkBoxState,
                    onChanged: (value) {
                      setState(() {
                        checkBoxState = !checkBoxState;
                      });
                    },
                    checkColor: WeinFluColors.brandLightColor,
                    activeColor: WeinFluColors.brandPrimaryColor,
                  ),
                  Expanded(child: Text(WeinfluCopys.rememberMe)),
                  Text(WeinfluCopys.recoveryPassword),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, bottom: 48, left: 16, right: 16),
              width: 394,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  if (_formLoginKey.currentState!.validate()) {
                    userName = TextEditingController().text;
                    Navigator.of(context).pushReplacementNamed(
                      AppRouters.home,
                      arguments: userName,
                    );
                  }
                },
                child: Text(
                  WeinfluCopys.login,
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: WeinFluColors.brandPrimaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(WeinFluRadius.small),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: WeinFluColors.brandLightColorBorder,
                    thickness: 1.0,
                  ),
                ),
                Text(WeinfluCopys.orContinue),
                Expanded(
                  child: Divider(
                    color: WeinFluColors.brandLightColorBorder,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 42),
            Row(
              children: [
                Container(
                  width: 189,
                  height: 69,
                  decoration: BoxDecoration(
                    color: WeinFluColors.brandSecondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/google.png"),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 5),
                      Text(WeinfluCopys.google),
                    ],
                  ),
                ),
                Container(
                  width: 189,
                  height: 69,
                  decoration: BoxDecoration(
                    color: WeinFluColors.brandSecondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/facebook.png"),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 5),
                      Text(WeinfluCopys.facebook),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(WeinfluCopys.notAMember),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    WeinfluCopys.registerNow,
                    style: TextStyle(
                      color: WeinFluColors.brandPrimaryColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
