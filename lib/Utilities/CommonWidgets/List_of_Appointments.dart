import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Model/Lecture.dart';

import '../../Model/Client_API.dart';
import '../../NavigationBar/Cart.dart';
import 'CommonStyles.dart';

class ListForRating extends StatefulWidget {
  List<Lecture> list;
  final Function() update;
  ListForRating(this.list, this.update, {Key? key}) : super(key: key);

  @override
  State<ListForRating> createState() => _ListForRatingState();
}

class _ListForRatingState extends State<ListForRating> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double ratingValue = 5.0;

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    size: 18),
                                myText(
                                    "${widget.list[index].rating}",
                                    15,
                                    Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                        .withOpacity(0.6),
                                    FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  myText(
                                      "Prof ${widget.list[index].name} ${widget.list[index].surname}",
                                      19,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.w500),
                                  myText(
                                      widget.list[index].subject,
                                      15,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.normal)
                                ],
                              ),
                              Row(
                                children: [
                                  containerSingleLecture(
                                      widget.list[index].time,
                                      Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                      context),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: containerSingleLecture(
                                        widget.list[index].date,
                                        Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                        context),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          widget.list[index].lRating == 0
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.star,
                                    size: 40,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Thank you for choosing us ",
                                                style: TextStyle(fontSize: 20)),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text("Please",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey)),
                                                myText(
                                                    "Rate the lecture",
                                                    20,
                                                    Colors.black,
                                                    FontWeight.bold),
                                                RatingBar(
                                                    initialRating: 5,
                                                    direction: Axis.horizontal,
                                                    itemCount: 5,
                                                    ratingWidget: RatingWidget(
                                                        full: const Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange),
                                                        half: const Icon(
                                                          Icons.star_half,
                                                          color: Colors.orange,
                                                        ),
                                                        empty: const Icon(
                                                          Icons.star_outline,
                                                          color: Colors.orange,
                                                        )),
                                                    onRatingUpdate: (value) {
                                                      setState(() {
                                                        ratingValue = value;
                                                      });
                                                    }),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Later",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ))),
                                              TextButton(
                                                  onPressed: () async {
                                                    await Client_API().valuta(
                                                        widget
                                                            .list[index].email,
                                                        widget.list[index].date,
                                                        widget.list[index].time,
                                                        widget.list[index]
                                                            .subject,
                                                        ratingValue.toInt());
                                                    widget.update();
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Rate",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )),
                                            ],
                                          );
                                        });
                                  })
                              : const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 40,
                                ),
                        ],
                      )
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

  ListForCart(this.list, {Key? key}) : super(key: key);

  @override
  State<ListForCart> createState() => _ListForCartState();
}

class _ListForCartState extends State<ListForCart> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  void _removeItem(int i) {
    _key.currentState!.removeItem(
      i,
      (context, animation) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    size: 18),
                                myText(
                                    "${widget.list[index].rating}",
                                    15,
                                    Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                        .withOpacity(0.6),
                                    FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  myText(
                                      "Prof ${widget.list[index].name} ${widget.list[index].surname}",
                                      19,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.w500),
                                  myText(
                                      widget.list[index].subject,
                                      15,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.normal)
                                ],
                              ),
                              Row(
                                children: [
                                  containerSingleLecture(
                                      widget.list[index].time,
                                      Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                      context),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: containerSingleLecture(
                                        widget.list[index].date,
                                        Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                        context),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 40,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              onPressed: () async {
                                //api to add
                                if (await SessionManager()
                                    .containsKey("cart_list")) {
                                  String json =
                                      await (SessionManager().get("cart_list"));
                                  cart = lectureFromJson(json);

                                  cart.removeAt(index);
                                  await SessionManager()
                                      .set("cart_list", lecturesToJson(cart));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Cart()));
                                }

                                _removeItem(index);
                                setState(() {});
                              }),
                        ],
                      )
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
  Function() update;
  ListOfLectures(this.list, this.update, {Key? key}) : super(key: key);

  @override
  State<ListOfLectures> createState() => _ListOfLecturesState();
}

class _ListOfLecturesState extends State<ListOfLectures> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  double ratingValue = 5.0;
  void _doneItem(int i) {
    _key.currentState!.removeItem(
      i,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: const EdgeInsets.all(10),
            color: Colors.blue,
            child: ListTile(
              title: myText("Done", 24, Colors.black, FontWeight.normal),
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
                    color: Theme.of(context).colorScheme.primaryContainer,
                    //border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: widget.list[index].image,
                            radius: 25,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    size: 18),
                                myText(
                                    "${widget.list[index].rating}",
                                    15,
                                    Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer
                                        .withOpacity(0.6),
                                    FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  myText(
                                      "Prof ${widget.list[index].name} ${widget.list[index].surname}",
                                      19,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.w500),
                                  myText(
                                      widget.list[index].subject,
                                      15,
                                      Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      FontWeight.normal)
                                ],
                              ),
                              Row(
                                children: [
                                  containerSingleLecture(
                                      widget.list[index].time,
                                      Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                      context),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                    child: containerSingleLecture(
                                        widget.list[index].date,
                                        Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                        context),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            iconSize: 40,
                            onPressed: () async {
                              await Client_API().concludiLezione(
                                  widget.list[index].email,
                                  widget.list[index].subject,
                                  widget.list[index].date,
                                  widget.list[index].time);
                              await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Thank you for choosing us",
                                          style: TextStyle(fontSize: 20)),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text("Please",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey)),
                                          myText("Rate the lecture", 20,
                                              Colors.black, FontWeight.bold),
                                          RatingBar(
                                              initialRating: 5,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star,
                                                      color: Colors.orange),
                                                  half: const Icon(
                                                    Icons.star_half,
                                                    color: Colors.orange,
                                                  ),
                                                  empty: const Icon(
                                                    Icons.star_outline,
                                                    color: Colors.orange,
                                                  )),
                                              onRatingUpdate: (value) {
                                                setState(() {
                                                  ratingValue = value;
                                                });
                                              }),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Later",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ))),
                                        TextButton(
                                            onPressed: () async {
                                              await Client_API().valuta(
                                                  widget.list[index].email,
                                                  widget.list[index].date,
                                                  widget.list[index].time,
                                                  widget.list[index].subject,
                                                  ratingValue.toInt());
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Rate",
                                              style: TextStyle(fontSize: 18),
                                            )),
                                      ],
                                    );
                                  });
                              _doneItem(index);
                              widget.update;
                            },
                            icon: const Icon(Icons.check_box,
                                color: Colors.indigo),
                          )
                        ],
                      )
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

class ListOfBooks extends StatefulWidget {
  List<Lecture> list;
  Function() update;
  ListOfBooks(this.list, this.update, {Key? key}) : super(key: key);

  @override
  State<ListOfBooks> createState() => _ListOfBooksState();
}

class _ListOfBooksState extends State<ListOfBooks> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _removeItem(int i) {
    _key.currentState!.removeItem(
      i,
      (context, animation) {
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

  Future<Event> buildEvent(Lecture lec) async {
    return Event(
      timeZone: "GMT+1",
      title: 'Lezione di ${lec.subject} con Prof. ${lec.surname} ${lec.name}',
      description: 'http://zoom.com/random_reunion',
      location: 'Metaverso',
      startDate: DateTime.parse(lec.date + ' ' + lec.time)
          .subtract(Duration(hours: 1)),
      endDate: DateTime.parse(lec.date + ' ' + lec.time),
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(hours: 1),
        url: "zoom.com/random_reunion",
      ),
      androidParams: AndroidParams(
        emailInvites: [await SessionManager().get("email")],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: _key,
        initialItemCount: widget.list.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          if (index > widget.list.length) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                child: myText(
                    "Non ci sono lezioni", 20, Colors.red, FontWeight.bold));
          }
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                      child: ExpandableNotifier(
                        initialExpanded: false,
                        child: ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: true,
                          child: ExpandablePanel(
                            header: Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: widget.list[index].image,
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                              size: 18),
                                          myText(
                                              "${widget.list[index].rating}",
                                              15,
                                              Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer
                                                  .withOpacity(0.6),
                                              FontWeight
                                                  .w600), //CHANGE 4.7 TO A VARIABLE
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 40),
                                Column(
                                  children: [
                                    myText(
                                        "Prof ${widget.list[index].name} ${widget.list[index].surname}",
                                        19,
                                        Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        FontWeight.w500),
                                    myText(
                                        widget.list[index].subject,
                                        15,
                                        Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        FontWeight.normal),
                                    const SizedBox(width: 40),
                                    Row(
                                      children: [
                                        containerSingleLecture(
                                            widget.list[index].time,
                                            Theme.of(context)
                                                .colorScheme
                                                .tertiaryContainer,
                                            context),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 0, 0, 0),
                                          child: containerSingleLecture(
                                              widget.list[index].date,
                                              Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer,
                                              context),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            collapsed: placeholder,
                            expanded: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      iconSize: 40,
                                      onPressed: () async {
                                        Event ev = await buildEvent(
                                            widget.list[index]);
                                        Add2Calendar.addEvent2Cal(
                                          ev,
                                        );
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.green),
                                    ),
                                    IconButton(
                                      iconSize: 40,
                                      onPressed: () async {
                                        await Client_API().cancelPrenotazione(
                                            widget.list[index].email,
                                            widget.list[index].date,
                                            widget.list[index].subject,
                                            widget.list[index].time);
                                        _removeItem(index);
                                      },
                                      icon: Icon(Icons.delete,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  space
                ],
              ));
        },
      ),
    );
  }
}

class ListForSubject extends StatefulWidget {
  List<Lecture> list;

  ListForSubject(this.list, {Key? key}) : super(key: key);

  @override
  State<ListForSubject> createState() => _ListForSubjectState();
}

class _ListForSubjectState extends State<ListForSubject> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<Lecture> cart = [];
  void _additem(int i) {
    _key.currentState!.removeItem(
      i,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
            child: ListTile(
              title:
                  myText("Added To Cart", 24, Colors.black, FontWeight.normal),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: widget.list[index].image,
                                radius: 25,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        size: 18),
                                    myText(
                                        "${widget.list[index].rating}",
                                        15,
                                        Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer
                                            .withOpacity(0.6),
                                        FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      myText(
                                          "Prof ${widget.list[index].name} ${widget.list[index].surname}",
                                          19,
                                          Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          FontWeight.w500),
                                      myText(
                                          widget.list[index].subject,
                                          15,
                                          Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          FontWeight.normal)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      containerSingleLecture(
                                          widget.list[index].time,
                                          Theme.of(context)
                                              .colorScheme
                                              .tertiaryContainer,
                                          context),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                15, 0, 0, 0),
                                        child: containerSingleLecture(
                                            widget.list[index].date,
                                            Theme.of(context)
                                                .colorScheme
                                                .tertiaryContainer,
                                            context),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () async {
                                    //api to add
                                    if (await SessionManager()
                                        .containsKey("cart_list")) {
                                      String json =
                                          await (SessionManager().get("cart_list"));
                                      cart = lectureFromJson(json);

                                      cart.add(widget.list[index]);
                                      await SessionManager()
                                          .set("cart_list", lecturesToJson(cart));
                                    } else {
                                      List<Lecture> l = [];
                                      l.add(widget.list[index]);
                                      await SessionManager()
                                          .set("cart_list", lecturesToJson(l));
                                    }
                                    _additem(index);
                                  })
                            ],
                          )
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

Widget topWidget(Lecture lecture, BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
    child: Row(
      children: const [
        SizedBox(width: 40),
        SizedBox(width: 40),
      ],
    ),
  );
}
