import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/model.dart';

class HomeController extends GetxController {
  RxList<Model> model = <Model>[].obs;
  RxList<Model> color = <Model>[].obs;
  RxList<Model> imagesData = <Model>[].obs;
  RxList<Model> PercentNummber = <Model>[].obs;
  //
  // Empety list for percent Indicator
  RxList<Model> empetyListPercent = <Model>[].obs;
  // TextEditing Controller

  TextEditingController Titlecontroller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController TimeController = TextEditingController();
//
  RxInt indexx = 0.obs;
  RxInt containerBorder = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    builder();
    Img();
    Circle();
  }

  void builder() {
    var builderResult = [
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
      //
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
      Model(
        color: Color(0xffb9e2f9),
      ),
      Model(
        color: Color(0xfff3edb0),
      ),

      Model(
        color: Color.fromARGB(255, 244, 202, 255),
      ),
      Model(
        color: Color.fromARGB(255, 202, 255, 190),
      ),
    ];
    color.value = builderResult;
  }

  void Img() {
    var ImgResult = [
      Model(img: 'lib/icons/cycling.png'),
      Model(img: 'lib/icons/read.png'),
      Model(img: 'lib/icons/travelling.png'),
      Model(img: 'lib/icons/glass-of-water.png'),
      Model(img: 'lib/icons/rfid.png'),
      Model(img: 'lib/icons/dollars.png'),
      Model(img: 'lib/icons/dumbell.png'),
      Model(img: 'lib/icons/hair-cut.png'),
      Model(img: 'lib/icons/telephon.png'),
      Model(img: 'lib/icons/school.png'),
    ];
    imagesData.value = ImgResult;
  }

  void Circle() {
    var PercentNum = [
      Model(
        percentNumbers: 30,
        percentColors: Color.fromARGB(255, 254, 129, 120),
      ),
      Model(
          percentNumbers: 50,
          percentColors: Color.fromARGB(255, 226, 110, 255)),
      Model(
          percentNumbers: 70, percentColors: Color.fromARGB(255, 43, 160, 255)),
      Model(
          percentNumbers: 100, percentColors: Color.fromARGB(255, 255, 191, 0)),
    ];
    PercentNummber.value = PercentNum;
  }
}