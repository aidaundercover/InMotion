import 'package:flutter/material.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:countup/countup.dart';
import 'package:inmotion/views/main/social/new_post.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    bool isLiked = false;

    void like() {
      setState(() {
        isLiked = !isLiked;
      });
    }

    Widget post(
        String img, String name, String time, bool isText, String content) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: width * 0.86,
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: Colors.white),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(img),
                      maxRadius: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color.fromRGBO(164, 164, 164, 1.0)),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                isText
                    ? Text(
                        content,
                        style: TextStyle(fontFamily: 'Inter', fontSize: 15),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          content,
                          width: width * 0.8,
                        )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.shade100),
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.redAccent,
                              size: 20,
                            )),
                        SizedBox(
                          width: 7,
                        ),
                        Text('2.5K')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '14 комментариев',
                          style: TextStyle(
                              color: Color.fromRGBO(164, 164, 164, 1.0)),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        like();
                      },
                      icon: !isLiked
                          ? Icon(Icons.favorite_border_outlined)
                          : Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            ),
                      iconSize: 30,
                    )
                  ],
                )
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: AppBar(
        leadingWidth: 10,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: SizedBox(
            width: width * 0.35, child: Image.asset('assets/logo.png')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePost()));
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: width * 0.88,
                height: 140,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1.0),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Column(
                        children: [
                          Countup(
                            begin: 0,
                            end: 15870,
                            duration: Duration(seconds: 2),
                            separator: ',',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 40),
                          ),
                          Text(
                            'очков',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 40),
                          ),
                          Text(
                            'тренировок\nсегодня',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              post(
                  'assets/ava1.png',
                  'Бактиер Зейнутдинов',
                  '2 часа назад',
                  true,
                  'Ни один человек не рождается с врожденными навыками игры в футбол. Для того чтобы развить свои сильные и укрепить слабые стороны, требуются годы тренировок.\n\nНапример, игрок может быть очень быстрым, но не слишком сильным, или он может хорошо подавать угловые, но плохо играть в пас. Тем не менее с практикой необходимые навыки постепенно развиваются. Если вы будете ежедневно выполнять ряд полезных упражнений, то, в конце концов, станете очень неплохим игроком в футбол.'),
              post('assets/ava2.png', 'Бауыржан Исламхан', '4 часа назад',
                  false, 'assets/post2.png')
            ],
          ),
        ),
      ),
    );
  }
}
