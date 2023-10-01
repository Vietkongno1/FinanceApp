import 'package:financeapp/src/data/listdata.dart';

List<money> getter(){
  money upwork = money();
  upwork.name = "upwork";
  upwork.fee = "\$659";
  upwork.image = 'Transfer.png';
  upwork.time = 'today';
  upwork.buy = false;

  money food = money();
  food.buy = true;
  food.image = 'food.png';
  food.fee = '\$15';
  food.time = 'today';
  food.name = 'food';

  money trasfer = money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'Transportation.png';
  trasfer.name = 'trasfer for sam';
  trasfer.time = 'jan 30,2022';

  return[upwork, food, trasfer, upwork, food, trasfer, upwork, food, trasfer];
}