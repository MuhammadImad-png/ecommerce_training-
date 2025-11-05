// // المرحلة الأولى – Dart

// اكتبلي مثال لكلاس User فيه:

// متغيرات (name, age).

// Constructor.

// Method بترجع نص فيه البيانات دي.
// import 'dart:ffi';

// import 'package:meta/meta.dart';

// class User {
//    String name;
//   int Age;
//   User(  {required this.name , required this.Age} );
//   String show() {
//     return (" $name ,$Age ");
//   }
// }

// void main() {
//   User user = User(name:"mohamed", Age :23);
//   User user2 = User(name:"mohamed", Age :23);
//   User user3 = User(name:"mohamed", Age :23);
//   User user4 = User(name:"mohamed", Age :23);
//   user.show();
//   user2.show();
//   user3.show();
//   user4.show();

// }

// لو عندك شاشة فيها ListView بتعرض لستة من المهام (Tasks)، إزاي هتعرضهم بشكل ديناميكي من List<String>؟
// import 'package:vm_service/vm_service.dart';

// void main() {
//   List<int> Task = [1,2,3,4,5,6];

//   for (int num in Task) {
//     if (num % 2 == 0) {
//      print(
//       num
//      );
//     }
//   }

//   print("$Task");
// }

//  اعمل List من الأرقام (مثلاً: 1, 2, 3, 4, 5)، واطبع بس الأرقام الزوجية.

// عندك Map فيها بيانات موظف (name, job, salary)، اطبع البيانات بشكل منظم.
// void main() {
//   final List<Map<String, dynamic>> employee = [
//     {"Name": "Mohad", "jop": "Developer", "Salary": 10000000},
//     {"Name": "Mona", "jop": "Developer", "Salary": 15},
//     {"Name": "Mody", "jop": "Developer", "Salary": 10},
//   ];
//   for (var emp in employee) {
//     print(" Name  : ${emp["name"]},  jop : ${emp["jop"]}, Salary : ${emp["Salary"]} ");
//   }
// }
// اعمل Class اسمها Car فيها (brand, model, year) وخلي فيها method تعرض كل المعلومات.
