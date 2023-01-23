import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Model/Client_API.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Model/Lecture.dart';
import '../main.dart';
import 'MyProfile/Login.dart';

int cart_size = 0;

class Cart extends StatefulWidget {
  //List<Lecture> list;
  const Cart(/*this.list ,*/ {Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Lecture> lectures = [];

  String placeOrderText = " Swipe to Place Order";
  Icon placeOrderIcon = const Icon(Icons.arrow_forward);
  Color placeOrderColorContainer = Colors.orange;
  DismissDirection placeOrderDirection = DismissDirection.startToEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            customAppBar4Cart(
                placeholderBack,
                binButton(context),
                myText("Cart", 20, Theme.of(context).colorScheme.onPrimary,
                    FontWeight.w500),
                60,
                context),
            const SizedBox(height: 20),
            FutureBuilder<List<Lecture>>(
              future: SessionManager()
                  .get("cart_list")
                  .then((value) => lectureFromJson(value)),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Lecture>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  cart_size = snapshot.data!.length;
                  lectures = snapshot.data!;

                  return (snapshot.hasData
                      ? ListForCart(snapshot.data!)
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 10, 0, 10),
                          child: myText("Non ci sono lezioni", 20, Colors.red,
                              FontWeight.bold)));
                } else {
                  return (Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26, width: 1),
                      ),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                      child: myText("Non ci sono lezioni", 20, Colors.red,
                          FontWeight.bold)));
                }
              },
            ),
            const SizedBox(height: 15),
            totalCost(lectures.length, lectures.length * 10, context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: placeOrderColorContainer),
                width: 330,
                height: 65,
                clipBehavior: Clip.hardEdge,
                child: Dismissible(
                    key: UniqueKey(),
                    direction: placeOrderDirection,
                    onDismissed: (DismissDirection direction) async {
                      bool log_st = await SessionManager().get("login_state");
                      if( log_st==true){

                        for (int i = 0; i < lectures.length; i++) {
                          await Client_API().prenotaLezioni(
                              lectures.elementAt(i).time,
                              lectures.elementAt(i).date,
                              lectures.elementAt(i).email,
                              await SessionManager().get("email"));
                        }
                        await SessionManager().remove("cart_list");

                        setState(() {
                          if (direction == DismissDirection.startToEnd) {
                            placeOrderIcon = const Icon(Icons.check);
                            placeOrderText = "Payment Confirmed";
                            placeOrderColorContainer = Colors.green;
                            placeOrderDirection = DismissDirection.none;
                            //Add the removal of all the lessons you buyed
                          }
                        });
                      }
                      else{
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const Login()));
                      }


                    },
                    background: buyContainer(
                        context,
                        const CircularProgressIndicator(),
                        Colors.green[200]!,
                        "Processing"),
                    child: buyContainer(context, placeOrderIcon,
                        Colors.transparent, placeOrderText)),
              ),
            ),
          ],
        ));
  }

  Container buyContainer(BuildContext context, Widget iconOnRight,
      Color containerColor, String centerText) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: containerColor),
      width: 330,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          myText(centerText, 25, Colors.black, FontWeight.w600),
          const SizedBox(width: 20),
          iconOnRight
        ],
      ),
    );
  }
}

Widget totalCost(int numberOfLecture, int totalPrice, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 85,
    width: 290,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FutureBuilder<List<Lecture>>(
          future: SessionManager()
              .get("cart_list")
              .then((value) => lectureFromJson(value)),
          builder:
              (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
            if (snapshot.hasData) {
              return (snapshot.hasData
                  ? totalCostPart("Number of Lectures ",
                      snapshot.data!.length.toString(), context)
                  : totalCostPart("Number of Lectures ", "0", context));
            } else {
              return totalCostPart("Number of Lectures ", "0", context);
            }
          },
        ),
        Divider(
            thickness: 1,
            height: 10,
            color: Theme.of(context).colorScheme.background),
        FutureBuilder<List<Lecture>>(
          future: SessionManager()
              .get("cart_list")
              .then((value) => lectureFromJson(value)),
          builder:
              (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
            if (snapshot.hasData) {
              double sum = 0;
              for (int i = 0; i < snapshot.data!.length; i++) {
                sum += snapshot.data![i].price;
              }

              return (snapshot.hasData
                  ? totalCostPart("Total", sum.toString(), context)
                  : totalCostPart("Total", 0.toString(), context));
            } else {
              return totalCostPart("Total", 0.toString(), context);
            }
          },
        ),
      ],
    ),
  );
}

Row totalCostPart(String label, String total, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
        child: myText(label, 17,
            Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.w600),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
        child: myText(total, 15,
            Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.w400),
      )
    ],
  );
}

IconButton binButton(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.delete_forever_outlined,
        color: Theme.of(context).colorScheme.error, size: 35),
    onPressed: () async {

      await SessionManager().remove("cart_list");
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => const Root()));
    },
  );
}
