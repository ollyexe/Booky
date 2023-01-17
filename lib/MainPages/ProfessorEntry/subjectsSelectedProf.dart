import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/ProfessorEntry/SubjectCardP.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

class subjectsSelectedProf extends StatefulWidget {
  String prof;
  subjectsSelectedProf(this.prof,{Key? key}) : super(key: key);

  @override
  State<subjectsSelectedProf> createState() => _subjectsSelectedProfState();
}

class _subjectsSelectedProfState extends State<subjectsSelectedProf> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholderBack, myText("Scegli la materia", 20, Theme.of(context).colorScheme.onPrimary, FontWeight.w500), 60,context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<Subjects>(
          future:getSubjectByDoc(widget.prof).then((value) => subjectsFromJson(value)),
          builder: (BuildContext context,AsyncSnapshot<Subjects> snapshot){


            if(snapshot.hasData){
              return (snapshot.hasData ? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(

                      snapshot.data!.corsi.length,
                          (index) => subCardP(context, snapshot.data!.corsi[index],widget.prof)
                  )
              ) :CircularProgressIndicator());

            }
            else {
              return CircularProgressIndicator();
            }





          },
        ),
      )
      ,
    );
  }
}
