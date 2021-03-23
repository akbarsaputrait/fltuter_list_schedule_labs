import 'package:flutter/material.dart';
import 'package:flutter_app/ui/Course.dart';
import 'package:flutter_app/utils/Course.dart';
import 'package:flutter_app/utils/Schedule.dart';

class BodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Schedule> schedules = [
      Schedule(day: 'Senin', courses: [
        Course(
            name: 'Pemrograman Mobile E',
            time: '13:00 - 14:00',
            number_lab: 'Lab C',
            computer: 'B03'),
      ]),
      Schedule(day: 'Selasa', courses: []),
      Schedule(day: 'Rabu', courses: []),
      Schedule(day: 'Kamis', courses: [
        Course(
            name: 'Sistem Operasi E',
            time: '10:20 - 13:00',
            number_lab: 'Lab C',
            computer: 'B03'),
        Course(
            name: 'Basisdata C',
            time: '13:00 - 14:40',
            number_lab: 'Lab C',
            computer: 'B03'),
        Course(
            name: 'Piranti Cerdas A',
            time: '16:05 - 19:05',
            number_lab: 'Lab C',
            computer: 'B03'),
      ]),
      Schedule(day: 'Jumat', courses: []),
      Schedule(day: 'Sabtu', courses: []),
    ];

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, i) {
            return CourseWidget(day: schedules[i].day, courses: schedules[i].courses);
          },
        ),
      ),
    );
  }
}
