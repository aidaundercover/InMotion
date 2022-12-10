import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chewie/chewie.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/widgets/roundbutton.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ExerciseOne extends StatefulWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne>
    with TickerProviderStateMixin {
  final videoPlayerController =
      VideoPlayerController.asset('assets/videos/exercise.MP4');
  late ChewieController chewieController;
  late AnimationController controller;

  double progress = 1.0;
  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void notify() {
    if (countText == '00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        aspectRatio: 16 / 9,
        fullScreenByDefault: false,
        allowFullScreen: false);

    controller =
        AnimationController(vsync: this, duration: Duration(minutes: 10));

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });

    if (controller.isAnimating) {
      controller.stop();
      setState(() {
        isPlaying = false;
      });
    } else {
      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1.0),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          centerTitle: true,
          title: Text(
            'Дриблинг вокруг препятствия',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Inter', fontSize: 17),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(children: [
              //SizedBox(height: 40,),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: Chewie(
                  controller: chewieController,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      value: progress,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isDismissed) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  controller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                        countText,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              TextButton(
                  onPressed: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: width * 0.8,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Color.fromRGBO(51, 51, 204, 0.3),
                              spreadRadius: 0)
                        ]),
                    child: Text(
                      'Завершить',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  )),
            ]),
          ),
        ));
  }
}
