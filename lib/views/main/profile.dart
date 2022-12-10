import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/graph.png'),
                Image.asset('assets/profile_a.png', width: width*0.33,)
              ],
            ),
            SizedBox(height: 15,),
            Center(
              child: Column(
                children: [
                  Text(
                    'Шахназар Сайлаукан',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Нападающий',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: width*0.8,
              height: 140,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: Offset(0,4)
                ),
                
              ],
              borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1875', style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 45,
                            fontWeight: FontWeight.w700),),
                      Text(
                        'очков',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '13',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 45,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'тернировки',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: width*0.8,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: Offset(0,4)
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text('Команда', style: TextStyle(fontFamily: 'Inter', fontSize: 18),),
                          Text(
                          'Подписчики',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        ),
                        Text(
                          'Подписки',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        )
                          
                        ]
                        
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ФК Тигр',
                              style:
                                  TextStyle(fontFamily: 'Inter', fontSize: 18),
                            ),
                            Text(
                              '32',
                              style:
                                  TextStyle(fontFamily: 'Inter', fontSize: 18),
                            ),
                            Text(
                              '12',
                              style:
                                  TextStyle(fontFamily: 'Inter', fontSize: 18),
                            )
                          ]),
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
