part of 'app_pages.dart';

abstract class Routes {
  static const HOME = '/home';
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
  static const MEDICINE = '/medicine';
  static const MEDICINE_FORM = '/medicine/form';
  static const PREGNANCY_DIAGNOSIS = '/pregnancy-diagnosis';
  static const PREGNANCY_DIAGNOSIS_FORM = '/pregnancy-diagnosis/form';
  static const SALE = '/sale';
  static const SALE_FORM = '/sale/form';
  static const PURCHASE = '/purchase';
  static const PURCHASE_FORM = '/purchase/form';

  //Rotas módulo vegetable
  static const VEGETABLE_DISEASE = '/vegetable-disease';
  static const VEGETABLE_DISEASE_FORM = '/vegetable-disease/form';
}
