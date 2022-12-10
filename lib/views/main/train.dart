import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/views/exercise.dart';

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

    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ExerciseOne()));
              },
              child: Container(
                width: width * 0.8,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(23),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          color: Color.fromRGBO(51, 51, 204, 0.3),
                          spreadRadius: 0)
                    ]),
                child: Text(
                  'Начать упражнение',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 20, color: Colors.white),
                ),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: width * 0.84,
                child: Image.asset('assets/dribling.png'),
              ),
              SizedBox(
                width: width * 0.82,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Дриблинг вокруг препятствия',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          child: Text(
                            '10 минут',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 13),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          child: Text(
                            '2 повторения',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 13),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Найдите подходящую достаточно большую площадку, на которой вы могли бы совершать пробежки с мячом. Мягко касайтесь мяча внешней стороной ступни, направляя его вперед; старайтесь держать мяч в полуметре-метре перед собой и не отпускать его дальше.\n\nНа открытом, свободном от соперников пространстве контроль над мячом менее важен, и можно перейти с галопа на более быстрый бег.',
                      style: TextStyle(
                        color: Color.fromRGBO(119, 119, 119, 1.0),
                        fontFamily: 'Inter',
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
