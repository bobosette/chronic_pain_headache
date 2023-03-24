import 'dart:convert';

import 'package:chronic_pain_headache/utils/const.dart';
import 'package:chronic_pain_headache/views/pages/form/form_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  static FormController get to => Get.find();

  late PainFormBloc formBloc;

  void getFormBloc(PainFormBloc f) {
    formBloc = f;
  }

  String physicalNrs = '0';
  String mindNrs = '0';

  Map<String, String> section3SliderValue = {};

  Map<String, String> section5SliderValue = {};

  Map<String, String> section7SliderValue = {};

  //set slider
  void setPhysicalNrs(String s) {
    physicalNrs = s;
    update();
  }

  void setMindNrs(String s) {
    mindNrs = s;
    update();
  }

  void setSection3SliderValue(int i, String s) {
    section3SliderValue['${i + 1}'] = s;
    update();
  }

  void setSection5SliderValue(int i, String s) {
    section5SliderValue['${i + 1}'] = s;
    update();
  }

  void setSection7SliderValue(int i, String s) {
    if(i == 17) {
      section7SliderValue['32'] = s;
    } else if(i == 29) {
      section7SliderValue['$i'] = s;
    } else {
      section7SliderValue['${i + 1}'] = s;
    }
    
    update();
  }

  //reset
  void resetSliders() {
    physicalNrs = '';
    mindNrs = '';
  }

  //info set smoke visibility
  bool isSmoke = false;

  void setSmoke(bool b) {
    isSmoke = b;
    update();
  }

  //cefalea set aura visibility
  bool isAura = false;

  void setAura(bool b) {
    isAura = b;
    update();
  }

  //info set treatment visibility
  bool isTreatment = false;

  void setTreatment(bool b) {
    isTreatment = b;
    update();
  }

  //body
  List<String> selectedBodySites = [];

  void selectBodySites(String b, bool isRemoving) {
    if (isRemoving) {
      selectedBodySites.removeWhere((element) => element == b);
    } else {
      selectedBodySites.add(b);
    }

    if (selectedBodySites.isNotEmpty) {
      if (selectedBodySites.length < 2) {
        formBloc.s5q2.updateValue(selectedBodySites.first);
      } else {
        formBloc.s5q2.updateValue(selectedBodySites.join(','));
      }
    } else {
      formBloc.s5q2.updateValue('');
    }

    update();
  }

  //scroll
  final scrollController1 = ScrollController();
  final scrollController2 = ScrollController();
  final scrollController3 = ScrollController();
  final scrollController4 = ScrollController();
  final scrollController5 = ScrollController();
  final scrollController6 = ScrollController();

  Future<void> resetScroll() async {
    if (kDebugMode) {
      print('position 4: ${scrollController4.offset}');
    }
    await Future.delayed(const Duration(milliseconds: 500));
    scrollController1.jumpTo(
      0.0,
    );
    scrollController2.jumpTo(
      0.0,
    );
    scrollController3.jumpTo(
      0.0,
    );
    scrollController4.jumpTo(
      0.0,
    );
    scrollController5.jumpTo(
      0.0,
    );
    scrollController6.jumpTo(
      0.0,
    );
    update();
  }

  @override
  void onInit() {
    selectedBodySites = [];

    for (int i = 1; i < 11; i++) {
      section3SliderValue['$i'] = '0';
    }
    for (int i = 1; i < 16; i++) {
      section5SliderValue['$i'] = '0';
    }
    for (int i = 12; i < 24; i++) {
     
        section7SliderValue['$i'] = '0';
      
      
    }
    section7SliderValue['29'] = '0';
    section7SliderValue['32'] = '0';
    section7SliderValue['23'] = '0'; //give value to altro
    super.onInit();
  }

  Future<void> submitForm(dynamic state) async {
    if (state.stepCompleted == state.lastStep) {
      /*
      //pcs total
      var total = int.parse(formBloc.s4q1.value!.value!) +
          int.parse(formBloc.s4q2.value!.value!) +
          int.parse(formBloc.s4q3.value!.value!) +
          int.parse(formBloc.s4q4.value!.value!) +
          int.parse(formBloc.s4q5.value!.value!) +
          int.parse(formBloc.s4q6.value!.value!) +
          int.parse(formBloc.s4q7.value!.value!) +
          int.parse(formBloc.s4q8.value!.value!) +
          int.parse(formBloc.s4q9.value!.value!) +
          int.parse(formBloc.s4q10.value!.value!) +
          int.parse(formBloc.s4q11.value!.value!) +
          int.parse(formBloc.s4q12.value!.value!) +
          int.parse(formBloc.s4q13.value!.value!);

      //pcs help
      var help = int.parse(formBloc.s4q2.value!.value!) +
          int.parse(formBloc.s4q3.value!.value!) +
          int.parse(formBloc.s4q4.value!.value!) +
          int.parse(formBloc.s4q5.value!.value!) +
          int.parse(formBloc.s4q6.value!.value!) +
          int.parse(formBloc.s4q12.value!.value!);

      //pcs rum
      var rum = int.parse(formBloc.s4q1.value!.value!) +
          int.parse(formBloc.s4q8.value!.value!) +
          int.parse(formBloc.s4q9.value!.value!) +
          int.parse(formBloc.s4q10.value!.value!) +
          int.parse(formBloc.s4q11.value!.value!);

      //pcs mag
      var mag = int.parse(formBloc.s4q7.value!.value!) +
          int.parse(formBloc.s4q13.value!.value!);

      if (kDebugMode) {
        print(formBloc.s1q1.value);
      }

      Map<String, String> body = {
        //info
        "entry.865731743": formBloc.s1q1.value ? 'Si' : 'No', //accomplish
        "entry.1889561135": formBloc.s1q2.value ? 'Si' : 'No', //18+
        "entry.1270062636": formBloc.s1q3.value, //initials
        "entry.1693057823": formBloc.s1q4.value, //age
        "entry.1779101486": formBloc.s1q5.value!, //gender
        "entry.1134340525": formBloc.s1q6.value!, //region
        // "entry.798385205_sentinel": "",
        "entry.2011975094": formBloc.s1q7
            .value!, //patology                            "entry.2056463475": formBloc.s1q8.value, //farmaci
        "entry.1240737765": formBloc.s1q8.value, //other pat
        //"entry.514580319_sentinel": "",
        "entry.633317762": formBloc.s1q9.value, //therapy
        //"entry.1210252556_sentinel": "",

        "entry.1479886165": formBloc.s1q10.value!, //school
        "entry.1834813309": formBloc.s1q11.value!, //civil
        "entry.412021790": formBloc.s1q12.value!, //sport
        "entry.75715165": formBloc.s1q13.value!, //smoke
        "entry.83066355": formBloc.s1q14.value, //how many cigars
        "entry.1338879868": formBloc.s1q15.value, //how many years
        "entry.1618731396": formBloc.s1q16.value, //how many years you quit
        

        //nrs
        "entry.966959109": formBloc.s2q1.value, //physical
        //"entry.471059802_sentinel": "",
        "entry.517029057": formBloc.s2q2.value, //humor
        //"entry.2025023738_sentinel": "",

        //pseq
        "entry.467631096": formBloc.s3q1.value, //1
        //"entry.855809027_sentinel": "",
        "entry.2012874206": formBloc.s3q2.value, //2
        //"entry.66021668_sentinel": "",
        "entry.1060267796": formBloc.s3q3.value, //3
        //"entry.2021119258_sentinel": "",
        "entry.2115974679": formBloc.s3q4.value, //4
        //"entry.1082721450_sentinel": "",
        "entry.1125018806": formBloc.s3q5.value, //5
        //"entry.284614016_sentinel": "",
        "entry.330630256": formBloc.s3q6.value, //6
        //"entry.1375502854_sentinel": "",
        "entry.1089321465": formBloc.s3q7.value, //7
        //"entry.208622452_sentinel": "",
        "entry.1759105873": formBloc.s3q8.value, //8
        //"entry.1909690039_sentinel": "",
        "entry.1351679641": formBloc.s3q9.value, //9
        //"entry.89223877_sentinel": "",
        "entry.2088483937": formBloc.s3q10.value, //10
        //"entry.993265498_sentinel": "",

        //pcs
        "entry.332048560": formBloc.s4q1.value!.label!, //1
        //"entry.1790925381_sentinel": "",
        "entry.494802760": formBloc.s4q2.value!.label!, //2
        //"entry.124901644_sentinel": "",
        "entry.173490086": formBloc.s4q3.value!.label!, //3
        //"entry.1760478221_sentinel": "",
        "entry.1612998679": formBloc.s4q4.value!.label!, //4
        //"entry.185256138_sentinel": "",
        "entry.1220886713": formBloc.s4q5.value!.label!, //5
        //"entry.370849815_sentinel": "",
        "entry.449597003": formBloc.s4q6.value!.label!, //6
        //"entry.1554689652_sentinel": "",
        "entry.406177132": formBloc.s4q7.value!
            .label!, //7                            "entry.670154805_sentinel": "",
        "entry.1518313361": formBloc.s4q8.value!.label!, //8
        //"entry.601281841_sentinel": "",
        "entry.1237644340": formBloc.s4q9.value!.label!, //9
        //"entry.1533271608_sentinel": "",
        "entry.1161800404": formBloc.s4q10.value!.label!, //10
        //"entry.1941252130_sentinel": "",
        "entry.1176162165": formBloc.s4q11.value!.label!, //11
        //"entry.1614877763_sentinel": "",
        "entry.1128365962": formBloc.s4q12.value!.label!, //12
        //"entry.1770701982_sentinel": "",
        "entry.2079819325": formBloc.s4q13.value!.label!, //13
        //"entry.1467341891_sentinel": "",
        "entry.1853025819": total.toString(), //total
        //"entry.1339084867_sentinel": "",
        "entry.1886646068": help.toString(), //help
        //"entry.837606169_sentinel": "",
        "entry.2131514773": rum.toString(), //rum
        //"entry.1368218702_sentinel": "",
        "entry.389133169": mag.toString(), //rum

        //bpi
        "entry.1758514091": formBloc.s5q1.value!, //1
        //"entry.1790925381_sentinel": "",
        "entry.1968935509": formBloc.s5q2.value, //2
        //"entry.124901644_sentinel": "",
        "entry.550399692": formBloc.s5q3.value, //3
        //"entry.1760478221_sentinel": "",
        "entry.1515222618": formBloc.s5q4.value, //4
        //"entry.185256138_sentinel": "",
        "entry.1572720441": formBloc.s5q5.value, //5
        //"entry.370849815_sentinel": "",
        "entry.601298258": formBloc.s5q6.value, //6
        //"entry.1554689652_sentinel": "",
        "entry.1703947088": formBloc.s5q7
            .value, //7                            "entry.670154805_sentinel": "",
        "entry.1868595634": formBloc.s5q8.value, //8
        //"entry.601281841_sentinel": "",
        "entry.1930497007": formBloc.s5q9.value, //9a
        //"entry.1533271608_sentinel": "",
        "entry.511846659": formBloc.s5q10.value, //9b
        //"entry.1941252130_sentinel": "",
        "entry.1164856125": formBloc.s5q11.value, //9c
        //"entry.1614877763_sentinel": "",
        "entry.1008201239": formBloc.s5q12.value, //9d
        //"entry.1770701982_sentinel": "",
        "entry.2100791389": formBloc.s5q13.value, //9e
        //"entry.1467341891_sentinel": "",
        "entry.565625303": formBloc.s5q14.value, //9f
        //"entry.1339084867_sentinel": "",
        "entry.1370431228": formBloc.s5q15.value, //9g

        //sf12
        "entry.1533633598": formBloc.s6q1.value!.label!, //1
        //"entry.1790925381_sentinel": "",
        "entry.1293917951": formBloc.s6q2.value!.label!, //2
        //"entry.124901644_sentinel": "",
        "entry.166816726": formBloc.s6q3.value!.label!, //3
        //"entry.1760478221_sentinel": "",
        "entry.1922617849": formBloc.s6q4.value!.label!, //4
        //"entry.185256138_sentinel": "",
        "entry.383217026": formBloc.s6q5.value!.label!, //5
        //"entry.370849815_sentinel": "",
        "entry.1882866172": formBloc.s6q6.value!.label!, //6
        //"entry.1554689652_sentinel": "",
        "entry.282180615": formBloc.s6q7.value!
            .label!, //7                            "entry.670154805_sentinel": "",
        "entry.1225151508": formBloc.s6q8.value!.label!, //8
        //"entry.601281841_sentinel": "",
        "entry.1301838858": formBloc.s6q9.value!.label!, //9
        //"entry.1533271608_sentinel": "",
        "entry.313398705": formBloc.s6q10.value!.label!, //10
        //"entry.1941252130_sentinel": "",
        "entry.1426755714": formBloc.s6q11.value!.label!, //11
        //"entry.1614877763_sentinel": "",
        "entry.1724181970": formBloc.s6q12.value!.label!, //12
        //"entry.1770701982_sentinel": "",
      };

      /*if (formBloc.s1q24.value != null) {
        //what surgery
        body["entry.2088268261"] = formBloc.s1q24.value!;
      }

      if (formBloc.s1q26.value != null) {
        //what treatment
        body["entry.321265577"] = formBloc.s1q26.value!;
      }

      if (formBloc.s1q28.value != null) {
        //last treatment
        body["entry.1665723020"] = formBloc.s1q28.value!;
      }*/

      //sentinels

      var sentinels = {
        "entry.1117188178_sentinel": "",
        "entry.865731743_sentinel": "",
        "entry.1889561135_sentinel": "",
        "entry.1779101486_sentinel": "",
        "entry.1479886165_sentinel": "",
        "entry.1834813309_sentinel": "",
        "entry.412021790_sentinel": "",
        "entry.75715165_sentinel": "",
        "entry.2011975094_sentinel": "",
        "entry.63682457_sentinel": "",
        "entry.834471042_sentinel": "",
        "entry.1108826654_sentinel": "",
        "entry.743810146_sentinel": "",
        "entry.2088268261_sentinel": "",
        "entry.2064434372_sentinel": "",
        "entry.321265577_sentinel": "",
        "entry.1665723020_sentinel": "",
        "entry.966959109_sentinel": "",
        "entry.517029057_sentinel": "",
        "entry.467631096_sentinel": "",
        "entry.2012874206_sentinel": "",
        "entry.1060267796_sentinel": "",
        "entry.2115974679_sentinel": "",
        "entry.1125018806_sentinel": "",
        "entry.330630256_sentinel": "",
        "entry.1089321465_sentinel": "",
        "entry.1759105873_sentinel": "",
        "entry.1351679641_sentinel": "",
        "entry.2088483937_sentinel": "",
        "entry.332048560_sentinel": "",
        "entry.494802760_sentinel": "",
        "entry.173490086_sentinel": "",
        "entry.1612998679_sentinel": "",
        "entry.1220886713_sentinel": "",
        "entry.449597003_sentinel": "",
        "entry.406177132_sentinel": "",
        "entry.1518313361_sentinel": "",
        "entry.1237644340_sentinel": "",
        "entry.1161800404_sentinel": "",
        "entry.1176162165_sentinel": "",
        "entry.1128365962_sentinel": "",
        "entry.2079819325_sentinel": "",
        "entry.1758514091_sentinel": "",
        "entry.550399692_sentinel": "",
        "entry.1515222618_sentinel": "",
        "entry.1572720441_sentinel": "",
        "entry.601298258_sentinel": "",
        "entry.1930497007_sentinel": "",
        "entry.511846659_sentinel": "",
        "entry.1164856125_sentinel": "",
        "entry.1008201239_sentinel": "",
        "entry.2100791389_sentinel": "",
        "entry.565625303_sentinel": "",
        "entry.1370431228_sentinel": "",
        "entry.1533633598_sentinel": "",
        "entry.1293917951_sentinel": "",
        "entry.512507973_sentinel": "",
        "entry.166816726_sentinel": "",
        "entry.1922617849_sentinel": "",
        "entry.383217026_sentinel": "",
        "entry.1882866172_sentinel": "",
        "entry.282180615_sentinel": "",
        "entry.1225151508_sentinel": "",
        "entry.1301838858_sentinel": "",
        "entry.313398705_sentinel": "",
        "entry.1426755714_sentinel": "",
        "entry.1724181970_sentinel": ""
      };

      body.addEntries(sentinels.entries);

      if(kDebugMode) {
        var c = jsonEncode(body);
        print(c);
      }
      

      try {
        var response = await http.post(
          Uri.parse(nodeUrl),
          body: body,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.back();

          showAnimatedDialog(
            context: Get.context!,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return ClassicGeneralDialogWidget(
                titleText: 'Fine',
                contentText: 'Grazie per la sua partecipazione',
                positiveText: 'Ok',
                negativeText: '',
                onPositiveClick: () {
                  Get.back();
                  Get.offAllNamed('/Start');
                },
                onNegativeClick: () {
                  Get.back();
                  Get.offAllNamed('/Start');
                },
              );
            },
            animationType: DialogTransitionType.slideFromTop,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
          );
        } else {
          Get.back();

          showAnimatedDialog(
            context: Get.context!,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return ClassicGeneralDialogWidget(
                titleText: 'Errore',
                contentText: 'Errore di invio.\nSi prega di riprovare',
                positiveText: 'Ok',
                negativeText: '',
                onPositiveClick: () {
                  Get.back();
                },
                onNegativeClick: () {
                  Get.back();
                },
              );
            },
            animationType: DialogTransitionType.slideFromTop,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
          );
        }
      } catch (e) {
        Get.back();

        showAnimatedDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return ClassicGeneralDialogWidget(
              titleText: 'Errore',
              contentText: 'Errore di invio.\nSi prega di riprovare',
              positiveText: 'Ok',
              negativeText: '',
              onPositiveClick: () {
                Get.back();
              },
              onNegativeClick: () {
                Get.back();
              },
            );
          },
          animationType: DialogTransitionType.slideFromTop,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        );
      }
    } else {
      Get.back();
    }*/

    Get.back();

        showAnimatedDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return ClassicGeneralDialogWidget(
              titleText: 'TO DO',
              contentText: 'da implementare',
              positiveText: 'Ok',
              negativeText: '',
              onPositiveClick: () {
                Get.back();
              },
              onNegativeClick: () {
                Get.back();
              },
            );
          },
          animationType: DialogTransitionType.slideFromTop,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        );
    }
  }
}
