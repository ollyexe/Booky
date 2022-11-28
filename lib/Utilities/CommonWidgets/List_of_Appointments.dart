import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';
import 'CommonStyles.dart';

class ListOfLectures extends StatefulWidget {
  final Widget bottomPart;
  final Widget topIcon;
  final bool expand;
  const ListOfLectures(this.bottomPart,this.topIcon,this.expand,{Key? key}) : super(key: key);

  @override
  State<ListOfLectures> createState() => _ListOfLecturesState();
}

class _ListOfLecturesState extends State<ListOfLectures> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll){
          overscroll.disallowIndicator();
          return true;
        },
        child: ListView.separated(
          separatorBuilder: (context, index) => space,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,int index){
            return SingleLecture("Matteo","Barone","Matematica",widget.bottomPart,widget.topIcon,widget.expand);
          },
        ),
      )
    );
  }
}






