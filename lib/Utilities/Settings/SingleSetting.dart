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

  bool openContainer = false; // This variable controls when the AnimatedContainer is wider
  double height = 65;
  double width = 250;
  late List<Widget> buildParts = [widget.topWidget];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(openContainer==false && widget.expand==true){
            height = 200;
            buildParts.add(widget.bottomWidget);
            openContainer = true;
          }else if(openContainer==true && widget.expand==true){
            height = 50;
            buildParts.remove(widget.bottomWidget);
            openContainer = false;
          }else{

          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        color: Colors.white,
        height: height,
        width: width,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          scrollDirection: Axis.vertical,
          itemCount: openContainer ? 2 : 1,
          itemBuilder:(context,int index){
            return buildParts[index];
          },
        ),
      ),
    );
  }



}

