import 'package:flutter/material.dart';
import 'package:platon_calc/forms/free_fire_development_time_form/free_fire_development_time_form.dart';
import 'package:platon_calc/formula_data.dart';

final formulList = [
  FormulaData(
    title: 'Время свободного развития пожара',
    formulaForm: FreeFireDevelopmentTimeForm(),
    iconLetter: 't'
  ),
  FormulaData(
    title: 'Время следования к месту вызова',
    formulaForm: Container(),
      iconLetter: 't'
  ),
  FormulaData(
    title: 'Фактическая интенсивность подачи ОВ',
    formulaForm: Container(),
      iconLetter: 'P'
  ),
  FormulaData(
    title: 'Площадь пожара при круговой форме развития',
    formulaForm: Container(),
      iconLetter: 'S'
  ),
  FormulaData(
    title: 'Требуемый расход ОВ для ликвидации пожара',
    formulaForm: Container(),
      iconLetter: 'Q'
  ),
  FormulaData(
    title: 'Объем помещения, которое можно заполнить пеной средней кратности',
    formulaForm: Container(),
      iconLetter: 'W'
  ),
  FormulaData(
    title: 'Объем помещения, которое можно заполнить пеной средней кратности, подаваемой генераторами пены',
    formulaForm: Container(),
      iconLetter: 'W'
  ),
  FormulaData(
    title: 'Количество ГПС требуемое для ликвидации горения',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
  FormulaData(
    title: 'Количество ГПС необходимое для заполнения объема помещения',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
  FormulaData(
    title: 'Требуемое количество пенообразователя для формирования пены',
    formulaForm: Container(),
      iconLetter: 'W'
  ),
  FormulaData(
    title: 'Требуемое количество стволов на пожаре',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
  FormulaData(
    title: 'Возможная площадь ликвидации горения ЛВЖ и ГЖ пеной',
    formulaForm: Container(),
      iconLetter: 'S'
  ),
  FormulaData(
    title: 'Объем раствора, который можно получить из пенообразователя',
    formulaForm: Container(),
      iconLetter: 'W'
  ),
  FormulaData(
    title: 'Объем воздушно-механической пены, получаемый из раствора',
    formulaForm: Container(),
      iconLetter: 'W'
  ),
  FormulaData(
    title: 'Время работы стволов при расходовании воды из емкости МСП',
    formulaForm: Container(),
      iconLetter: 't'
  ),
  FormulaData(
    title: 'Время работы стволов по запасу ПО',
    formulaForm: Container(),
      iconLetter: 't'
  ),
  FormulaData(
    title: 'Количество НПР в рукавной линии',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
  FormulaData(
    title: 'Количество ступеней перекачки',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
  FormulaData(
    title: 'Предельное расстояние транспортировки ОВ насосной установки МСП',
    formulaForm: Container(),
      iconLetter: 'L'
  ),
  FormulaData(
    title: 'Количество отделений на ликвидации горения',
    formulaForm: Container(),
      iconLetter: 'N'
  ),
];