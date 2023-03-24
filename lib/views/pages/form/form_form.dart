import 'package:chronic_pain_headache/models/score.dart';
import 'package:chronic_pain_headache/utils/const.dart';
import 'package:chronic_pain_headache/views/pages/form/form_controller.dart';
import 'package:chronic_pain_headache/views/widgets/body_mapping.dart';
import 'package:chronic_pain_headache/views/widgets/loading_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class PainFormBloc extends FormBloc<String, String> {
  //personal info

  //accomplish
  final s1q1 = BooleanFieldBloc(
      /*items: ['Si', 'No'],*/ validators: [FieldBlocValidators.required]);

  //18+
  final s1q2 = BooleanFieldBloc(
      /*items: ['Si', 'No'],*/ validators: [FieldBlocValidators.required]);

  //initial
  final s1q3 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //age
  final s1q4 = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);

  //gender
  final s1q5 = SelectFieldBloc(
      items: ['M', 'F'], validators: [FieldBlocValidators.required]);

  //school
  final s1q10 = SelectFieldBloc(items: [
    'Licenza elementare',
    'Licenza media inferiore',
    'Licenza media superiore/diploma',
    'Laurea triennale',
    'Laurea specialistica',
    'Specializzazione post-lauream/Dottorato'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //civil
  final s1q11 = SelectFieldBloc(
      items: ['Single', 'Sposata/o', 'Convivente', 'Vedova/o'],
      validators: [FieldBlocValidators.required]);

  //region
  final s1q6 = SelectFieldBloc(items: [
    'Abruzzo',
    'Basilicata',
    'Calabria',
    'Campania',
    'Emilia Romagna',
    'Friuli Venezia Giulia',
    'Lazio',
    'Liguria',
    'Lombardia',
    'Marche',
    'Molise',
    'Piemonte',
    'Puglia',
    'Sardegna',
    'Sicilia',
    'Toscana',
    'Trentino Alto Adige',
    'Umbria',
    'Val d\'Aosta',
    'Veneto'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //sport
  final s1q12 = SelectFieldBloc(items: [
    'Nessuna attività fisica',
    'Una volta ogni due settimane',
    'Una volta a settimana',
    'Due volte a settimana',
    'Tre o quattro volte a settimana',
    'Tutti i giorni'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //smoke
  final s1q13 = SelectFieldBloc(
      items: ['Si', 'No'], validators: [FieldBlocValidators.required]);

  //how many cigars
  final s1q14 = TextFieldBloc();

  //how many years
  final s1q15 = TextFieldBloc();

  //how many years you quit
  final s1q16 = TextFieldBloc();

  //patology
  final s1q7 = SelectFieldBloc(items: [
    'Cefalea',
  ], validators: [
    FieldBlocValidators.required
  ]);

  //others patologies
  final s1q8 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //therapy
  final s1q9 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //headache=========================================================

  //family
  final s7q1 = SelectFieldBloc(
      items: ['Si', 'No'], validators: [FieldBlocValidators.required]);

//pain behaviour
  final s7q2 = SelectFieldBloc(items: [
    'Pulsante/Martellante',
    'Gravativo',
    'Costrittivo',
    'Trafittivo',
    'Altro'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //pain intensity
  final s7q3 = SelectFieldBloc(
      items: ['Lieve', 'Moderata', 'Forte', 'Fortissima', 'Insopportabile'],
      validators: [FieldBlocValidators.required]);

  //initial pain place
  final s7q4 = SelectFieldBloc(items: [
    'Monolaterale dx',
    'Monolaterale sx',
    'Diffuso',
  ], validators: [
    FieldBlocValidators.required
  ]);

  //pain duration without drugs
  final s7q5 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //pain duration with drugs
  final s7q6 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //effort
  final s7q7 = SelectFieldBloc(
      items: ['Si', 'No'], validators: [FieldBlocValidators.required]);

  //aura
  final s7q8 = SelectFieldBloc(
      items: ['Si', 'No'], validators: [FieldBlocValidators.required]);

  //aura duration
  final s7q9 = TextFieldBloc();

  //what kind of drugs
  final s7q10 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //cure
  final s7q11 = MultiSelectFieldBloc(items: [
    'Farmaci tradizionali',
    'Farmaci omeopatici',
    'Agopuntura',
    'Psicoterapia',
    'Dieta',
    'Osteopatia',
    'Biofeedback',
    'TENS',
    'Massaggi',
    'Byte',
    'Blocco anestetico',
    'Fisioterapia'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //other sympthoms neusea
  final s7q12 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms vomito
  final s7q13 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms foto
  final s7q14 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms fono
  final s7q15 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms osmo
  final s7q16 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms tears
  final s7q17 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms rino
  final s7q32 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms cv
  final s7q18 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms motor
  final s7q19 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms sensitive
  final s7q20 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms disfa
  final s7q21 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //other sympthoms other
  final s7q22 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //reduction activity
  final s7q23 = SelectFieldBloc(items: [
    'Interrompe del tutto',
    'Rende meno del 50%',
    'Rende più del 50%',
    'Invariata'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //frequency
  final s7q24 = SelectFieldBloc(
      items: ['Quotidiana', 'Settimanale', 'Mensile', 'Annuale'],
      validators: [FieldBlocValidators.required]);

  //how many days no work
  final s7q25 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //how many days bad work
  final s7q26 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //how many days bad family
  final s7q27 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //how many days headache
  final s7q28 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //headache minimum intensity
  final s7q29 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //ps
  final s7q30 = SelectFieldBloc(
      items: ['Una volta', 'Due volte', 'Più volte', 'No, mai'],
      validators: [FieldBlocValidators.required]);

  //physician
  final s7q31 = MultiSelectFieldBloc(items: [
    'Nessuno',
    'Medico di famiglia',
    'Medico Specialista',
    'Neurologo',
    'Psichiatra',
    'Ortopedico',
    'Reumatologo',
    'Ginecologo',
    'Osteopata',
    'Omeopata',
    'Fisiatra',
    'Terapia del dolore',
    'Altro'
  ], validators: [
    FieldBlocValidators.required
  ]);

  //nrs====================================================

  //physical
  final s2q1 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //mind
  final s2q2 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //pseq====================================================

  final s3q1 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q2 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q3 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q4 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q5 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q6 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q7 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q8 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q9 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s3q10 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //pcs==================================================================

  final s4q1 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s4q2 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s4q3 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s4q4 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q5 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q6 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q7 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q8 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q9 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q10 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q11 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q12 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s4q13 = SelectFieldBloc(items: [
    Score(label: 'Mai', value: '0'),
    Score(label: 'Raramente', value: '1'),
    Score(label: 'Qualche volta', value: '2'),
    Score(label: 'Spesso', value: '3'),
    Score(label: 'Sempre', value: '4')
  ], validators: [
    FieldBlocValidators.required
  ]);

//bpi=====================================================================

  final s5q1 = SelectFieldBloc(items: [
    'Si',
    'No',
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s5q2 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q3 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q4 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q5 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q6 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q7 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q8 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q9 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q10 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q11 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q12 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q13 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q14 = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final s5q15 = TextFieldBloc(validators: [FieldBlocValidators.required]);

  //sf12==================================================================

  final s6q1 = SelectFieldBloc(items: [
    Score(label: 'Eccellente', value: '1'),
    Score(label: 'Molto Buona', value: '2'),
    Score(label: 'Buona', value: '3'),
    Score(label: 'Passabile', value: '4'),
    Score(label: 'Scadente', value: '5')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s6q2 = SelectFieldBloc(items: [
    Score(label: 'Si, mi limita parecchio', value: '1'),
    Score(label: 'Si, mi limita parzialmente', value: '2'),
    Score(label: 'No, non mi limita per nulla', value: '3')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s6q3 = SelectFieldBloc(items: [
    Score(label: 'Si, mi limita parecchio', value: '1'),
    Score(label: 'Si, mi limita parzialmente', value: '2'),
    Score(label: 'No, non mi limita per nulla', value: '3')
  ], validators: [
    FieldBlocValidators.required
  ]);

  final s6q4 = SelectFieldBloc(
      items: [Score(label: 'Si', value: '1'), Score(label: 'No', value: '2')],
      validators: [FieldBlocValidators.required]);
  final s6q5 = SelectFieldBloc(
      items: [Score(label: 'Si', value: '1'), Score(label: 'No', value: '2')],
      validators: [FieldBlocValidators.required]);
  final s6q6 = SelectFieldBloc(
      items: [Score(label: 'Si', value: '1'), Score(label: 'No', value: '2')],
      validators: [FieldBlocValidators.required]);
  final s6q7 = SelectFieldBloc(
      items: [Score(label: 'Si', value: '1'), Score(label: 'No', value: '2')],
      validators: [FieldBlocValidators.required]);
  final s6q8 = SelectFieldBloc(items: [
    Score(label: 'Per nulla', value: '1'),
    Score(label: 'Molto poco', value: '2'),
    Score(label: 'Un po\'', value: '3'),
    Score(label: 'Molto', value: '4'),
    Score(label: 'Moltissimo', value: '5')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s6q9 = SelectFieldBloc(items: [
    Score(label: 'Sempre', value: '1'),
    Score(label: 'Quasi sempre', value: '2'),
    Score(label: 'Molto tempo', value: '3'),
    Score(label: 'Una parte del tempo', value: '4'),
    Score(label: 'Quasi mai', value: '5'),
    Score(label: 'Mai', value: '6')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s6q10 = SelectFieldBloc(items: [
    Score(label: 'Sempre', value: '1'),
    Score(label: 'Quasi sempre', value: '2'),
    Score(label: 'Molto tempo', value: '3'),
    Score(label: 'Una parte del tempo', value: '4'),
    Score(label: 'Quasi mai', value: '5'),
    Score(label: 'Mai', value: '6')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s6q11 = SelectFieldBloc(items: [
    Score(label: 'Sempre', value: '1'),
    Score(label: 'Quasi sempre', value: '2'),
    Score(label: 'Molto tempo', value: '3'),
    Score(label: 'Una parte del tempo', value: '4'),
    Score(label: 'Quasi mai', value: '5'),
    Score(label: 'Mai', value: '6')
  ], validators: [
    FieldBlocValidators.required
  ]);
  final s6q12 = SelectFieldBloc(items: [
    Score(label: 'Sempre', value: '1'),
    Score(label: 'Quasi sempre', value: '2'),
    Score(label: 'Una parte del tempo', value: '3'),
    Score(label: 'Quasi mai', value: '4'),
    Score(label: 'Mai', value: '5')
  ], validators: [
    FieldBlocValidators.required
  ]);

  PainFormBloc() : super(isLoading: true) {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        s1q1,
        s1q2,
        s1q3,
        s1q4,
        s1q5,
        s1q10,
        s1q11,
        s1q6,
        s1q12,
        s1q13,
        s1q14,
        s1q15,
        s1q16,
        s1q7,
        s1q8,
        s1q9,
      ],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [
        s7q1,
        s7q2,
        s7q3,
        s7q4,
        s7q5,
        s7q6,
        s7q7,
        s7q8,
        s7q9,
        s7q10,
        s7q11,
        s7q12,
        s7q13,
        s7q14,
        s7q15,
        s7q16,
        s7q17,
        s7q32,
        s7q18,
        s7q19,
        s7q20,
        s7q21,
        s7q22,
        s7q23,
        s7q24,
        s7q25,
        s7q26,
        s7q27,
        s7q28,
        s7q29,
        s7q30,
        s7q31,
      ],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [
        s2q1,
        s2q2,
      ],
    );
    addFieldBlocs(
      step: 3,
      fieldBlocs: [s3q1, s3q2, s1q3, s3q4, s3q5, s3q6, s3q7, s3q8, s3q9, s3q10],
    );
    addFieldBlocs(
      step: 4,
      fieldBlocs: [
        s4q1,
        s4q2,
        s4q3,
        s4q4,
        s4q5,
        s4q6,
        s4q7,
        s4q8,
        s4q9,
        s4q10,
        s4q11,
        s4q12,
        s4q13
      ],
    );
    addFieldBlocs(
      step: 5,
      fieldBlocs: [
        s5q1,
        s5q2,
        s5q3,
        s5q4,
        s5q5,
        s5q6,
        s5q7,
        s5q8,
        s5q9,
        s5q10,
        s5q11,
        s5q12,
        s5q13,
        s5q14,
        s5q15,
      ],
    );
    addFieldBlocs(
      step: 6,
      fieldBlocs: [
        s6q1,
        s6q2,
        s6q3,
        s6q4,
        s6q5,
        s6q6,
        s6q7,
        s6q8,
        s6q9,
        s6q10,
        s6q11,
        s6q12,
      ],
    );
  }

  @override
  void onLoading() async {
    try {
      s1q7.updateInitialValue('Cefalea');
      s1q7.updateValue('Cefalea');

      s1q4.addValidators([
        (value) {
          if (!isInt(value)) {
            return 'Ammesso solo formato numerico';
          } else {
            return null;
          }
        }
      ]);

      /*s1q14.addValidators([
        (value) {
          if (!isInt(value)) {
            return 'Ammesso solo formato numerico';
          } else {
            return null;
          }
        }
      ]);

      s1q15.addValidators([
        (value) {
          if (!isInt(value)) {
            return 'Ammesso solo formato numerico';
          } else {
            return null;
          }
        }
      ]);*/

      s7q12.updateValue(FormController.to.section7SliderValue['12']!);
      s7q13.updateValue(FormController.to.section7SliderValue['13']!);
      s7q14.updateValue(FormController.to.section7SliderValue['14']!);
      s7q15.updateValue(FormController.to.section7SliderValue['15']!);
      s7q16.updateValue(FormController.to.section7SliderValue['16']!);
      s7q17.updateValue(FormController.to.section7SliderValue['17']!);
      s7q32.updateValue(FormController.to.section7SliderValue['32']!);
      s7q18.updateValue(FormController.to.section7SliderValue['18']!);
      s7q19.updateValue(FormController.to.section7SliderValue['19']!);
      s7q20.updateValue(FormController.to.section7SliderValue['20']!);
      s7q21.updateValue(FormController.to.section7SliderValue['21']!);
      s7q22.updateValue(FormController.to.section7SliderValue['22']!);
      s7q29.updateValue(FormController.to.section7SliderValue['29']!);

      s2q1.updateValue(FormController.to.physicalNrs);
      s2q2.updateValue(FormController.to.mindNrs);

      s3q1.updateValue(FormController.to.section3SliderValue['1']!);
      s3q2.updateValue(FormController.to.section3SliderValue['2']!);
      s3q3.updateValue(FormController.to.section3SliderValue['3']!);
      s3q4.updateValue(FormController.to.section3SliderValue['4']!);
      s3q5.updateValue(FormController.to.section3SliderValue['5']!);
      s3q6.updateValue(FormController.to.section3SliderValue['6']!);
      s3q7.updateValue(FormController.to.section3SliderValue['7']!);
      s3q8.updateValue(FormController.to.section3SliderValue['8']!);
      s3q9.updateValue(FormController.to.section3SliderValue['9']!);
      s3q10.updateValue(FormController.to.section3SliderValue['10']!);

      s5q2.updateInitialValue('');
      s5q3.updateValue(FormController.to.section5SliderValue['1']!);
      s5q4.updateValue(FormController.to.section5SliderValue['2']!);
      s5q5.updateValue(FormController.to.section5SliderValue['3']!);
      s5q6.updateValue(FormController.to.section5SliderValue['4']!);
      s5q8.updateValue(FormController.to.section5SliderValue['5']!);
      s5q9.updateValue(FormController.to.section5SliderValue['6']!);
      s5q10.updateValue(FormController.to.section5SliderValue['7']!);
      s5q11.updateValue(FormController.to.section5SliderValue['8']!);
      s5q12.updateValue(FormController.to.section5SliderValue['9']!);
      s5q13.updateValue(FormController.to.section5SliderValue['10']!);
      s5q14.updateValue(FormController.to.section5SliderValue['7']!);
      s5q15.updateValue(FormController.to.section5SliderValue['8']!);

      emitLoaded();
    } catch (e) {
      emitLoadFailed();
    }
  }

  @override
  void onSubmitting() async {
    Get.dialog(const LoadingDialog());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      emitSuccess(canSubmitAgain: true);
      Get.back();
    } catch (e) {
      Get.back();
      emitFailure();
    }
  }
}

List<dynamic> getFieldSection1(PainFormBloc formBloc) {
  return [
    formBloc.s1q1,
    formBloc.s1q2,
    formBloc.s1q3,
    formBloc.s1q4,
    formBloc.s1q5,
    formBloc.s1q10,
    formBloc.s1q11,
    formBloc.s1q6,
    formBloc.s1q12,
    formBloc.s1q13,
    formBloc.s1q14,
    formBloc.s1q15,
    formBloc.s1q16,
    formBloc.s1q7,
    formBloc.s1q8,
    formBloc.s1q9
  ];
}

List<dynamic> getFieldSection7(PainFormBloc formBloc) {
  return [
    formBloc.s7q1,
    formBloc.s7q2,
    formBloc.s7q3,
    formBloc.s7q4,
    formBloc.s7q5,
    formBloc.s7q6,
    formBloc.s7q7,
    formBloc.s7q8,
    formBloc.s7q9,
    formBloc.s7q10,
    formBloc.s7q11,
    formBloc.s7q12,
    formBloc.s7q13,
    formBloc.s7q14,
    formBloc.s7q15,
    formBloc.s7q16,
    formBloc.s7q17,
    formBloc.s7q32,
    formBloc.s7q18,
    formBloc.s7q19,
    formBloc.s7q20,
    formBloc.s7q21,
    formBloc.s7q22,
    formBloc.s7q23,
    formBloc.s7q24,
    formBloc.s7q25,
    formBloc.s7q26,
    formBloc.s7q27,
    formBloc.s7q28,
    formBloc.s7q29,
    formBloc.s7q30,
    formBloc.s7q31,
  ];
}

List<TextFieldBloc<dynamic>> getFieldSection2(PainFormBloc formBloc) {
  return [
    formBloc.s2q1,
    formBloc.s2q2,
  ];
}

List<dynamic> getFieldSection3(PainFormBloc formBloc) {
  return [
    formBloc.s3q1,
    formBloc.s3q2,
    formBloc.s3q3,
    formBloc.s3q4,
    formBloc.s3q5,
    formBloc.s3q6,
    formBloc.s3q7,
    formBloc.s3q8,
    formBloc.s3q9,
    formBloc.s3q10
  ];
}

List<dynamic> getFieldSection4(PainFormBloc formBloc) {
  return [
    formBloc.s4q1,
    formBloc.s4q2,
    formBloc.s4q3,
    formBloc.s4q4,
    formBloc.s4q5,
    formBloc.s4q6,
    formBloc.s4q7,
    formBloc.s4q8,
    formBloc.s4q9,
    formBloc.s4q10,
    formBloc.s4q11,
    formBloc.s4q12,
    formBloc.s4q13
  ];
}

List<dynamic> getFieldSection5(PainFormBloc formBloc) {
  return [
    formBloc.s5q1,
    formBloc.s5q2,
    formBloc.s5q3,
    formBloc.s5q4,
    formBloc.s5q5,
    formBloc.s5q6,
    formBloc.s5q7,
    formBloc.s5q8,
    formBloc.s5q9,
    formBloc.s5q10,
    formBloc.s5q11,
    formBloc.s5q12,
    formBloc.s5q13,
    formBloc.s5q14,
    formBloc.s5q15
  ];
}

List<dynamic> getFieldSection6(PainFormBloc formBloc) {
  return [
    formBloc.s6q1,
    formBloc.s6q2,
    formBloc.s6q3,
    formBloc.s6q4,
    formBloc.s6q5,
    formBloc.s6q6,
    formBloc.s6q7,
    formBloc.s6q8,
    formBloc.s6q9,
    formBloc.s6q10,
    formBloc.s6q11,
    formBloc.s6q12,
  ];
}

FormBlocStep stepOne(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section1.length; i++) {
    switch (i) {
      //checkbox
      case 0:
      case 1:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 100,
            child: CheckboxFieldBlocBuilder(
              fillColor: MaterialStateProperty.all(buttonColor),
              booleanFieldBloc: getFieldSection1(formBloc)[i],
              errorBuilder: (context, error) {
                return 'Campo Obbligatorio';
              },
              body: Container(
                alignment: Alignment.centerLeft,
                child: FittedBox(child: Text(section1[i], maxLines: 1)),
              ),
            ),
          ),
        ));
        break;
      //radio
      case 4:
      case 6:
      case 9:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section1[i]))),
                responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: responsive.ResponsiveWrapper.of(context)
                          .isSmallerThan(responsive.TABLET)
                      ? SizedBox(
                          //height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            selectFieldBloc: getFieldSection1(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: inputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            groupStyle: const FlexGroupStyle(
                                //textDirection: TextDirection.rtl,
                                direction: Axis.horizontal),
                            selectFieldBloc: getFieldSection1(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: rowInputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));
        break;

      //text
      case 2:
      case 3:
      case 14:
      case 15:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section1[i]),
                SizedBox(
                  //height: 80,
                  //width: 500,
                  child: TextFieldBlocBuilder(
                    keyboardType:
                        i == 3 ? TextInputType.number : TextInputType.text,
                    cursorColor: buttonColor,
                    textFieldBloc: getFieldSection1(formBloc)[i],
                    errorBuilder: (context, error) {
                      if (error.toString() != 'Required - Validator Error') {
                        return error.toString();
                      } else {
                        return 'Campo Obbligatorio';
                      }
                    },
                    /*inputFormatters: (i == 3 || i == 15)
                        ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                        : null,*/
                    decoration: inputStyle,
                  ),
                ),
              ],
            ),
          ),
        ));
        break;

      //smoke text
      case 10:
      case 11:
        questions.add(GetBuilder<FormController>(builder: (controller) {
          return Visibility(
            visible: controller.isSmoke,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                //height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section1[i]),
                    SizedBox(
                      //height: 80,
                      //width: 500,
                      child: TextFieldBlocBuilder(
                        keyboardType: TextInputType.number,
                        cursorColor: buttonColor,
                        textFieldBloc: getFieldSection1(formBloc)[i],
                        errorBuilder: (context, error) {
                          if (error.toString() !=
                              'Required - Validator Error') {
                            return error.toString();
                          } else {
                            return 'Campo Obbligatorio';
                          }
                        },
                        /*inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],*/
                        decoration: inputStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
        break;
      case 12:
        questions.add(GetBuilder<FormController>(builder: (controller) {
          return Visibility(
            visible: !controller.isSmoke,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                //height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section1[i]),
                    SizedBox(
                      //height: 80,
                      //width: 500,
                      child: TextFieldBlocBuilder(
                        keyboardType: TextInputType.number,
                        cursorColor: buttonColor,
                        textFieldBloc: getFieldSection1(formBloc)[i],
                        errorBuilder: (context, error) {
                          if (error.toString() !=
                              'Required - Validator Error') {
                            return error.toString();
                          } else {
                            return 'Campo Obbligatorio';
                          }
                        },
                        /*inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],*/
                        decoration: inputStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
        break;

      //dropdown
      case 5:
      case 7:
      case 8:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section1[i]))),
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.TABLET)
                        ? SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownFieldBlocBuilder<String>(
                              showEmptyItem: false,
                              selectFieldBloc: getFieldSection1(formBloc)[i],
                              errorBuilder: (context, error) {
                                return 'Campo Obbligatorio';
                              },
                              decoration: inputStyle,
                              itemBuilder: (context, value) => FieldItem(
                                child: Text(value),
                              ),
                            ),
                          )
                        : SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownFieldBlocBuilder<String>(
                              showEmptyItem: false,
                              selectFieldBloc: getFieldSection1(formBloc)[i],
                              errorBuilder: (context, error) {
                                return 'Campo Obbligatorio';
                              },
                              decoration: inputStyle,
                              itemBuilder: (context, value) => FieldItem(
                                child: Text(value),
                              ),
                            ),
                          )),
              ],
            ),
          ),
        ));
        break;
      case 13:
        questions.add(Container());
        break;
    }
  }

  return FormBlocStep(
    title: Container(),
    //state: StepState.indexed,
    content: SingleChildScrollView(
      controller: controller.scrollController1,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              section1Title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions
          ],
        ),
      ),
    ),
  );
}

FormBlocStep stepSeven(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section7.length; i++) {
    switch (i) {
      //multiselect
      case 10:
      case 31:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section7[i]))),
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.TABLET)
                        ? SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownSearch<String>.multiSelection(
                            onChanged: (value) {
                              if (i == 10) {
                                formBloc.s7q11.updateValue(value);
                              } else {
                                formBloc.s7q31.updateValue(value);
                              }
                            },
                            /*dropdownButtonProps: const DropdownButtonProps(
                  color: abanoColorSecond, icon: Icon(Iconsax.arrow_down)),*/
                            clearButtonProps:
                                const ClearButtonProps(isVisible: true),
                            items: i == 10
                                ? formBloc.s7q11.state.items
                                : formBloc.s7q31.state.items,
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                                    dropdownSearchDecoration: inputStyle),
                            /*popupProps: const PopupProps.menu(
                searchFieldProps: TextFieldProps(decoration: inputStyle),
                showSearchBox: true,
              ),*/
                            //itemAsString: (item) => item.name!.capitalizeFirst!,
                          ))
                        : SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownSearch<String>.multiSelection(
                            onChanged: (value) {
                              if (i == 10) {
                                formBloc.s7q11.updateValue(value);
                              } else {
                                formBloc.s7q31.updateValue(value);
                              }
                            },
                            /*dropdownButtonProps: const DropdownButtonProps(
                  color: abanoColorSecond, icon: Icon(Iconsax.arrow_down)),*/
                            clearButtonProps:
                                const ClearButtonProps(isVisible: true),
                            items: i == 10
                                ? formBloc.s7q11.state.items
                                : formBloc.s7q31.state.items,
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                                    dropdownSearchDecoration: inputStyle),
                            /*popupProps: const PopupProps.menu(
                searchFieldProps: TextFieldProps(decoration: inputStyle),
                showSearchBox: true,
              ),*/
                            //itemAsString: (item) => item.name!.capitalizeFirst!,
                          ))),
              ],
            ),
          ),
        ));
        break;
      //radio
      case 0:
      case 2:
      case 3:
      case 6:
      case 7:
      case 24:
      case 30:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section7[i]))),
                responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: responsive.ResponsiveWrapper.of(context)
                          .isSmallerThan(responsive.TABLET)
                      ? SizedBox(
                          //height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            selectFieldBloc: getFieldSection7(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: inputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            groupStyle: const FlexGroupStyle(
                                //textDirection: TextDirection.rtl,
                                direction: Axis.horizontal),
                            selectFieldBloc: getFieldSection7(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: rowInputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));
        break;

      //text
      case 4:
      case 5:
      case 9:
      case 28:
      case 25:
      case 26:
      case 27:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section7[i]),
                SizedBox(
                  //height: 80,
                  //width: 500,
                  child: TextFieldBlocBuilder(
                    cursorColor: buttonColor,
                    textFieldBloc: getFieldSection7(formBloc)[i],
                    errorBuilder: (context, error) {
                      return 'Campo Obbligatorio';
                    },
                    decoration: inputStyle,
                  ),
                ),
              ],
            ),
          ),
        ));
        break;

      //aura text
      case 8:
        questions.add(GetBuilder<FormController>(builder: (controller) {
          return Visibility(
            visible: controller.isAura,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                //height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section7[i]),
                    SizedBox(
                      //height: 80,
                      //width: 500,
                      child: TextFieldBlocBuilder(
                        cursorColor: buttonColor,
                        textFieldBloc: getFieldSection7(formBloc)[i],
                        errorBuilder: (context, error) {
                          return 'Campo Obbligatorio';
                        },
                        decoration: inputStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
        break;

      //dropdown
      case 1:
      case 23:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section7[i]))),
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: responsive.ResponsiveWrapper.of(context)
                            .isSmallerThan(responsive.TABLET)
                        ? SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownFieldBlocBuilder<String>(
                              showEmptyItem: false,
                              selectFieldBloc: getFieldSection7(formBloc)[i],
                              errorBuilder: (context, error) {
                                return 'Campo Obbligatorio';
                              },
                              decoration: inputStyle,
                              itemBuilder: (context, value) => FieldItem(
                                child: Text(value),
                              ),
                            ),
                          )
                        : SizedBox(
                            //height: 120,
                            //width: 400,
                            child: DropdownFieldBlocBuilder<String>(
                              showEmptyItem: false,
                              selectFieldBloc: getFieldSection7(formBloc)[i],
                              errorBuilder: (context, error) {
                                return 'Campo Obbligatorio';
                              },
                              decoration: inputStyle,
                              itemBuilder: (context, value) => FieldItem(
                                child: Text(value),
                              ),
                            ),
                          )),
              ],
            ),
          ),
        ));
        break;
      //cefalea slider
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 29:
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              if (i == 11)
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Indichi i fenomeni che accompagnano il suo dolore  (da 1 a 10 gravità, dove 1= nulla, 10= molto grave)')),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                  //height: 300,
                  child: GetBuilder<FormController>(builder: (controller) {
                

                String val = '';
                if (i == 29) {
                  val = controller.section7SliderValue['$i']!;
                } else if (i == 17) {
                  val = controller.section7SliderValue['32']!;
                } else {
                  val = controller.section7SliderValue['${i + 1}']!;
                }

                //hide altro
                if (i == 2) {
                  return Container();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(section7[i]),
                      Slider(
                        activeColor: buttonColor,
                        inactiveColor: Colors.grey,
                        thumbColor: buttonColor,
                        value: double.parse(val),
                        max: 10,
                        min: 0,
                        onChanged: (value) {
                          getFieldSection7(formBloc)[i]
                              .updateValue(value.toStringAsFixed(0));

                          controller.setSection7SliderValue(
                              i, value.toStringAsFixed(0));
                        },
                      ),
                      Stack(
                        children: [
                          Row(
                            children: const [
                              Text('0 Nulla'),
                              Spacer(),
                              Text('10 Molto grave')
                            ],
                          ),
                          Center(
                            child: Builder(builder: (context) {
                              return CircleAvatar(
                                  backgroundColor: buttonColor,
                                  child: Text(
                                    val,
                                    style: const TextStyle(color: Colors.white),
                                  ));
                            }),
                          ),
                        ],
                      )
                    ],
                  );
                }
              })),
            ],
          ),
        ));
        break;
    }
  }

  return FormBlocStep(
    title: Container(),
    //state: StepState.indexed,
    content: SingleChildScrollView(
      controller: controller.scrollController1,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              section7Title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions
          ],
        ),
      ),
    ),
  );
}

FormBlocStep stepTwo(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section2.length; i++) {
    questions.add(Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
          //height: 300,
          child: GetBuilder<FormController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section2[i]),
            Text(
              i == 0 ? section21Subtitle : section22Subtitle,
            ),
            Slider(
              activeColor: buttonColor,
              inactiveColor: Colors.grey,
              thumbColor: buttonColor,
              value: i == 0
                  ? double.parse(controller.physicalNrs)
                  : double.parse(controller.mindNrs),
              max: 10,
              min: 0,
              onChanged: (value) {
                getFieldSection2(formBloc)[i]
                    .updateValue(value.toStringAsFixed(0));
                if (i == 0) {
                  controller.setPhysicalNrs(value.toStringAsFixed(0));
                } else {
                  controller.setMindNrs(value.toStringAsFixed(0));
                }
              },
            ),
            Stack(
              children: [
                Row(
                  children: const [Text('0'), Spacer(), Text('10')],
                ),
                Center(
                  child: Builder(builder: (context) {
                    var text = '';
                    if (i == 0) {
                      text = controller.physicalNrs;
                    } else {
                      text = controller.mindNrs;
                    }

                    return CircleAvatar(
                        backgroundColor: buttonColor,
                        child: Text(
                          text,
                          style: const TextStyle(color: Colors.white),
                        ));
                  }),
                ),
              ],
            )
          ],
        );
      })),
    ));
  }

  return FormBlocStep(
      title: const Text(''),
      content: SingleChildScrollView(
          controller: controller.scrollController2,
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SelectableText(
                    section2Title,
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...questions
                ],
              ))));
}

FormBlocStep stepThree(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section3.length; i++) {
    questions.add(Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
          //height: 300,
          child: GetBuilder<FormController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section3[i]),
            Slider(
              activeColor: buttonColor,
              inactiveColor: Colors.grey,
              thumbColor: buttonColor,
              value: double.parse(controller.section3SliderValue['${i + 1}']!),
              max: 6,
              min: 0,
              onChanged: (value) {
                getFieldSection3(formBloc)[i]
                    .updateValue(value.toStringAsFixed(0));

                controller.setSection3SliderValue(i, value.toStringAsFixed(0));
              },
            ),
            Stack(
              children: [
                Row(
                  children: const [
                    Text('0 Per nulla sicuro'),
                    Spacer(),
                    Text('6 Completamente sicuro')
                  ],
                ),
                Center(
                  child: Builder(builder: (context) {
                    var text = '';

                    text = controller.section3SliderValue['${i + 1}']!;

                    return CircleAvatar(
                        backgroundColor: buttonColor,
                        child: Text(
                          text,
                          style: const TextStyle(color: Colors.white),
                        ));
                  }),
                ),
              ],
            )
          ],
        );
      })),
    ));
  }

  return FormBlocStep(
      title: const Text(''),
      content: SingleChildScrollView(
          controller: controller.scrollController3,
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SelectableText(
                    section3Title,
                    style: titleStyle,
                  ),
                  const SelectableText(
                    section3Subtitle,
                    style: contentStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...questions
                ],
              ))));
}

FormBlocStep stepFour(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section4.length; i++) {
    //radio
    questions.add(Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
            //height: 300,
            child: responsive.ResponsiveRowColumn(
          layout: responsive.ResponsiveWrapper.of(context)
                  .isSmallerThan(responsive.TABLET)
              ? responsive.ResponsiveRowColumnType.COLUMN
              : responsive.ResponsiveRowColumnType.ROW,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          rowMainAxisAlignment: MainAxisAlignment.center,
          children: [
            responsive.ResponsiveRowColumnItem(
                rowFlex: 1,
                child:
                    SizedBox(width: Get.size.width, child: Text(section4[i]))),
            responsive.ResponsiveRowColumnItem(
              rowFlex: 1,
              child: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? SizedBox(
                      //height: 120,
                      //width: 400,
                      child: RadioButtonGroupFieldBlocBuilder<Score>(
                        selectFieldBloc: getFieldSection4(formBloc)[i],
                        fillColor: MaterialStateProperty.all(buttonColor),
                        errorBuilder: (context, error) {
                          return 'Campo Obbligatorio';
                        },
                        decoration: inputStyle,
                        itemBuilder: (context, item) =>
                            FieldItem(child: Text(item.label!)),
                      ),
                    )
                  : SizedBox(
                      height: 120,
                      //width: 400,
                      child: RadioButtonGroupFieldBlocBuilder<Score>(
                        groupStyle: const FlexGroupStyle(
                            textDirection: TextDirection.rtl,
                            direction: Axis.horizontal),
                        selectFieldBloc: getFieldSection4(formBloc)[i],
                        fillColor: MaterialStateProperty.all(buttonColor),
                        errorBuilder: (context, error) {
                          return 'Campo Obbligatorio';
                        },
                        decoration: rowInputStyle,
                        itemBuilder: (context, item) => FieldItem(
                          child: Container(),
                        ),
                      ),
                    ),
            ),
          ],
        ))));
  }

  return FormBlocStep(
      title: const Text(''),
      content: SingleChildScrollView(
          controller: controller.scrollController4,
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SelectableText(
                    section4Title,
                    style: titleStyle,
                  ),
                  const SelectableText(
                    section4Subtitle,
                    style: contentStyle,
                    textAlign: TextAlign.center,
                  ),
                  if (!responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET))
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        //height: 300,
                        child: responsive.ResponsiveRowColumn(
                          layout: responsive.ResponsiveWrapper.of(context)
                                  .isSmallerThan(responsive.TABLET)
                              ? responsive.ResponsiveRowColumnType.COLUMN
                              : responsive.ResponsiveRowColumnType.ROW,
                          columnCrossAxisAlignment: CrossAxisAlignment.start,
                          rowMainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            responsive.ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: SizedBox(
                                  width: Get.size.width,
                                )),
                            responsive.ResponsiveRowColumnItem(
                                rowFlex: 1,
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      FittedBox(child: Text('Mai')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FittedBox(child: Text('Raramente')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FittedBox(child: Text('Qualche volta')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FittedBox(child: Text('Spesso')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child: FittedBox(child: Text('Sempre')),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ...questions
                ],
              ))));
}

FormBlocStep stepFive(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section5.length; i++) {
    switch (i) {
      case 0: //radio
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 150,
            child: responsive.ResponsiveRowColumn(
              layout: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? responsive.ResponsiveRowColumnType.COLUMN
                  : responsive.ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox(
                        width: Get.size.width, child: Text(section5[i]))),
                responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: responsive.ResponsiveWrapper.of(context)
                          .isSmallerThan(responsive.TABLET)
                      ? SizedBox(
                          //height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            selectFieldBloc: getFieldSection5(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: inputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                //style: TextStyle(fontSize: i == 8 ? 10 : 14),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 120,
                          //width: 400,
                          child: RadioButtonGroupFieldBlocBuilder<String>(
                            groupStyle: const FlexGroupStyle(
                                direction: Axis.horizontal),
                            selectFieldBloc: getFieldSection5(formBloc)[i],
                            errorBuilder: (context, error) {
                              return 'Campo Obbligatorio';
                            },
                            fillColor: MaterialStateProperty.all(buttonColor),
                            decoration: rowInputStyle,
                            itemBuilder: (context, item) => FieldItem(
                              child: Text(
                                item,
                                //style: TextStyle(fontSize: i == 8 ? 12 : 16),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));
        break;
      case 1: //body mapping
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section5[i]),
                const SizedBox(
                    //height: 80,
                    //width: 500,
                    child: BodyMapping()),
              ],
            ),
          ),
        ));
        break;
      case 6: //text
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            //height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section5[i]),
                SizedBox(
                  //height: 80,
                  //width: 500,
                  child: TextFieldBlocBuilder(
                    keyboardType:
                        i == 3 ? TextInputType.number : TextInputType.text,
                    cursorColor: buttonColor,
                    textFieldBloc: getFieldSection5(formBloc)[i],
                    errorBuilder: (context, error) {
                      return 'Campo Obbligatorio';
                    },
                    decoration: inputStyle,
                  ),
                ),
              ],
            ),
          ),
        ));
        break;
      default:
        late double min;
        late double max;
        String minLabel = '';
        String maxLabel = '';

        switch (i) {
          case 7:
            min = 0;
            max = 10;
            minLabel = '0%';
            maxLabel = '100%';
            break;
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
            min = 0;
            max = 10;
            minLabel = '0 Non interferisce';
            maxLabel = '10 Interferisce completamente';
            break;
          default:
            min = 0;
            max = 10;
            minLabel = '0 Nessun dolore';
            maxLabel = '10 Il dolore più forte immaginabile';
        }
        questions.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
              //height: 300,
              child: GetBuilder<FormController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 8)
                  const SizedBox(
                    height: 10,
                  ),
                if (i == 8)
                  const Text(
                    section5q9Title,
                    style: contentStyle,
                  ),
                Text(section5[i]),
                Slider(
                  activeColor: buttonColor,
                  inactiveColor: Colors.grey,
                  thumbColor: buttonColor,
                  value:
                      double.parse(controller.section5SliderValue['${i + 1}']!),
                  max: max,
                  min: min,
                  onChanged: (value) {
                    

                    //0-10%
                    if(i == 7) {
                     
                      String plus10 = (int.parse(value.toStringAsFixed(0))*10).toString();
                       getFieldSection5(formBloc)[i]
                        .updateValue(plus10);
                      controller.setSection5SliderValue(
                        i, value.toStringAsFixed(0));
                    } else {
                      getFieldSection5(formBloc)[i]
                        .updateValue(value.toStringAsFixed(0));

                      controller.setSection5SliderValue(
                        i, value.toStringAsFixed(0));
                    }
                    
                  },
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Text(minLabel),
                        const Spacer(),
                        Text(maxLabel)
                      ],
                    ),
                    Center(
                      child: Builder(builder: (context) {
                        var text = '';
                        if(i == 7) {
                          text = (int.parse(controller.section5SliderValue['${i + 1}']!)*10).toString();
                        } else {
                          text = controller.section5SliderValue['${i + 1}']!;
                        }
                        

                        return CircleAvatar(
                            backgroundColor: buttonColor,
                            child: Text(
                              text,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }),
                    ),
                  ],
                )
              ],
            );
          })),
        ));
    }
  }

  return FormBlocStep(
      title: const Text(''),
      content: SingleChildScrollView(
          controller: controller.scrollController5,
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SelectableText(
                    section5Title,
                    style: titleStyle,
                  ),
                  const SelectableText(
                    section5Subtitle,
                    style: contentStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...questions
                ],
              ))));
}

FormBlocStep stepSix(
    PainFormBloc formBloc, BuildContext context, FormController controller) {
  List<Widget> questions = [];

  for (int i = 0; i < section6.length; i++) {
    //radio

    questions.add(Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        //height: 150,
        child: responsive.ResponsiveRowColumn(
          layout: responsive.ResponsiveWrapper.of(context)
                  .isSmallerThan(responsive.TABLET)
              ? responsive.ResponsiveRowColumnType.COLUMN
              : responsive.ResponsiveRowColumnType.COLUMN,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (i == 1 || i == 3 || i == 5 || i == 8)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                    width: Get.size.width,
                    child: const SizedBox(
                      height: 10,
                    ),
                  )),
            if (i == 1)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                      width: Get.size.width,
                      child: const Text(
                        section6label1,
                        style: contentStyle,
                      ))),
            if (i == 3)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                      width: Get.size.width,
                      child: const Text(
                        section6label2,
                        style: contentStyle,
                      ))),
            if (i == 5)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                      width: Get.size.width,
                      child: const Text(
                        section6label3,
                        style: contentStyle,
                      ))),
            if (i == 8)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                      width: Get.size.width,
                      child: const Text(
                        section6label4,
                        style: contentStyle,
                      ))),
            if (i == 1 || i == 3 || i == 5 || i == 8)
              responsive.ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                    width: Get.size.width,
                    child: const SizedBox(
                      height: 10,
                    ),
                  )),
            responsive.ResponsiveRowColumnItem(
                rowFlex: 1,
                child:
                    SizedBox(width: Get.size.width, child: Text(section6[i]))),
            responsive.ResponsiveRowColumnItem(
              rowFlex: 1,
              child: responsive.ResponsiveWrapper.of(context)
                      .isSmallerThan(responsive.TABLET)
                  ? SizedBox(
                      //height: 120,
                      //width: 400,
                      child: RadioButtonGroupFieldBlocBuilder<Score>(
                        selectFieldBloc: getFieldSection6(formBloc)[i],
                        errorBuilder: (context, error) {
                          return 'Campo Obbligatorio';
                        },
                        fillColor: MaterialStateProperty.all(buttonColor),
                        decoration: inputStyle,
                        itemBuilder: (context, item) => FieldItem(
                          child: Text(
                            item.label!,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 120,
                      //width: 400,
                      child: RadioButtonGroupFieldBlocBuilder<Score>(
                        groupStyle: const FlexGroupStyle(
                            //textDirection: TextDirection.rtl,
                            direction: Axis.horizontal),
                        selectFieldBloc: getFieldSection6(formBloc)[i],
                        errorBuilder: (context, error) {
                          return 'Campo Obbligatorio';
                        },
                        fillColor: MaterialStateProperty.all(buttonColor),
                        decoration: rowInputStyle,
                        itemBuilder: (context, item) => FieldItem(
                          child: Text(
                            item.label!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    ));
  }

  return FormBlocStep(
    title: Container(),
    //state: StepState.indexed,
    content: SingleChildScrollView(
      controller: controller.scrollController6,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SelectableText(
              section6Title,
              style: titleStyle,
            ),
            const SelectableText(
              section6Subtitle,
              style: contentStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions
          ],
        ),
      ),
    ),
  );
}

//check if string is int
bool isInt(String? s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

//custom formatter to get month and year
class CustomFormatter extends TextInputFormatter {
  final String sample;
  final String separator;

  CustomFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text} $separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
