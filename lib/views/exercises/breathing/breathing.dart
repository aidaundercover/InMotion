import 'dart:async';
import 'package:inmotion/utils/colors.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Breathing extends StatefulWidget {
  const Breathing({Key? key}) : super(key: key);

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> {
  bool isInhale = true;
  late int times;


  Duration duration = const Duration();
  Timer? timer;
  bool isRunning = false;
  late AudioPlayer player;
  int points = 0;

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer(int errors, double width) {
    setState(() {
      timer?.cancel();
      isRunning = false;

      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

  });
  }

  @override
  void initState() {
    // TODO: implement initState

    player = AudioPlayer();

    super.initState();
  }

  void addTimes() {
    setState(() {
      Timer.periodic(const Duration(milliseconds: 7500), (timer) {
        times++;
      });
    });
  }

 

  @override
  void dispose() {
    // TODO: implement dispose
    isInhale = true;
    player.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text('Дыхательная гимнастика', style: TextStyle(fontFamily: 'Inter', color: Colors.black),),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
              width: width*0.8,
              child: Text(
                'Дыхательные упражнения помогут вам контролировать и координировать свое дыхание во время игры. В идеале спортсмены, выполняют дыхательные упражнения не менее двух раз в день.',
                style: TextStyle(
                  fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                Lottie.asset("assets/breathe.json", animate: isRunning),
                Text(
                  isInhale ? "Вдох" : "Выдох",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            !isRunning
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isRunning = true;
                        // startVoiceOver();
                      });
                    },
                    child: Container(
                      width: width * 0.4,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: secondaryColor.withOpacity(0.2),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(4, 4),
                                color: secondaryColor.withOpacity(0.01)),
                            BoxShadow(
                                offset: Offset(-4, -4),
                                color: secondaryColor.withOpacity(0.01))
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Start",
                        style: TextStyle(
                            color: secondaryColor.withOpacity(0.8),
                            fontFamily: 'Inter',
                            fontSize: 16),
                      ),
                    ))
                : Container(
                    width: width * 0.88,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: secondaryColor.withOpacity(0.14),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4, 4),
                              color: secondaryColor.withOpacity(0.01)),
                          BoxShadow(
                              offset: Offset(-4, -4),
                              color: secondaryColor.withOpacity(0.01))
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.tips_and_updates,
                              color: secondaryColor.withOpacity(0.4),
                              size: width * 0.1),
                          SizedBox(
                              width: width * 0.75,
                              child: Text(
                                  "Выполняйте это упражнение не менее 10 раз утром и вечером. Дыхательные упражнения укрепят вашу диафрагму.",
                                  style: TextStyle(color: Colors.black38)))
                        ]),
                  )
          ],
        ),
      ),
    );
  }
}


  
