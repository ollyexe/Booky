import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../Utilities/CommonWidgets/List_of_Appointments.dart';
import '../../Model/Lecture.dart';

class appointmentsBySubjectAndByProf extends StatefulWidget {
  String prof;
  String subject;
  appointmentsBySubjectAndByProf(this.prof,this.subject,{Key? key}) : super(key: key);

  @override
  State<appointmentsBySubjectAndByProf> createState() => _appointmentsBySubjectAndByProfState();
}

class _appointmentsBySubjectAndByProfState extends State<appointmentsBySubjectAndByProf> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholderBack, myText("Scegli la lezione", 20, Theme.of(context).colorScheme.onPrimary, FontWeight.w500), 60,context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<List<Lecture>>(
          future: getLBDoc(widget.prof,widget.subject).then((value) => lectureFromJson(value)),
          builder: (BuildContext context,AsyncSnapshot<List<Lecture>> snapshot){
            if(snapshot.hasData) {
              return ( snapshot.hasData ?  ListForSubject(snapshot.data!) : const CircularProgressIndicator());
            }
            return const CircularProgressIndicator();

          },
        ),
      )
      ,
    );
  }
}

Future<String> getLBDoc(String email,String subject) async{

  Response response = await get(Uri.parse("http://172.20.10.11:9999/servlet_war_exploded/apiLezione?path=getLezioniByDocenteAndCorso&docente=$email&corso=$subject"));
  if (response.statusCode == 200) {



    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}
