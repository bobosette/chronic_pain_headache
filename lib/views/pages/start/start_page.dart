import 'package:chronic_pain_headache/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            bottom: 10.0,
            right: 10,
            left: 10,
            top: responsive.ResponsiveValue(context,
                defaultValue: 10,
                valueWhen: [
                  const responsive.Condition.smallerThan(
                      name: responsive.TABLET, value: 100)
                ]).value!.toDouble()),
        child: Column(
          children: [
            SizedBox(
                height: 350,
                //decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(background))),
                child: Column(
                  children: [
                    responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.TABLET)
                        ? Image.asset('images/background.jpg')
                        : SizedBox(
                            height: 200,
                            width: 500,
                            child: Image.asset('images/background.jpg')),
                    const Flexible(
                      child: Center(
                          child: SelectableText(
                        startTitle,
                        style: titleStyle,
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ],
                )),
            if (!responsive.ResponsiveWrapper.of(context)
                .isSmallerThan(responsive.TABLET))
              const SizedBox(
                height: 80,
              ),
            responsive.ResponsiveRowColumn(
              rowMainAxisAlignment: MainAxisAlignment.center,
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.ROW,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                responsive.ResponsiveRowColumnItem(
                  rowFlex: 2,
                  child: SelectableText(startContent,
                      style: contentStyle,
                      textAlign: responsive.ResponsiveWrapper.of(context)
                              .isSmallerThan(responsive.TABLET)
                          ? TextAlign.center
                          : TextAlign.justify),
                ),
                responsive.ResponsiveRowColumnItem(
                  child: SizedBox(
                    height: responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.DESKTOP)
                        ? 20
                        : 0,
                    width: responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.TABLET)
                        ? 0
                        : 100,
                  ),
                ),
                responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: ElevatedButton(
                    style: buttonStyle.copyWith(
                        fixedSize: MaterialStateProperty.all(Size(
                            responsive.ResponsiveValue(context,
                                defaultValue: 300.0,
                                valueWhen: [
                                  responsive.Condition.smallerThan(
                                      name: responsive.TABLET,
                                      value: Get.size.width - 10),
                                ]).value!.toDouble(),
                            50))),
                    onPressed: () {
                      Get.toNamed('/Form');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Inizia'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
