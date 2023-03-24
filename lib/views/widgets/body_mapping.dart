import 'package:chronic_pain_headache/utils/const.dart';
import 'package:chronic_pain_headache/views/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BodyMapping extends StatelessWidget {
  const BodyMapping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (controller) {
        return LayoutBuilder(
                builder: (context, cons) => Center(
                    child: Container(

                        /// Here you size the container with the width for both height and width of
                        /// the container
                        height: cons.maxWidth * 0.7,
                        width: cons.maxWidth * 0.9,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/bodymap.jpg'),
                              fit: BoxFit.contain,
                            ),
                            color: Colors.white),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Center(
                              child: Stack(children: [
                            ...List.generate(bodySites.length, (index) {
                              return BodyResponsiveManager()
                                  .getPosition(bodySites[index], constraints, controller);
                            })
                          ]));
                        }))));
      }
    );
  }
}


class BodyResponsiveManager {
  Positioned getPosition(String label, BoxConstraints constraints, FormController controller) {
    late Points p;

    double diameter = constraints.maxWidth / 26;

    switch (label) {
      case 'Spalla destra-dietro':
        p = Points(
          top: constraints.maxHeight / 6,
          right: constraints.maxWidth / 1.66,
        );
        //right: factor * 8);
        break;
      case 'Spalla destra-avanti':
        p = Points(
          top: constraints.maxHeight / 6,
          right: constraints.maxWidth / 2.5,
        );
        //right: factor * 8);
        break;
      case 'Spalla sinistra-dietro':
        p = Points(
          top: constraints.maxHeight / 6,
          right: constraints.maxWidth / 1.4,
        );
        //right: factor * 8);
        break;
      case 'Spalla sinistra-avanti':
        p = Points(
          top: constraints.maxHeight / 6,
          right: constraints.maxWidth / 3.7,
        );
        //right: factor * 8);
        break;
      case 'Avambraccio sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 2.7,
          right: constraints.maxWidth / 1.32,
        );
        //right: factor * 6);
        break;
      case 'Avambraccio sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 2.7,
          right: constraints.maxWidth / 4.4,
        );
        //right: factor * 6);
        break;
      case 'Avambraccio destro-dietro':
        p = Points(
          top: constraints.maxHeight / 2.7,
          right: constraints.maxWidth / 1.8,
        );
        //right: factor * 6);
        break;
      case 'Avambraccio destro-avanti':
        p = Points(
          top: constraints.maxHeight / 2.7,
          right: constraints.maxWidth / 2.31,
        );
        //right: factor * 6);
        break;
      case 'Gomito sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 3.2,
          right: constraints.maxWidth / 1.32,
        );
        //right: factor * 6);
        break;
      case 'Gomito sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 3.2,
          right: constraints.maxWidth / 4.4,
        );
        //right: factor * 6);
        break;
      case 'Gomito destro-dietro':
        p = Points(
          top: constraints.maxHeight / 3.2,
          right: constraints.maxWidth / 1.8,
        );
        //right: factor * 6);
        break;
      case 'Gomito destro-avanti':
        p = Points(
          top: constraints.maxHeight / 3.2,
          right: constraints.maxWidth / 2.31,
        );
        //right: factor * 6);
        break;
      case 'Ginocchio destro-dietro':
        p = Points(
          top: constraints.maxHeight / 1.62,
          right: constraints.maxWidth / 1.62,
        );
        //right: factor * 9);
        break;
      case 'Ginocchio destro-avanti':
        p = Points(
          top: constraints.maxHeight / 1.62,
          right: constraints.maxWidth / 2.75,
        );
        //right: factor * 9);
        break;
      case 'Ginocchio sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 1.62,
          right: constraints.maxWidth / 1.47,
        );
        //right: factor * 9);
        break;
      case 'Ginocchio sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 1.62,
          right: constraints.maxWidth / 3.49,
        );
        //right: factor * 9);
        break;
      case 'Coscia destra-dietro':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth / 1.62,
        );
        //right: factor * 9);
        break;
      case 'Coscia destra-avanti':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth / 2.75,
        );
        //right: factor * 9);
        break;
      case 'Coscia sinistra-dietro':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth / 1.47,
        );
        //right: factor * 9);
        break;
      case 'Coscia sinistra-avanti':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth / 3.49,
        );
        //right: factor * 9);
        break;
      case 'Piede sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth / 3.59,
        );
        //right: factor * 2.5);
        break;
      case 'Piede sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth / 1.47,
        );
        //right: factor * 2.5);
        break;
      case 'Piede destro-avanti':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth / 2.75,
        );
        //right: factor * 2.5);
        break;
      case 'Piede destro-dietro':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth / 1.62,
        );
        //right: factor * 2.5);
        break;
      case 'Capo-avanti':
        p = Points(
          top: constraints.maxHeight / 32,
          right: constraints.maxWidth / 3.05,
        );
        //right: factor * 2.5);
        break;
      case 'Capo-dietro':
        p = Points(
          top: constraints.maxHeight / 32,
          right: constraints.maxWidth / 1.55,
        );
        //right: factor * 2.5);
        break;
      case 'Mano sinistra-dietro':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth / 1.28,
        );
        //right: factor * 6);
        break;
      case 'Mano sinistra-avanti':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth / 4.9,
        );
        //right: factor * 6);
        break;
      case 'Mano destra-dietro':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth / 1.95,
        );
        //right: factor * 6);
        break;
      case 'Mano destra-avanti':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth / 2.2,
        );
        //right: factor * 6);
        break;
      case 'Gamba sinistra-dietro':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth / 16,
        );
        //right: factor * 6);
        break;
      case 'Gamba sinistra-avanti':
        p = Points(
          top: constraints.maxHeight / 1.8,
          right: constraints.maxWidth /10,
        );
        //right: factor * 6);
        break;
      case 'Gamba destra-dietro':
        p = Points(
          top: constraints.maxHeight / 2,
          right: constraints.maxWidth /1.1,
        );
        //right: factor * 6);
        break;
      case 'Gamba destra-avanti':
        p = Points(
          top: constraints.maxHeight / 1.8,
          right: constraints.maxWidth / 1.15,
        );
        //right: factor * 6);
        break;
      case 'Braccio sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 4.7,
          right: constraints.maxWidth / 36,
        );
        //right: factor * 6);
        break;
      case 'Braccio sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 4.7,
          right: constraints.maxWidth /22,
        );
        //right: factor * 6);
        break;
      case 'Braccio destro-dietro':
        p = Points(
          top: constraints.maxHeight / 4.7,
          right: constraints.maxWidth /1.06,
        );
        //right: factor * 6);
        break;
      case 'Braccio destro-avanti':
        p = Points(
          top: constraints.maxHeight / 4.7,
          right: constraints.maxWidth / 1.09,
        );
        //right: factor * 6);
        break;
      case 'Polso sinistro-dietro':
        p = Points(
          top: constraints.maxHeight / 2.35,
          right: constraints.maxWidth / 38.90,
        );
        //right: factor * 6);
        break;
      case 'Polso sinistro-avanti':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth /35,
        );
        //right: factor * 6);
        break;
      case 'Polso destro-dietro':
        p = Points(
          top: constraints.maxHeight / 2.4,
          right: constraints.maxWidth /1.02,
        );
        //right: factor * 6);
        break;
      case 'Polso destro-avanti':
        p = Points(
          top: constraints.maxHeight / 2.2,
          right: constraints.maxWidth / 1.04,
        );
        //right: factor * 6);
        break;
      case 'Caviglia sinistra-dietro':
        p = Points(
          top: constraints.maxHeight / 1.17,
          right: constraints.maxWidth / 16,
        );
        //right: factor * 6);
        break;
      case 'Caviglia sinistra-avanti':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth /10,
        );
        //right: factor * 6);
        break;
      case 'Caviglia destra-dietro':
        p = Points(
          top: constraints.maxHeight / 1.17,
          right: constraints.maxWidth /1.1,
        );
        //right: factor * 6);
        break;
      case 'Caviglia destra-avanti':
        p = Points(
          top: constraints.maxHeight / 1.15,
          right: constraints.maxWidth / 1.15,
        );
        //right: factor * 6);
        break;
      case 'Pettorale':
        p = Points(
          top: constraints.maxHeight / 5,
          right: constraints.maxWidth /10,
        );
        //right: factor * 6);
        break;
      case 'Addome':
        p = Points(
          top: constraints.maxHeight / 2.7,
          right: constraints.maxWidth / 1.15,
        );
        //right: factor * 6);
        break;
      case 'Gluteo sinistro':
        p = Points(
          top: constraints.maxHeight / 2.5,
          right: constraints.maxWidth / 1.47,
        );
        //right: factor * 9);
        break;
      case 'Gluteo destro':
        p = Points(
          top: constraints.maxHeight / 2.5,
          right: constraints.maxWidth / 1.62,
        );
        //right: factor * 9);
        break;
      case 'Costato':
        p = Points(
          top: constraints.maxHeight / 3.8,
          right: constraints.maxWidth / 16,
        );
        //right: factor * 6);
        break;
      case 'Pelvi':
        p = Points(
          top: constraints.maxHeight / 2.4,
          right: constraints.maxWidth / 3.05,
        );
        //right: factor * 6);
        break;
      case 'Dorso':
        p = Points(
          top: constraints.maxHeight / 6,
          right: constraints.maxWidth / 1.53,
        );
        //right: factor * 8);
        break;
      case 'Lombo':
        p = Points(
          top: constraints.maxHeight / 3,
          right: constraints.maxWidth / 1.53,
        );
        //right: factor * 8);
        break;
      
    }

    bool isSelected = false;

    var selectOrNot = controller.selectedBodySites.firstWhereOrNull((element) => element == label);

    if(selectOrNot != null) {
      isSelected = true;
    }

    return Positioned(
      top: p.top,
      right: p.right,
      child: InkWell(
          onTap: () {
            if(isSelected) {
              controller.selectBodySites(label, true);
            } else {
              controller.selectBodySites(label, false);
            }
          },
          child: Container(
            height: diameter,
            width: diameter,
            decoration: BoxDecoration(
                border: Border.all(color: buttonColor),
                color: isSelected ? Colors.red.withOpacity(0.7) : null,
                borderRadius: const BorderRadius.all(Radius.circular(25))),
          )),
    );
  }
}

class Points {
  double? top, bottom, left, right;

  Points({this.top, this.bottom, this.left, this.right});
}
