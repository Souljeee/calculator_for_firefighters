import 'package:flutter/material.dart';
import 'package:platon_calc/forms/air_foam_value_form.dart';
import 'package:platon_calc/forms/departments_count_form.dart';
import 'package:platon_calc/forms/feed_intensit_form.dart';
import 'package:platon_calc/forms/fire_square_form.dart';
import 'package:platon_calc/forms/foam_count_form.dart';
import 'package:platon_calc/forms/foam_form.dart';
import 'package:platon_calc/forms/foam_from_generator_form.dart';
import 'package:platon_calc/forms/following_time_form.dart';
import 'package:platon_calc/forms/free_fire_development_time_form.dart';
import 'package:platon_calc/forms/gps_count_for_square_form.dart';
import 'package:platon_calc/forms/gps_count_for_volume_form.dart';
import 'package:platon_calc/forms/liquidation_form.dart';
import 'package:platon_calc/forms/npr_count_form.dart';
import 'package:platon_calc/forms/required_consumption_form.dart';
import 'package:platon_calc/forms/solution_volume_form.dart';
import 'package:platon_calc/forms/step_count_form.dart';
import 'package:platon_calc/forms/stock_trunks_time_form.dart';
import 'package:platon_calc/forms/transport_destination_form.dart';
import 'package:platon_calc/forms/trunks_count_form.dart';
import 'package:platon_calc/forms/trunks_time_form.dart';
import 'package:platon_calc/formula_data.dart';

const formulList = [
  FormulaData(
    title: 'Время свободного развития пожара',
    formulaForm: FreeFireDevelopmentTimeForm(),
    iconLetter: 't',
  ),
  FormulaData(
    title: 'Время следования к месту вызова',
    formulaForm: FollowingTimeForm(),
    iconLetter: 't',
  ),
  FormulaData(
    title: 'Фактическая интенсивность подачи ОВ',
    formulaForm: FeedIntensityForm(),
    iconLetter: 'P',
  ),
  FormulaData(
    title: 'Площадь пожара при круговой форме развития',
    formulaForm: FireSquareForm(),
    iconLetter: 'S',
  ),
  FormulaData(
    title: 'Требуемый расход ОВ для ликвидации пожара',
    formulaForm: RequiredConsumptionForm(),
    iconLetter: 'Q',
  ),
  FormulaData(
    title: 'Объем помещения, которое можно заполнить пеной средней кратности',
    formulaForm: FoamForm(),
    iconLetter: 'W',
  ),
  FormulaData(
      title:
          'Объем помещения, которое можно заполнить пеной средней кратности, подаваемой генераторами пены',
      formulaForm: FoamFromGeneratorForm(),
      iconLetter: 'W'),
  FormulaData(
    title: 'Количество ГПС требуемое для ликвидации горения',
    formulaForm: GPSCountForSquareForm(),
    iconLetter: 'N',
  ),
  FormulaData(
    title: 'Количество ГПС необходимое для заполнения объема помещения',
    formulaForm: GpsCountForVolumeForm(),
    iconLetter: 'N',
  ),
  FormulaData(
    title: 'Требуемое количество пенообразователя для формирования пены',
    formulaForm: FoamCountForm(),
    iconLetter: 'W',
  ),
  FormulaData(
    title: 'Требуемое количество стволов на пожаре',
    formulaForm: TrunksCountForm(),
    iconLetter: 'N',
  ),
  FormulaData(
    title: 'Возможная площадь ликвидации горения ЛВЖ и ГЖ пеной',
    formulaForm: LiquidationForm(),
    iconLetter: 'S',
  ),
  FormulaData(
    title: 'Объем раствора, который можно получить из пенообразователя',
    formulaForm: SolutionVolumeForm(),
    iconLetter: 'W',
  ),
  FormulaData(
    title: 'Объем воздушно-механической пены, получаемый из раствора',
    formulaForm: AirFoamVolumeForm(),
    iconLetter: 'W',
  ),
  FormulaData(
    title: 'Время работы стволов при расходовании воды из емкости МСП',
    formulaForm: TrunksTimeForm(),
    iconLetter: 't',
  ),
  FormulaData(
    title: 'Время работы стволов по запасу ПО',
    formulaForm: StockTrunksTimeForm(),
    iconLetter: 't',
  ),
  FormulaData(
    title: 'Количество НПР в рукавной линии',
    formulaForm: NPRCountForm(),
    iconLetter: 'N',
  ),
  FormulaData(
    title: 'Количество ступеней перекачки',
    formulaForm: StepCountForm(),
    iconLetter: 'N',
  ),
  FormulaData(
    title: 'Предельное расстояние транспортировки ОВ насосной установки МСП',
    formulaForm: TransportDestinationForm(),
    iconLetter: 'L',
  ),
  FormulaData(
    title: 'Количество отделений на ликвидации горения',
    formulaForm: DepartmentsCountForm(),
    iconLetter: 'N',
  ),
];
