import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_testing/theme/app_theme_widget.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EquatableDemo extends StatefulWidget {
  const EquatableDemo({super.key});

  @override
  State<EquatableDemo> createState() => _EquatableDemoState();
}

class _EquatableDemoState extends State<EquatableDemo> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      backgroundColor: appTheme.colors.secondaryBackground,
      appBar: const GTAppBar(
        title: GTText(
          'Equatable Demo',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      //body: const GT('Equatable Demo'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Student student = Student(name: 'Kaleem', grade: '16');
          Student student1 = Student(name: 'Kaleem', grade: '16');

          print(student ==
              student1); //it should be true, but without equatable it will
          //false

          print(student == student);


        },
        tooltip: 'Press',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class Student extends Equatable {
  final String name;
  final String grade;

  const Student({required this.name, required this.grade});

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    grade,
  ];



}
