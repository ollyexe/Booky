import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

import '../../MainPages/SubjectEntry/ProfessorCardS.dart';

class profSelectedSubj extends StatefulWidget {
  String subj;
  profSelectedSubj(this.subj,{Key? key}) : super(key: key);

  @override
  State<profSelectedSubj> createState() => _profSelectedSubjState();
}

class _profSelectedSubjState extends State<profSelectedSubj> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholderBack, myText("Scegli il professore", 20, Theme.of(context).colorScheme.onPrimary, FontWeight.w500), 60,context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<List<ProfCard>>(
          future:getProfBySubj(widget.subj).then((value) => professorFromJson(value)),
          builder: (BuildContext context,AsyncSnapshot<List<ProfCard>> snapshot){

            if(snapshot.hasData){
              return (snapshot.hasData ? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(

                      snapshot.data!.length,
                          (index) =>
                          profCardS(context,snapshot.data![index],widget.subj)
                  )
              ) : const CircularProgressIndicator());
            }
            else {
              return const CircularProgressIndicator();
            }
          },
        ),
      )
      ,
    );
  }
}


Future<String> getProfBySubj(String subject) async{

  Response response = await get(Uri.parse("http://192.168.1.15:9999/servlet_war_exploded/apiUtente?path=getDocByCorso&corso=$subject"));
  if (response.statusCode == 200) {



    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}