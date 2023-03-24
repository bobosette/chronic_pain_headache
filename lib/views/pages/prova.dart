import 'package:chronic_pain_headache/views/pages/form/form_controller.dart';
import 'package:chronic_pain_headache/views/widgets/body_mapping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prova extends StatelessWidget {
  const Prova({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(FormController());

    return const Scaffold(
      body: Center(child: BodyMapping(),),
    );
  }
}