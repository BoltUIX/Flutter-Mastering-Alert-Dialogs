import 'package:dialog/typography.dart';
import 'package:flutter/material.dart';

//https://www.boltuix.com/2023/02/mastering-alert-dialogs-in-flutter-with.html
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


  // This method creates a confirmation dialog that displays a message to the user and provides them with the option to agree or disagree with the message.
  void confirmationDialog(BuildContext context) async {
    // Get the text theme from the context
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    // Show the dialog using the showDialog method
    showDialog(
      context: context,
      // The barrierDismissible property is set to false to prevent the user from closing the dialog by tapping outside it.
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // Title of the dialog is set using the TextStyleExample widget
          title: TextStyleExample(name : 'Customer Agreement ', style : textTheme.titleLarge!),
          // The content of the dialog is also set using the TextStyleExample widget
          content: TextStyleExample(name : "By clicking 'AGREE', you agree to the Terms of Use and Privacy Policy", style : textTheme.titleSmall!),
          // The actions property specifies the buttons to be displayed at the bottom of the dialog
          actions: <Widget>[
            // The first button is a TextButton widget with the text "DISAGREE" and a callback function that closes the dialog
            TextButton(
              child: TextStyleExample(name : 'DISAGREE',style : textTheme.labelLarge!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // The second button is a TextButton widget with the text "AGREE" and a callback function that closes the dialog
            TextButton(
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

  // Function to open a basic dialog with title, content and a button
  void openDialog(BuildContext context) {
    // Get the text theme from the context
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    // Show the dialog with the given context
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        // Set the title of the dialog using TextStyleExample widget
        title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
        // Set the content of the dialog using TextStyleExample widget
        content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
        // Define the actions to be taken when the button is pressed
        actions: <Widget>[
          TextButton(
            // Set the text of the button using TextStyleExample widget
            child: TextStyleExample(name : 'OK',style : textTheme.labelLarge!),
            // Define the action to be taken when the button is pressed
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
  // Initial selected ringtone
  String? selectedRingtone = "None";

  // List of available ringtones
  List<String> ringtone = [    "None", "Classic rock", "Monophonic", "Luna"  ];

  @override
  Widget build(BuildContext context){
    // Get the text theme for the current context
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return SimpleDialog(
      // Dialog title
      title: TextStyleExample(name : 'Phone Ringtone',style : textTheme.titleMedium!),
      // List of radio buttons
      children: ringtone.map((r) => RadioListTile(
        title:  TextStyleExample(name : r ,style : textTheme.titleSmall!),
        // Current selected value
        groupValue: selectedRingtone,
        // Whether this radio button is selected
        selected: r == selectedRingtone,
        // Value of this radio button
        value: r,
        // Callback function when this radio button is selected
        onChanged: (dynamic val) {
          setState(() {
            selectedRingtone = val;
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

  //List of available color options.
  List<String> colors = ["Red", "Green", "Blue", "Purple", "Orange"  ];

  //List of status for each color option, indicating if it is selected or not.
  List<bool> status = [    true, false, false, false, false, false  ];

  //Function to get the value of selected status of a given color option.
  bool getValue(String val){
    int index = colors.indexOf(val);
    if(index == -1) return false;
    return status[index];
  }

  //Function to toggle the value of selected status of a given color option.
  void toggleValue(String name){
    int index = colors.indexOf(name);
    if(index == -1) return;
    status[index] = !status[index];
  }

  //Build function returns the widget tree for the MultiChoiceDialog widget.
  @override
  Widget build(BuildContext context){

    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return AlertDialog(
      //Title for the dialog.
      title: TextStyleExample(name : 'Your preferred color',style : textTheme.titleLarge!),
      //Padding for the content of the dialog.
      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      //Content of the dialog, displaying checkboxes for each color option.
      content: Wrap(
        direction: Axis.vertical,
        children: colors.map((c) => InkWell(
          child: Row(
            children: <Widget>[
              //Checkbox for each color option.
              Checkbox(value: getValue(c), onChanged: (value) {
          setState(() {
            toggleValue(c);
          });
        }),
              TextStyleExample(name : c,style : textTheme.titleSmall!,),
            ],
          ),
          onTap: (){
            //On tap action for each color option.
            setState(() {
              toggleValue(c);
            });
          },
        )).toList(),
      ),
      //Actions for the dialog, including Cancel and OK buttons.
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








