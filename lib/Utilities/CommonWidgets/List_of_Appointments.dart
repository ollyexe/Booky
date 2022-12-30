import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';
import 'CommonStyles.dart';





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
                  //height: 130,
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
                            myText("Prof ${widget.list[index].name} ${widget.list[index].surname}", 17, Colors.black, FontWeight.w500),
                          ],
                        ),
                        collapsed: Padding(
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
                                    myText("${widget.list[index].rating}", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                                    const Icon(Icons.star,color: Colors.white,size: 18)],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  containerSingleLecture("${widget.list[index].date.hour}:${widget.list[index].date.minute} - ${widget.list[index].date.hour+1}:${widget.list[index].date.minute}", Colors.blue),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: containerSingleLecture("${widget.list[index].date.day}/${widget.list[index].date.month}/${widget.list[index].date.year}", Colors.purple),
                                  )
                                ],
                              ),
                              const SizedBox(width: 25),
                              myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
                            ],
                          ),
                        ),
                        expanded:Column(
                          children: [
                            Padding(
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
                                        myText("${widget.list[index].rating}", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                                        const Icon(Icons.star,color: Colors.white,size: 18)],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      containerSingleLecture("${widget.list[index].date.hour}:${widget.list[index].date.minute} - ${widget.list[index].date.hour+1}:${widget.list[index].date.minute}", Colors.blue),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                        child: containerSingleLecture("${widget.list[index].date.day}/${widget.list[index].date.month}/${widget.list[index].date.year}", Colors.purple),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 25),
                                  myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
                                ],
                              ),
                            ),
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

/*
class ListOfLectures extends StatefulWidget {
  bool expand;
  List<Lecture> list;
  ListOfLectures(this.list,this.expand,{Key? key}) : super(key: key);

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
            return SingleLecture(widget.expand,widget.list[index]);
          },
        ),
      )
    );
  }
}
 */






