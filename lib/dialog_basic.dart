import 'package:dialog/typography.dart';
import 'package:flutter/material.dart';

class DialogBasicRoute extends StatefulWidget {

  const DialogBasicRoute({super.key});

  @override
  DialogBasicRouteState createState() => DialogBasicRouteState();
}

class DialogBasicRouteState extends State<DialogBasicRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[

            Container(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: InkWell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("Info dialog", style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: () {
                  openDialog(context);
                },
              ),
            ),
            Divider(color: Colors.grey[200], height: 0, thickness: 0.5),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: InkWell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("Confirmation dialog", style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: () {
                  confirmationDialog(context);
                },
              ),
            ),
            Divider(color: Colors.grey[200], height: 0, thickness: 0.5),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: InkWell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("Single choice dialog", style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: () {
                  showDialog(context: context,builder: (_) => const SingleChoiceDialog() );
                },
              ),
            ),
            Divider(color: Colors.grey[200], height: 0, thickness: 0.5),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: InkWell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("Multiple choice dialog", style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: () {
                  showDialog(context: context,builder: (_) => const MultiChoiceDialog() );
                },
              ),
            ),
            Divider(color: Colors.grey[200], height: 0, thickness: 0.5),
          ],
        ),
      ),
    );
  }

  void confirmationDialog(BuildContext context) async {

    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
         // title: TextStyleExample(name : 'Privacy',style : textTheme.titleMedium!.copyWith(color: MyColors.black, fontWeight: FontWeight.bold)),
          title: TextStyleExample(name : 'Customer Agreement ',style : textTheme.titleLarge!),
          content: TextStyleExample(name : "By clicking 'AGREE', you agree to the Terms of Use and Privacy Policy" ,style : textTheme.titleSmall!),
          actions: <Widget>[
            TextButton(
              child: TextStyleExample(name : 'DISAGREE',style : textTheme.labelLarge!),
              //child: TextStyleExample(name : 'DISAGREE',style : textTheme.labelLarge!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
             // child: TextStyleExample(name : 'AGREE',style : textTheme.labelLarge!.copyWith(color: MyColors.accentDark)),
              child: TextStyleExample(name : 'AGREE',style : textTheme.labelLarge!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  void openDialog(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
        content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
        actions: <Widget>[
          TextButton(
            //child: const Text('OK'),
            child: TextStyleExample(name : 'OK',style : textTheme.labelLarge!),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

}

class SingleChoiceDialog extends StatefulWidget {

  const SingleChoiceDialog({Key? key}) : super(key: key);

  @override
  SingleChoiceDialogState createState() => SingleChoiceDialogState();
}
class SingleChoiceDialogState extends State<SingleChoiceDialog>{

  String? selectedRingtone = "None";
  List<String> ringtone = [
    "None", "Classic rock", "Monophonic", "Luna"
  ];

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return SimpleDialog(
      //title: TextStyleExample(name : 'Phone Ringtone',style : textTheme.titleMedium!.copyWith(color: MyColors.black, fontWeight: FontWeight.bold)),
      title: TextStyleExample(name : 'Phone Ringtone',style : textTheme.titleMedium!),
      children: ringtone.map((r) => RadioListTile(
        title:  TextStyleExample(name : r ,style : textTheme.titleSmall!),
        groupValue: selectedRingtone,
        selected: r == selectedRingtone,
        value: r,
        onChanged: (dynamic val) {
          setState(() {
            selectedRingtone = val;
              // Navigator.of(context).pop();
          });
        },
      )).toList(),
    );
  }
}

class MultiChoiceDialog extends StatefulWidget {

  const MultiChoiceDialog({Key? key}) : super(key: key);

  @override
  MultiChoiceDialogState createState() => MultiChoiceDialogState();
}
class MultiChoiceDialogState extends State<MultiChoiceDialog>{

  List<String> colors = [
    "Red", "Green", "Blue", "Purple", "Orange"
  ];

  List<bool> status = [
    true, false, false, false, false, false
  ];

  bool getValue(String val){
    int index = colors.indexOf(val);
    if(index == -1) return false;
    return status[index];
  }

  void toggleValue(String name){
    int index = colors.indexOf(name);
    if(index == -1) return;
    status[index] = !status[index];
  }

  @override
  Widget build(BuildContext context){

    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return AlertDialog(
      title: TextStyleExample(name : 'Your preferred color',style : textTheme.titleLarge!),
      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      content: Wrap(
        direction: Axis.vertical,
        children: colors.map((c) => InkWell(
          child: Row(
            children: <Widget>[
              Checkbox(value: getValue(c), onChanged: (value) {
          setState(() {
            toggleValue(c);
          });
        }),
              TextStyleExample(name : c,style : textTheme.titleSmall!,),
            ],
          ),
          onTap: (){
            setState(() {
              toggleValue(c);
            });
          },
        )).toList(),
      ),
      actions: <Widget>[
        TextButton(
          child:TextStyleExample(name : 'Cancel',style : textTheme.labelLarge!),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          //child:  TextStyleExample(name : 'OK',style : textTheme.labelLarge!.copyWith(color: MyColors.accentDark)),
          child:  TextStyleExample(name : 'OK',style : textTheme.labelLarge!),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}








