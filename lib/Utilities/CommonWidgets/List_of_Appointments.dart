import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../NavigationBar/Cart.dart';
import 'CommonStyles.dart';

class ListForConfirmation extends StatefulWidget {
  List<Lecture> list;
  ListForConfirmation(this.list,{Key? key}) : super(key: key);

  @override
  State<ListForConfirmation> createState() => _ListForConfirmationState();
}

class _ListForConfirmationState extends State<ListForConfirmation> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: _key,
        initialItemCount: 0,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    //border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          Column(
                            children: [
                              myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.w500),
                              myText(widget.list[index].subject, 15, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.normal)
                            ],
                          ),
                          IconButton(
                              icon:  const Icon(
                                Icons.star,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              onPressed: () {

                              }
                          )
                        ],
                      ),
                      topWidget(widget.list[index], context)
                    ],
                  ),
                ),
                space
              ],
            ),
          );
        },
      ),
    );
  }
}


class ListForCart extends StatefulWidget {

  List<Lecture> list;

  ListForCart(this.list,{Key? key}) : super(key: key);

  @override
  State<ListForCart> createState() => _ListForCartState();
}

class _ListForCartState extends State<ListForCart> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _removeItem(int i){
    _key.currentState!.removeItem(
      i, (context, animation){
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: myText("Deleted", 24, Colors.black, FontWeight.normal),
          ),
        ),
      );
    },
      duration: const Duration(milliseconds: 300),
    );
    widget.list.removeAt(i);
  }

  List<Lecture> cart = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: _key,
        initialItemCount: widget.list.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    //border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          Column(
                            children: [
                              myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.w500),
                              myText(widget.list[index].subject, 15, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.normal)
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon:  Icon(
                                  Icons.delete,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                onPressed: () async{
                                  //api to add
                                  if(await SessionManager().containsKey("cart_list")){

                                    String json =await (SessionManager().get("cart_list"));
                                    print(json);
                                    cart =  lectureFromJson(json);


                                    cart.removeAt(index);
                                    await SessionManager().set("cart_list",lecturesToJson(cart));
                                    print(cart.length);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Cart()));
                                  }

                                  _removeItem(index);
                                  setState(() {

                                  });
                                  print(await SessionManager().get("cart_list"));
                                }
                              ),
                            ],
                          )
                        ],
                      ),
                      topWidget(widget.list[index], context)
                    ],
                  ),
                ),
                space
              ],
            ),
          );
        },
      ),
    );
  }
}


class ListOfLectures extends StatefulWidget {
  List<Lecture> list;

  ListOfLectures(this.list,{Key? key}) : super(key: key);

  @override
  State<ListOfLectures> createState() => _ListOfLecturesState();
}

class _ListOfLecturesState extends State<ListOfLectures> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _removeItem(int i){
    _key.currentState!.removeItem(
      i, (context, animation){
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: const EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: myText("Deleted", 24, Colors.black, FontWeight.normal),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    widget.list.removeAt(i);
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: _key,
        initialItemCount: widget.list.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context,index,animation){
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    //border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: ExpandableNotifier(
                    initialExpanded: false,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: true,
                      child: ExpandablePanel(
                        header: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: widget.list[index].image,
                              radius: 25,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.w500),
                                myText(widget.list[index].subject, 15, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.normal)
                              ],
                            )
                          ],
                        ),
                        collapsed: topWidget(widget.list[index], context),
                        expanded:Column(
                          children: [
                            topWidget(widget.list[index], context ),
                            const SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  iconSize: 40,
                                  onPressed: () async {
                                    await launchUrl(
                                        Uri.parse('https://calendar.google.com/calendar/u/0/r/eventedit?text=Lezione+di+${widget.list[index].subject}+con+${widget.list[index].name}+${widget.list[index].surname}&dates=${widget.list[index].date.replaceAll(new RegExp(r'[^\w\s]+'),'')}T${widget.list[index].time.replaceAll(new RegExp(r'[^\w\s]+'),'')}00/${widget.list[index].date.replaceAll(new RegExp(r'[^\w\s]+'),'')}T${int.parse(widget.list[index].time.replaceAll(new RegExp(r'[^\w\s]+'),''))+100}00Z&details=zoom.com/random_reunion&location=Metaverso&sf=true&output=xml'),mode: LaunchMode.externalApplication);
                                  },
                                  icon: const Icon(Icons.calendar_month_rounded,color: Colors.green),
                                ),
                                IconButton(
                                  iconSize: 40,
                                  onPressed: () async{

                                    _removeItem(index);
                                  },
                                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ),
                space
              ],
            )
          );
        },
      ),
    );
  }
}

class ListForSubject extends StatefulWidget {
  List<Lecture> list;

  ListForSubject(this.list,{Key? key}) : super(key: key);

  @override
  State<ListForSubject> createState() => _ListForSubjectState();
}



class _ListForSubjectState extends State<ListForSubject> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _additem(int i){
    _key.currentState!.removeItem(
      i, (context, animation){
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.green,
          child: ListTile(
            title: myText("Added To Cart", 24, Colors.black, FontWeight.normal),
          ),
        ),
      );
    },
      duration: const Duration(milliseconds: 300),
    );
    widget.list.removeAt(i);
  }

  List<Lecture> cart=[];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: _key,
            initialItemCount: widget.list.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        //border: Border.all(color: Colors.black26, width: 1),
                      ),
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: widget.list[index].image,
                                radius: 25,
                              ),
                              Column(
                                children: [
                                  myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.w500),
                                  myText(widget.list[index].subject, 15, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.normal)
                                ],
                              ),
                              IconButton(
                                  icon:  const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () async{
                                    //api to add
                                    if(await SessionManager().containsKey("cart_list")){

                                      String json =await (SessionManager().get("cart_list"));
                                      print(json);
                                      cart =  lectureFromJson(json);


                                      cart.add(widget.list[index]);
                                      await SessionManager().set("cart_list",lecturesToJson(cart));
                                      print(cart.length);
                                    }
                                    else{
                                      List<Lecture> l =[];
                                      l.add(widget.list[index]);
                                      await SessionManager().set("cart_list",lecturesToJson(l));
                                    }
                                    _additem(index);

                                    print(await SessionManager().get("cart_list"));
                                  }
                              )
                            ],
                          ),
                          topWidget(widget.list[index], context)
                        ],
                      ),
                    ),
                    space
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget topWidget(Lecture lecture, BuildContext context){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
    child: Row(
      children: [
        Container(
          decoration:BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(7)
          ),
          child: Row(
            children: [
              Icon(Icons.star,color: Theme.of(context).colorScheme.onSecondaryContainer,size: 18),
              myText("${lecture.rating}", 15, Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.6), FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
            ],
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            containerSingleLecture("${lecture.time}", Theme.of(context).colorScheme.tertiaryContainer, context),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: containerSingleLecture("${lecture.date}", Theme.of(context).colorScheme.tertiaryContainer, context),
            )
          ],
        ),
        const SizedBox(width: 40),
      ],
    ),
  );
}


Future<String> getNextLezioniPrenotate(String prof) async{

  Response response = await get(Uri.parse("http://192.168.1.15:9999/servlet_war_exploded/apiLezione?path=annullaLezione&docente=barbero@gmail.com&data=2022-11-29&ora=16:00"));


  if (response.statusCode == 200) {





    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}







