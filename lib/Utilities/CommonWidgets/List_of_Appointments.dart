import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';
import 'CommonStyles.dart';



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
                    color: Colors.white,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          const SizedBox(width: 20),
                          myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Colors.black, FontWeight.w500),
                          const SizedBox(width: 35),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              size: 40,
                              color: Color(0xFFFF0000),
                            ),
                            onPressed: () => _removeItem(index),
                          )
                        ],
                      ),
                      topWidget(widget.list[index])
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
                    color: Colors.white,
                    border: Border.all(color: Colors.black26, width: 1),
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
                            myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 19, Colors.black, FontWeight.w500),
                          ],
                        ),
                        collapsed: topWidget(widget.list[index]),
                        expanded:Column(
                          children: [
                            topWidget(widget.list[index]),
                            const SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  iconSize: 40,
                                  onPressed: () {},
                                  icon: const Icon(Icons.calendar_month_rounded,color: Colors.green),
                                ),
                                IconButton(
                                  iconSize: 40,
                                  onPressed: () => _removeItem(index),
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                )
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



Widget topWidget(Lecture lecture){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
    child: Row(
      children: [
        Container(
          decoration:BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(7)
          ),
          child: Row(
            children: [
              myText("${lecture.rating}", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
              const Icon(Icons.star,color: Colors.white,size: 18)],
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            containerSingleLecture("${lecture.date.hour}:${lecture.date.minute} - ${lecture.date.hour+1}:${lecture.date.minute}", Colors.blue),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: containerSingleLecture("${lecture.date.day}/${lecture.date.month}/${lecture.date.year}", Colors.purple),
            )
          ],
        ),
        const SizedBox(width: 35),
        myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
      ],
    ),
  );
}



