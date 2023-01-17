import 'package:flutter/material.dart';

import '../../MainPages/SubjectEntry/ProfessorCardS.dart';
import '../../Model/Client_API.dart';
import '../../Model/ProfCard.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

class profSelectedSubj extends StatefulWidget {
  String subj;
  profSelectedSubj(this.subj, {Key? key}) : super(key: key);

  @override
  State<profSelectedSubj> createState() => _profSelectedSubjState();
}

class _profSelectedSubjState extends State<profSelectedSubj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(
          placeholderBack,
          myText("Scegli il professore", 20,
              Theme.of(context).colorScheme.onPrimary, FontWeight.w500),
          60,
          context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<List<ProfCard>>(
          future: Client_API()
              .getProfBySubj(widget.subj)
              .then((value) => professorFromJson(value)),
          builder:
              (BuildContext context, AsyncSnapshot<List<ProfCard>> snapshot) {
            if (snapshot.hasData) {
              return (snapshot.hasData
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => profCardS(
                              context, snapshot.data![index], widget.subj)))
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
