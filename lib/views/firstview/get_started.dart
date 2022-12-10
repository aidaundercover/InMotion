import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/views/auth/signup.dart';
import 'package:inmotion/views/firstview/modes.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'by Koz Timesin team',
                  style: TextStyle(fontSize: 17, fontFamily: 'Inter'),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            SizedBox(
              width: width * 0.79,
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Тренируйся как профессионал',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              width: width * 0.85,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Начать',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 3)),
                      alignment: Alignment.center,
                      child: Text(
                        'У меня уже есть аккаунт',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
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
