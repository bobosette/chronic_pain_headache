import 'package:chronic_pain_headache/utils/firebase_options.dart';
import 'package:chronic_pain_headache/views/pages/prova.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'views/pages/form/form_page.dart';
import 'views/pages/start/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(ResultController());
    //Get.put(FormController());

    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Oswald'),
      builder: (context, child) => ResponsiveWrapper.builder(
          //la scroll physics in tutta l'app sarà bouncing => INTERESSANTE QUESTO
          BouncingScrollWrapper(
            child: child!,
          ),
          breakpoints: [
            //da 350 a 599 sono schermi da smartphone e quindi fa un resize, metodo di default di flutter
            //da 600 sono schermi da tablet o più grandi e quindi il contenuto deve essere SCALATO rispetto a smartphone
            //da 800 a 1700 sono schermi da desktop e quindi viene fatto un resize
            //da 1700 sono schermi enormi e il contenuto deve essere scalato rispetto a tablet/desktop
            const ResponsiveBreakpoint.resize(350, name: MOBILE),
            const ResponsiveBreakpoint.resize(720, name: TABLET), //for the form row
            const ResponsiveBreakpoint.resize(800, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(1700, name: 'XLARGE')
          ]),
      getPages: [
        //GetPage(name: '/Result', page: () => const ResultPage(), transition: Transition.rightToLeft),
        //GetPage(name: '/Play', page: () => const PlayPage(), transition: Transition.rightToLeft),
        GetPage(name: '/Form', page: () => const PainFormPage(), transition:  Transition.rightToLeft),
        GetPage(name: '/Start', page: () => const StartPage(), transition: Transition.leftToRight),
        //GetPage(name: '/Prova', page: () => const Prova(), transition: Transition.leftToRight),
      ],
      initialRoute: '/Start',
      //home: const Prova(),
    );
  }
}
