import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/widgets/demo.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoFeed extends StatefulWidget {
  const VideoFeed({Key? key}) : super(key: key);

  @override
  State<VideoFeed> createState() => _VideoFeedState();
}

class _VideoFeedState extends State<VideoFeed> {
  final vpcOne = VideoPlayerController.asset('assets/videos/one.mp4');
  final vpcTwo = VideoPlayerController.asset('assets/videos/two.mp4');
  final vpcThree = VideoPlayerController.asset('assets/videos/three.mp4');

  late ChewieController chewieOne;
  late ChewieController chewieTwo;
  late ChewieController chewieThree;

  void initiliaze() {
    vpcOne.initialize();
    vpcTwo.initialize();
    vpcThree.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vpcOne.dispose();
    vpcTwo.dispose();
    vpcThree.dispose();
    chewieOne.dispose();
    chewieTwo.dispose();
    chewieThree.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initiliaze();

    chewieOne = ChewieController(
        videoPlayerController: vpcOne,
        autoPlay: true,
        looping: false,
        autoInitialize: true,
        fullScreenByDefault: true,
        aspectRatio: 9 / 16);

    chewieTwo = ChewieController(
        videoPlayerController: vpcTwo,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        fullScreenByDefault: true);

    chewieThree = ChewieController(
      videoPlayerController: vpcThree,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
      fullScreenByDefault: true,
    );
  }

  List videos = [
    {
      'isLiked': false,
      'username': 'futuremessy21',
      'category': '#дриблинг #урокипофутболу',
      'comments': 21,
      'share': 13
    },
    {
      'isLiked': false,
      'username': 'football_is_life',
      'category': '#голы #непроигрывай',
      'comments': 187,
      'share': 7
    },
    {
      'isLiked': false,
      'username': 'gfoompsy',
      'category': '#голы #будьначеку',
      'comments': 45,
      'share': 1
    }
  ];

  @override
  Widget build(BuildContext context) {
    void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
        {int? currentIndex}) {}

    final Controller controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success);
      });

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List controllers = [chewieOne, chewieTwo, chewieThree];

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                    
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(
                      //   width: width*0.8,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Icon(Icons.close)
                      //     ],
                      //   ),
                      // ),
                      Text('Осталось:', style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      Text('19 мин 14 сек', style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
                            color: primaryColor
                          ),),
                      Text('В бесплатной версии, время на ленту ограничено. Обретайте\nподписку или зарабатываете очки тренируясь в приложении', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Inter', fontSize: 14, ),)
                    ],
                  ),
                ),
              );
            });
      },
      child: Icon(Icons.timer, color: Colors.white, size: 40,),
      backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(alignment: Alignment.topCenter, children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Для вас',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        TikTokStyleFullPageScroller(
          contentSize: videos.length,
          swipePositionThreshold: 0.2,
          swipeVelocityThreshold: 2000,
          animationDuration: const Duration(milliseconds: 400),
          controller: controller,
          builder: (BuildContext context, int index) {
            return Container(
                width: width,
                height: height,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: Chewie(
                      controller: controllers[index],
                    ),
                  ),
                  Container(
                    height: height * 0.5,
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 150),
                            Text(
                              '@' + videos[index]['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontFamily: 'Inter'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              videos[index]['category'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Inter'),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () => setState(() {
                                          videos[index]['isLiked'] =
                                              !videos[index]['isLiked'];
                                        }),
                                    child: Icon(
                                      Icons.favorite,
                                      color: videos[index]['isLiked']
                                          ? Colors.red
                                          : Colors.white,
                                      size: 38,
                                    )),
                                Text(
                                  videos[index]['comments'].toString() + 'K',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Inter'),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                    child: Icon(
                                  Icons.comment,
                                  color: Colors.white,
                                  size: 38,
                                )),
                                Text(
                                  videos[index]['comments'].toString() + 'K',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Inter'),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                    child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 38,
                                )),
                                Text(
                                  videos[index]['share'].toString() + 'M',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Inter'),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]));
          },
        ),
      ]),
      //body: ChewieDemo(),
    );
  }
}
