import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    GetMaterialApp(
      initialRoute: '/Root',
      getPages: [
        GetPage(name: '/HomePage', page: () => HomePage()),
        GetPage(name: '/Professor', page: () => ByProfessor()),
        GetPage(name: '/Subject', page: () => bySubject()),

      ],
      home:Root(),
    )
  );
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


