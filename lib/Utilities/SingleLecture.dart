import 'package:flutter/material.dart';

class SingleLecture extends StatelessWidget {
  const SingleLecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           color: Colors.red
       ),
       height: 100,
       width: 350,
       child: IconButton(
         icon: const Icon(Icons.abc),
         onPressed: () {

         },
       ),
    );
  }
}

