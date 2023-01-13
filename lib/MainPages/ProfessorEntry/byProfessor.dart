import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/ProfessorEntry/ProfessorCardP.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

class byProfessor extends StatefulWidget {

  byProfessor({Key? key}) : super(key: key);

  @override
  State<byProfessor> createState() => _byProfessorState();
}

class _byProfessorState extends State<byProfessor> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholderBack, myText("Scegli il professore", 20, Theme.of(context).colorScheme.onPrimary, FontWeight.w500), 60,context),
      body: Padding(
          padding: const EdgeInsets.all(6.0),
           child: FutureBuilder<List<ProfCard>>(
             future:getAllDocenti().then((value) => professorFromJson(value)),
             builder: (BuildContext context,AsyncSnapshot<List<ProfCard>> snapshot){

               if(snapshot.hasData){
                 return (snapshot.hasData ? GridView.count(
                     crossAxisCount: 2,
                     children: List.generate(

                         snapshot.data!.length,
                             (index) =>
                             profCard(context,snapshot.data![index])
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
