import 'package:flutter/material.dart';
import 'package:inmotion/main.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/views/firstview/add_data.dart';

class ChoosePosition extends StatefulWidget {
  const ChoosePosition({Key? key}) : super(key: key);

  @override
  State<ChoosePosition> createState() => _ChoosePositionState();
}

class _ChoosePositionState extends State<ChoosePosition> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                    width: width * 0.5, child: Image.asset('assets/logo.png'))),
            Expanded(
                flex: 7,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/soccer_pool.png',
                      width: width * 0.82,
                    ),
                    SizedBox(
                      width: width * 0.6,
                      height: height * 0.56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(visible: false, child: TappingCircle()),
                          Visibility(visible: false, child: TappingCircle()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [TappingCircle(), TappingCircle()],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [TappingCircle(), TappingCircle()],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [TappingCircle(), TappingCircle()],
                          ),
                          //SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [TappingCircle(), TappingCircle()],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [TappingCircle(), TappingCircle()],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TappingCircle()),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: width * 0.84,
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AddData())),
                  child: Column(
                    children: [
                      Text(
                        'На какой позиции вы обычно играете?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Можно выбрать до трех',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TappingCircle extends StatefulWidget {
  const TappingCircle({Key? key}) : super(key: key);

  @override
  State<TappingCircle> createState() => _TappingCircleState();
}

class _TappingCircleState extends State<TappingCircle> {
  bool isTapped = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  tap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isTapped ? primaryColor : Colors.white,
            border: isTapped
                ? Border.all(width: 0, color: Colors.transparent)
                : Border.all(width: 2, color: grey),
            boxShadow: [
              !isTapped
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 4))
                  : BoxShadow(
                      color: Color.fromRGBO(196, 196, 255, 1.0),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 4))
            ]),
      ),
    );
  }
}
