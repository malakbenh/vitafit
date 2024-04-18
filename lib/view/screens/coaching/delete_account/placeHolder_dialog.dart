import 'package:flutter/material.dart';

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.icon,
    this.message,
    this.actions = const [],
    Key? key, this.title,
  }) : super(key: key);

  final Widget? icon;
  final String? message;
  final String? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7 ,
      height: MediaQuery.of(context).size.height * 0.25 ,
      child: AlertDialog(

        alignment: Alignment.center,
        title: Center(child: Text(title!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        icon: icon,
        content: message == null
            ? null
            : SizedBox(
          height: 50,
          width:300,
          child: Center(
            child: Text(message! ,style: TextStyle(

              color: Colors.grey ,
              fontSize: 15 ,


            ),),
          ),

          // child: CustomText(
          //   text: message!,
          //   textAlign: TextAlign.center,
          //   maxLines: 2,
          //   color: AppColors.greyTextColor,
          //   fontSize: FontSize.s14,
          // ),
        ),
        // contentTextStyle: AppStyle.textBlack,
        actionsAlignment: MainAxisAlignment.center,

        actionsOverflowButtonSpacing: 8.0,
        actions: actions,
      ),
    );
  }
}
