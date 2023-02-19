import 'package:dialog/typography.dart';
import 'package:flutter/material.dart';
import 'img.dart';


/*This code defines a SnackbarCustomRoute widget which is a StatefulWidget that
is displayed as a Scaffold. It contains a list of menu items, each with its own title.
When one of the menu items is clicked, a SnackBar will be displayed with different
 content based on the selected menu item.*/

class SnackbarCustomRoute extends StatefulWidget {

  const SnackbarCustomRoute({super.key});

  @override
  SnackbarCustomRouteState createState() => SnackbarCustomRouteState();
}

class SnackbarCustomRouteState extends State<SnackbarCustomRoute> {

  late BuildContext _scaffoldCtx;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CommonAppBar.getPrimaryBackAppbarNew(context, "Snackbar") as PreferredSizeWidget?,
      body: Builder(builder: (BuildContext context){
        _scaffoldCtx = context;
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[

              Container(height: 25),


              SizedBox(
                width: double.infinity, height: 50,
                child: InkWell(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("SIMPLE", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500)),
                  ),
                  onTap: () {
                    onMenuClicked("SIMPLE");
                  },
                ),
              ),



              SizedBox(
                width: double.infinity, height: 50,
                child: InkWell(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CARD LIGHT", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500)),
                  ),
                  onTap: () {
                    onMenuClicked("CARD LIGHT");
                  },
                ),
              ),

              Divider(color: Colors.grey[400], height: 0, thickness: 0.5),
              SizedBox(
                width: double.infinity, height: 50,
                child: InkWell(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CARD IMAGE", style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500
                    )),
                  ),
                  onTap: () {
                    onMenuClicked("CARD IMAGE");
                  },
                ),
              ),



            ],
          ),
        );
      }),
    );
  }

  void onMenuClicked(String menu){
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);


    if(menu == "SIMPLE"){
      // Create a SnackBar widget
      final snackBar = SnackBar(
        // The text to display in the SnackBar
        content: const Text('Yay! A SnackBar!'),
        // The action to display in the SnackBar
        action: SnackBarAction(
          // The label for the action button
          label: 'Undo',
          // Callback function to be executed when the action button is pressed
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show the SnackBar.
      // The _scaffoldCtx variable holds the context of the Scaffold widget
      ScaffoldMessenger.of(_scaffoldCtx).showSnackBar(snackBar);
    }
    else if(menu == "CARD LIGHT"){
      // Showing a snack bar using ScaffoldMessenger
      ScaffoldMessenger.of(_scaffoldCtx).showSnackBar(
        SnackBar(
          // Setting the elevation to 0 to make the snack bar flat
          elevation: 0,
          content: Card(
            // Rounding the border of the card
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // Setting the clipping behavior for the card
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 1,
            child: Container(
              // Adding padding to the container
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  // Adding space to the left side
                  const SizedBox(width: 5, height: 0),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Displaying the product name with a bold font
                        // Text("Iphone 11", style: MyText.subhead(context)!.copyWith(color: Theme.of(context).colorScheme.primary)),
                        TextStyleExample(name : 'Iphone 11',style : textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
                        // Displaying the action that has been taken
                        //Text("Has Been Removed", style: MyText.caption(context)!),
                        TextStyleExample(name : 'Has Been Removed',style : textTheme.labelSmall!),
                      ],
                    ),
                  ),
                  // Adding a vertical line between the product name and the undo button
                  Container(color: Colors.grey, height: 35, width: 1, margin: const EdgeInsets.symmetric(horizontal: 5)),
                  SnackBarAction(
                    // Displaying the undo button
                    label: "UNDO",
                    textColor: Theme.of(context).colorScheme.primary,
                    // Callback function for when the undo button is pressed
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ),
          // Setting the background color to transparent
          backgroundColor: Colors.transparent,
          // Setting the duration for how long the snack bar should be visible
          duration: const Duration(seconds: 10),
        ),
      );
    }
    else if(menu == "CARD IMAGE"){
      // Showing a Snackbar with a custom design
      ScaffoldMessenger.of(_scaffoldCtx).showSnackBar(SnackBar(
        // Setting the elevation to 0 to make the Snackbar look flat
        elevation: 0,

        // Content of the Snackbar
        content: Card(
          // Adding a rounded rectangle border to the Snackbar content
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5),),

          // Setting the clip behavior for the Snackbar content
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // Adding a small elevation to the Snackbar content to give it a raised effect
          elevation: 1,

          // The main container for the Snackbar content
          child: Container(
            // Adding padding to the container
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // A row widget to arrange the content inside the container
            child: Row(
              children: [
                // Adding a spacer with a width of 5
                const SizedBox(width: 5, height: 0),
                // Adding an image asset of the chat icon
                Image.asset(Img.get('chat.png'),
                  height: 40, width: 40,
                ),
                // Adding a spacer with a width of 10
                const SizedBox(width: 10, height: 0),
                // A column widget to arrange the text content
                Expanded(child: Column(
                  // Setting the main axis size to minimum
                  mainAxisSize: MainAxisSize.min,
                  // Aligning the content to the start of the column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Displaying the name of the item "Black-forest" with a custom style
                    TextStyleExample(name : 'Iphone 11',style : textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
                    // Show the text "Has Been Removed" with a caption style
                    TextStyleExample(name : 'Has Been Removed',style : textTheme.labelSmall!.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                )),
                // Adding a separator line with a color of Colors.grey
                Container(color: Colors.grey, height: 35, width: 1, margin: const EdgeInsets.symmetric(horizontal: 5)),
                // Adding an undo button
                SnackBarAction(
                  // Setting the label for the undo button
                  label: "UNDO",
                  // Setting the text color for the undo button
                  textColor: Colors.black,
                  // Setting the callback function for when the undo button is pressed
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
        // Setting the background color of the Snackbar to be transparent
        backgroundColor: Colors.transparent,
        // Setting the duration for how long the Snackbar will be displayed
        duration: const Duration(seconds: 3),
      ));
    }
  }

}


