import 'package:flutter/material.dart';
import 'package:inmotion/main.dart';
import 'package:inmotion/utils/colors.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    TextEditingController gender = TextEditingController(text: '');
    TextEditingController age = TextEditingController(text: '');
    TextEditingController heightController = TextEditingController(text: '');
    TextEditingController weight = TextEditingController(text: '');

    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Scaffold(
        backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Center(
        child: SizedBox(
          width: width * 0.84,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                  width: width * 0.4, child: Image.asset('assets/logo.png')),
              SizedBox(
                height: height * 0.14,
              ),
              const Text('Введите ваши данные',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  'Мы собираем ваши данные\nдля персонализации упражнений',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(119, 119, 119, 1.0),
                      fontSize: 14)),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.4,
                            height: 65,
                            child: TextFormField(
                              controller: gender,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: 'Inter'),
                              decoration: InputDecoration(
                                hintText: "Пол",
                                hintStyle: const TextStyle(
                                    color: const Color.fromRGBO(
                                        164, 164, 164, 1.0)),
                                fillColor:
                                    const Color.fromRGBO(240, 240, 240, 1.0),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                        width: 2)),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            height: 65,
                            child: TextFormField(
                              controller: weight,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: 'Inter'),
                              decoration: InputDecoration(
                                hintText: "Вес",
                                hintStyle: const TextStyle(
                                    color: const Color.fromRGBO(
                                        164, 164, 164, 1.0)),
                                fillColor:
                                    const Color.fromRGBO(240, 240, 240, 1.0),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(240, 240, 240, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1.0),
                                        width: 2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.4,
                            height: 65,
                            child: TextFormField(
                              controller: age,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: 'Inter'),
                              decoration: InputDecoration(
                                hintText: "Возраст",
                                hintStyle: const TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1.0)),
                                fillColor:
                                    const Color.fromRGBO(240, 240, 240, 1.0),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1.0),
                                        width: 2)),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            height: 65,
                            child: TextFormField(
                              controller: heightController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: 'Inter'),
                              decoration: InputDecoration(
                                hintText: "Рост",
                                hintStyle: const TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1.0)),
                                fillColor:
                                    const Color.fromRGBO(240, 240, 240, 1.0),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: const BorderSide(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1.0),
                                        width: 2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Что вы хотите развивать?',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18.5)),
              const SizedBox(
                height: 14,
              ),   
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkillContainer(title: 'Выносливость',),
                        SkillContainer(title: 'Координация',),
                        SkillContainer(title: 'Сила удара',)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkillContainer(title: 'Скорость',),
                        SkillContainer(title: 'Реакция',),
                        SkillContainer(title: 'Прыжок',)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Main()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 75,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          const BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: const Color.fromRGBO(51, 51, 204, 0.3),
                              spreadRadius: 0)
                        ]),
                    child: const Text(
                      'Дальше',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ),
        ),
      )));
    });
  }
}

class SkillContainer extends StatefulWidget {
  final String title;
  const SkillContainer({Key? key, required this.title}) : super(key: key);

  @override
  State<SkillContainer> createState() => _SkillContainerState();
}

class _SkillContainerState extends State<SkillContainer> {
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
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: tap,
      child: Container(
        width: width * 0.4,
        height: 60,
        decoration: BoxDecoration(
            color: isTapped ? primaryColor.withOpacity(0.75) : Colors.white,
            border: isTapped
                ? Border.all(width: 0, color: Colors.transparent)
                : Border.all(width: 0.8, color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            ),
        alignment: Alignment.center,
        child: Text(widget.title, style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 17.5,
          color: isTapped ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500
        )),
      ),
    );
  }
}
