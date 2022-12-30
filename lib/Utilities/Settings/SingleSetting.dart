/*

import 'package:flutter/material.dart';

import '../CommonWidgets/CommonStyles.dart';

class SingleSetting extends StatefulWidget {
  final Widget topWidget;
  final bool expand;
  final Widget bottomWidget;


  const SingleSetting(this.topWidget,this.expand,this.bottomWidget,{Key? key}) : super(key: key);

  @override
  State<SingleSetting> createState() => _SingleSettingState();
}

class _SingleSettingState extends State<SingleSetting> {

  R

  double height = 60;
  double width = 370;
  late List<Widget> buildParts = [widget.topWidget];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(openContainer.valueNotifier.value==false && widget.expand==true){
            height = 250;
            buildParts.add(widget.bottomWidget);
            openContainer.valueNotifier.value = true;
          }else if(openContainer.valueNotifier.value==true && widget.expand==true){
            height = 50;
            buildParts.remove(widget.bottomWidget);
            openContainer.valueNotifier.value = false;
          }else{

          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        color: Colors.white,
        height: height,
        width: width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: openContainer.valueNotifier.value ? 2 : 1,
          itemBuilder:(context,int index){
            return buildParts[index];
          },
        ),
      ),
    );
  }



}
 */

