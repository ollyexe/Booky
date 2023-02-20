import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/ProfessorEntry/ProfessorCardP.dart';

import '../../Model/Client_API.dart';
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
      appBar: customAppBar(
          arrowBackNoWait,
          myText("Scegli il professore", 20,
              Theme.of(context).colorScheme.onPrimary, FontWeight.w500),
          60,
          context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<List<ProfCard>>(
          future: Client_API()
              .getAllDocenti()
              .then((value) => professorFromJson(value)),
          builder:
              (BuildContext context, AsyncSnapshot<List<ProfCard>> snapshot) {
            if (snapshot.hasData) {
              return (snapshot.hasData
                  ? (snapshot.data!.length!=0? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data!.length,
                          (index) => profCard(context, snapshot.data![index]))):

              Row(
                            mainAxisAlignment:MainAxisAlignment.center ,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      5, 10, 0, 10),
                  child: myText("Non ci sono lezioni", 20, Colors.red,
                      FontWeight.bold)),
                            ],
                          ))
                  : const CircularProgressIndicator());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
