import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import '../Utilities/CommonWidgets/SingleLecture.dart';
import 'package:http/http.dart';

var textColors = [Colors.black,Colors.white];
var containerColors = [Colors.white,Colors.purple];


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<bool> isSelected = [false, true];
  final ValueNotifier<int> index= ValueNotifier<int>(1);
//pending = 0
  //confirmed=1













  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(placeholder, myText("Orders", 23, Colors.white, FontWeight.w500),75,context),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.shadow,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(1, 2)
                        ),
                      ]
                  ),
                  child: buttons(),
                ),
                const SizedBox(height: 30),
                CounterBody(counterValueNotifier: index)
               
              ],
            ),
          ),
        )
    );
  }
  Widget buttons(){
    return ToggleButtons(
      onPressed: (int newIndex) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == newIndex;
          }
          index.value = newIndex;
        });
      },
      borderRadius: BorderRadius.circular(5),
      selectedColor: Theme.of(context).colorScheme.onTertiaryContainer,
      fillColor: Theme.of(context).colorScheme.tertiaryContainer,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      highlightColor: Theme.of(context).colorScheme.tertiaryContainer,
      constraints: const BoxConstraints(
        minHeight: 70.0,
        minWidth: 150.0,
      ),
      isSelected: isSelected,
      children: const [
        Text("Pending"),
        Text("Confirmed"),
      ],
    );
  }
}


Future<String> getNextLezioniPrenotate(String login) async{

  Response response = await get(Uri.parse("http://192.168.1.15:9999/servlet_war_exploded/apiLezione?path=getNextLezioniPrenotate&mail=$login"));


  if (response.statusCode == 200) {




    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}

Future<String> getLezioniFinite(String login) async{

  Response response = await get(Uri.parse("http://192.168.1.15:9999/servlet_war_exploded/apiLezione?path=getLezioniFinite&mail=$login"));

  if (response.statusCode == 200) {




    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}




class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
        valueListenable: counterValueNotifier,
        builder: (BuildContext context,int counterValueNotifier, Widget? child){
          try{
            if(counterValueNotifier==0){
              return FutureBuilder<List<Lecture>>(
                future: SessionManager().get("email").then((value) => getNextLezioniPrenotate(value).then((value) => lectureFromJson(value))),
                builder: (BuildContext context,AsyncSnapshot<List<Lecture>> snapshot){
                  if(snapshot.hasData) {
                    return ( snapshot.hasData ?  ListOfLectures(snapshot.data!) : CircularProgressIndicator());
                  } else {
                    return  Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                        child: myText("Non ci sono lezioni ", 20, Colors.red, FontWeight.bold)
                    );
                  }
                },
              );
            }
            else if (counterValueNotifier==1) {
              return FutureBuilder<List<Lecture>>(
                future: SessionManager().get("email").then((value) => getLezioniFinite(value).then((value) => lectureFromJson(value))),
                builder: (BuildContext context,AsyncSnapshot<List<Lecture>> snapshot){
                  if(snapshot.hasData) {
                    return ( snapshot.hasData ?  ListForConfirmation(snapshot.data!) : CircularProgressIndicator());
                  } else {
                    return  Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                        child: myText("Non ci sono lezioni ", 20, Colors.red, FontWeight.bold)
                    );
                  }
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }
          catch(RangeError ){
            return CircularProgressIndicator();
          }


        }
    );
  }
}




