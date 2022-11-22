import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';
import 'CommonStyles.dart';

class ListOfLectures extends StatefulWidget {
  const ListOfLectures(Widget myWidget,{Key? key}) : super(key: key);

  @override
  State<ListOfLectures> createState() => _ListOfLecturesState();
}

class _ListOfLecturesState extends State<ListOfLectures> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


Widget listOfSomething(BuildContext context, Widget widget){
  return Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) => space,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      //shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context,int index){
        return SingleLecture(widget,"Matteo","Barone","Matematica");
      },
    )
  );
}

