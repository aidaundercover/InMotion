import 'package:flutter/material.dart';
import 'package:inmotion/services/authentication.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/views/auth/signup.dart';
import 'package:inmotion/views/firstview/modes.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController(text: '');
    TextEditingController password = TextEditingController(text: '');

    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                    width: width * 0.5, child: Image.asset('assets/logo.png')),
                SizedBox(
                  height: height * 0.14,
                ),
                Text('Вход',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 33)),
                SizedBox(
                  height: 15,
                ),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: SizedBox(
                            width: width * 0.8,
                            height: 65,
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: 'Inter'),
                              decoration: InputDecoration(
                                hintText: "Электронная почта",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1.0)),
                                fillColor: Color.fromRGBO(240, 240, 240, 1.0),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                        width: 2)),
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(
                          width: width * 0.8,
                          height: 65,
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'Inter'),
                            decoration: InputDecoration(
                              hintText: "Пароль",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(164, 164, 164, 1.0)),
                              fillColor: Color.fromRGBO(240, 240, 240, 1.0),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(240, 240, 240, 1.0),
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(240, 240, 240, 1.0),
                                      width: 2)),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 35,
                ),
                TextButton(
                    onPressed: () {
                      // if (name.text.isNotEmpty &&
                      //     email.text.isNotEmpty &&
                      //     password.text.isNotEmpty) {
                      //   Auth.signUp(
                      //       name.text, email.text, password.text, context);
                      // } else
                      //   showBottomSheet(
                      //       context: context,
                      //       builder: (context) => Text(''));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentModes()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 75,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 20,
                                color: Color.fromRGBO(51, 51, 204, 0.3),
                                spreadRadius: 0)
                          ]),
                      child: Text(
                        'Войти',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 75,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 3, color: Color.fromRGBO(51, 51, 51, 1.0)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(51, 51, 51, 1.0),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
