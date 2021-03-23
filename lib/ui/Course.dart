import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Course.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class CourseWidget extends StatefulWidget {
  @required
  final String day;
  @required
  final List<Course> courses;

  CourseWidget({Key key, this.day, this.courses}) : super(key: key);

  @override
  _CourseWidget createState() => _CourseWidget();
}

class _CourseWidget extends State<CourseWidget> {
  double borderRadius = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius))),
                child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.day,
                            style: TextStyle(
                                color: Colors.white, fontSize: 20))))),
            Column(
              children: Conditional.list(
                context: context,
                conditionBuilder: (BuildContext context) => widget.courses.length != 0,
                widgetBuilder: (BuildContext context) => <Widget>[
                  for (var course in widget.courses)
                    CourseItemWidget(course: course),
                ],
                fallbackBuilder: (BuildContext context) => <Widget>[EmptyCourses()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Course Item Widget (Statefulwidget)
class CourseItemWidget extends StatefulWidget {
  final Course course;

  CourseItemWidget({Key key, this.course}) : super(key: key);

  @override
  _CourseItemWidget createState() => _CourseItemWidget();
}

class _CourseItemWidget extends State<CourseItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Padding(
          padding: EdgeInsets.only(bottom: 7),
          child: Text(widget.course.name,
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        subtitle: Wrap(
          spacing: 20.0,
          children: [
            Wrap(
              spacing: 4.0,
              children: [
                Icon(Icons.schedule_outlined,
                    color: Theme.of(context).primaryColor, size: 17),
                Text(widget.course.time)
              ],
            ),
            Wrap(
              spacing: 4.0,
              children: [
                Icon(Icons.meeting_room_outlined,
                    color: Theme.of(context).primaryColor, size: 17),
                Text(widget.course.number_lab)
              ],
            ),
            Wrap(
              spacing: 4.0,
              children: [
                Icon(Icons.computer_outlined,
                    color: Theme.of(context).primaryColor, size: 17),
                Text(widget.course.computer)
              ],
            )
          ],
        ));
  }
}

// Empty Courses Widget (StatelessWidget)
class EmptyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
              color: Color(0xFFD9EDF7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5))),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontSize: 14.0, color: Color(0xFF31708F)),
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.info,
                      size: 14,
                      color: Color(0xFF31708F),
                    ),
                  ),
                  TextSpan(
                      text: ' Info! ',
                      style:
                      TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Schedule at this day not found.'),
                ],
              ),
            ),
          )),
    );
  }
}