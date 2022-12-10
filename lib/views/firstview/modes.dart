import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/views/firstview/choose_position.dart';

class PaymentModes extends StatefulWidget {
  const PaymentModes({Key? key}) : super(key: key);

  @override
  State<PaymentModes> createState() => _PaymentModesState();
}

class _PaymentModesState extends State<PaymentModes> {
  List<String> advantages = [
    'Автоматический доступ\nк постам',
    'Расширенная\nпрограмма тренировок',
    'Тренировка\nкогнитивных навыков',
    'Неограниченное время\nпросмотра видео'
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: width * 0.5, child: Image.asset('assets/logo.png')),
          Column(
            children: [
              Text(
                'Тариф Pro',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                  height: height * 0.4,
                  width: width * 0.72,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: advantages.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    advantages[index],
                                    style: TextStyle(
                                        fontFamily: 'Inter', fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )))
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosePosition()));
                },
                child: Container(
                  height: 90,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(27),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: primaryColor.withOpacity(0.3))
                      ]),
                  alignment: Alignment.center,
                  child: Text(
                    'Подписаться 990тг',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(width: 3)),
                  alignment: Alignment.center,
                  child: Text(
                    'Продолжить бесплатно',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
