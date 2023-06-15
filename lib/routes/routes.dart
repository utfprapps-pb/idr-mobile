part of 'app_pages.dart';

abstract class Routes {
  static const HOME = '/home';
  static const SYNC = '/sync';
  static const FORCED_SYNC = '/forced-sync';
  static const DEFAULT_SYNC = '/forced-default';
  static const LOGIN = '/login';
  static const PROPERTY = '/property';

  //Rotas módulo animal
  static const ANIMAL = '/animals';
  static const ANIMAL_FORM = '/animals/form';
  static const INSEMINATION = '/insemination';
  static const INSEMINATION_FORM = '/insemination/form';
  static const MASTITIS = '/mastitis';
  static const MASTITIS_FORM = '/mastitis/form';
  static const DISEASE_ANIMAL = '/disease-animal';
  static const DISEASE_ANIMAL_FORM = '/disease-animal/form';
  static const MEDICATION = '/medication';
  static const MEDICATION_FORM = '/medication/form';
  static const PREGNANCY_DIAGNOSIS = '/pregnancy-diagnosis';
  static const PREGNANCY_DIAGNOSIS_FORM = '/pregnancy-diagnosis/form';
  static const SALE = '/sale';
  static const SALE_FORM = '/sale/form';
  static const PURCHASE = '/purchase';
  static const PURCHASE_FORM = '/purchase/form';

  //Rotas módulo vegetable
  static const VEGETABLE_DISEASE = '/vegetable-disease';
  static const VEGETABLE_DISEASE_FORM = '/vegetable-disease/form';
  static const VEGETABLE_PLAGUE = '/vegetable-plague';
  static const VEGETABLE_PLAGUE_FORM = '/vegetable-plague/form';
}
