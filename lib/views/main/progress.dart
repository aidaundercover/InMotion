import 'dart:async';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:inmotion/widgets/graph.dart';
import 'package:just_audio/just_audio.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> with TickerProviderStateMixin {
  late AnimationController controller;

  AudioPlayer player = AudioPlayer();

  bool isVisible = false;

  double value = 0;

  double opacityLevel = 0.0;

  void delay() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isVisible = true;
      });
      playSound();
    });
  }

  void playSound() async {
    player.setAsset('assets/sound/new_nft.mp3');
    await player.play();
  }

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget buildSkill(
      String title,
      double value,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter'),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              child: LinearProgressIndicator(
                backgroundColor: primaryColor.withOpacity(0.5),
                color: primaryColor,
                value: value,
                minHeight: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      );
    }

    Widget progressGraph() {
      return Container(
        width: width * 0.86,
        height: height * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  blurRadius: 7),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
                radius: 75,
                lineWidth: 16,
                percent: 0.01,
                progressColor: primaryColor,
                backgroundColor: primaryColor.withOpacity(0.5),
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("18%",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            fontSize: 30)),
                    Text("c????????????",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Inter',
                            fontSize: 20)),
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSkill("????????", 0.2),
                buildSkill("????????????????", 0.35),
                buildSkill("??????????????", 0.15),
                // buildSkill(
                //   "Motorics",
                //   0.1,
                // ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        floatingActionButton: StatefulBuilder(
          builder: (context, setState) => TextButton(
            onPressed: () {
              delay();
              Scaffold.of(context).showBottomSheet(
                  (context) => isVisible
                      ? Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 20),
                          ], color: Colors.white),
                          height: height * 0.68,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //SizedBox(height: width*0.5,),
                              AnimatedPhysicalModel(
                                  duration: Duration(seconds: 2),
                                  shadowColor: Colors.black,
                                  elevation: 15,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                  child: Image.asset('assets/nft.png',
                                      width: width * 0.9)),
                              SizedBox(
                                width: width * 0.84,
                                child: Text(
                                  '???????????????????? ?????????? NFT ?? ????????????????????\n?????????? ?????? ???????????????? ???? ????????????????????????',
                                  style: TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1.0),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                  onPressed: () async {
                                    String link =
                                        'https://opensea.io/assets/ethereum/0x495f947276749ce646f68ac8c248420045cb7b5e/35517721513515028483277189311591890744434658480736960959522825893954241691649';
                                    await Share.share(
                                        '?? ???????????? ???????????????????? ?? InMotion!\n\n$link');
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
                                              color: Color.fromRGBO(
                                                  51, 51, 204, 0.3),
                                              spreadRadius: 0)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '????????????????????',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() => isVisible = true);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '??????????????????...',
                                    style: TextStyle(
                                        fontFamily: 'Ruberoid',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  LinearProgressIndicator(
                                    color: Colors.black,
                                    minHeight: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  transitionAnimationController: controller);
            },
            child: Container(
              width: 70,
              height: 70,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primaryColor),
              alignment: Alignment.center,
              child: Text(
                'NFT',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 22),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              progressGraph(),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: width * 0.86,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: []),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 45,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '????????????????????\n???? ?????? ????????????',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '220',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '??????????',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              LineChartSample2()
            ],
          ),
        ));
  }
}
