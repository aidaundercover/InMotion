import 'package:flutter/material.dart';
import 'package:inmotion/views/exercises/breathing/breathing.dart';
import 'package:inmotion/views/exercises/dribling/dribling_ex.dart';

class Train extends StatefulWidget {
  const Train({Key? key}) : super(key: key);

  @override
  State<Train> createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget skillCard(String img, double h, String title, int s, Widget page) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          },
          child: Container(
            width: width * 0.41,
            height: h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 0),
                ],
                color: Colors.black,
                image: DecorationImage(image: AssetImage(img), opacity: 0.65, fit: BoxFit.cover
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$s тренировок',
                    style: TextStyle(
                        fontFamily: 'Inter', color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Center(
            child: SizedBox(
              width: width * 0.86,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Выберете навык:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Color.fromRGBO(51, 51, 51, 1.0),
                          fontSize: 25)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          skillCard('assets/dribbling.png', 290, 'Дриблинг', 7, Dribling()),
                          skillCard('assets/breathing.jpeg', 200, 'Дыхание', 3,
                              Breathing()),
                          skillCard('assets/jumping.jpeg', 240, 'Прыжки', 10,
                              Dribling()),
                        ],
                      ),
                      Column(
                        children: [
                          skillCard('assets/control.jpeg', 140, 'Контроль', 9,
                              Dribling()),
                          skillCard('assets/crossing.jpg', 220, 'Кроссинг', 2,
                              Dribling()),
                          skillCard('assets/strategy.jpeg', 220, 'Стратегия', 5,
                              Dribling()),
                          skillCard('assets/dribling.png', 170, 'Координация', 7,
                              Dribling()),   
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
