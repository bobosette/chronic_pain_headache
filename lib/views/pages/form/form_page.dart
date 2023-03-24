// ignore_for_file: prefer_const_constructors

import 'package:chronic_pain_headache/utils/const.dart';
import 'package:chronic_pain_headache/views/pages/form/form_controller.dart';
import 'package:chronic_pain_headache/views/pages/form/form_form.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class PainFormPage extends StatelessWidget {
  const PainFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<FormController>(
          init: FormController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: backgroundColor,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.navigate_before,
                    color: buttonColor,
                  ),
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        content:
                            const Text('Vuole tornare alla pagina iniziale?'),
                        actions: [
                          TextButton(
                              style: textButtonStyle,
                              onPressed: () => Get.back(),
                              child: const Text('No')),
                          TextButton(
                              style: textButtonStyle,
                              onPressed: () {
                                Get.back();
                                GetStorage().erase();
                                Get.offNamed('/Start');
                              },
                              child: Text('Si'))
                        ],
                      ),
                    );
                  },
                ),
                elevation: 0,
                backgroundColor: backgroundColor,
              ),
              body: BlocProvider(
                  create: (context) => PainFormBloc(),
                  child: Builder(builder: (context) {
                    final formBloc = BlocProvider.of<PainFormBloc>(context);

                    controller.getFormBloc(formBloc);

                    return FormBlocListener<PainFormBloc, String, String>(
                        onSubmitting: (context, state) async {
                          print('ciao');
                        },
                        onSuccess: (context, state) =>
                            controller.submitForm(state),
                        onFailure: (context, state) {
                          print('ciao');
                        },
                        child: StepperFormBlocBuilder<PainFormBloc>(
                          formBloc: context.read<PainFormBloc>(),
                          type: StepperType.horizontal,
                          physics: const ClampingScrollPhysics(),
                          stepsBuilder: (formBloc) {
                            //check if patient smokes => yes => show smoke's questions
                            formBloc!.s1q13.onValueChanges(
                              onData: (previous, current) async* {
                                //if smoke
                                if (current.value! == 'Si') {
                                  controller.setSmoke(true);
                                } else {
                                  controller.setSmoke(false);
                                }
                              },
                            );

                             //check if patient has aura => yes => aura duration question
                            formBloc.s7q8.onValueChanges(
                              onData: (previous, current) async* {
                                //if aura
                                if (current.value! == 'Si') {
                                  controller.setAura(true);
                                } else {
                                  controller.setAura(false);
                                }
                              },
                            );

      

                            return [
                              stepOne(formBloc, context, controller),
                              stepSeven(formBloc, context, controller),
                              stepTwo(formBloc, context, controller),
                              stepThree(formBloc, context, controller),
                              stepFour(formBloc, context, controller),
                              stepFive(formBloc, context, controller),
                              stepSix(formBloc, context, controller)
                            ];
                          },
                          controlsBuilder: (BuildContext context,
                              VoidCallback? onStepContinue,
                              VoidCallback? onStepCancel,
                              int? step,
                              FormBloc<dynamic, dynamic> formBloc) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                if(step != 0)
                                ElevatedButton(
                                  style: buttonStyle.copyWith(
                                      fixedSize: MaterialStateProperty.all(Size(
                                          responsive.ResponsiveValue(context,
                                              defaultValue: 300.0,
                                              valueWhen: [
                                                responsive.Condition
                                                    .smallerThan(
                                                        name: responsive.TABLET,
                                                        value: (Get.size.width -
                                                                60) /
                                                            2)
                                              ]).value!,
                                          50))),
                                  onPressed: () async {
                                    await controller.resetScroll();
                                    onStepCancel!();
                                  },
                                  child: const Text('Indietro'),
                                ),
                                //const SizedBox(width: 10,),
                                ElevatedButton(
                                  style: buttonStyle.copyWith(
                                      fixedSize: MaterialStateProperty.all(Size(
                                          responsive.ResponsiveValue(context,
                                              defaultValue: 300.0,
                                              valueWhen: [
                                                responsive.Condition
                                                    .smallerThan(
                                                        name: responsive.TABLET,
                                                        value: (Get.size.width -
                                                                60) /
                                                            2)
                                              ]).value!,
                                          50))),
                                  onPressed: () async {
                                    await controller.resetScroll();
                                    onStepContinue!();
                                  },
                                  child: Text(step == 5 ? 'Fine' : 'Avanti'),
                                ),
                              ],
                            );
                          },
                        ));
                  })),
            );
          }),
    );
  }
}
