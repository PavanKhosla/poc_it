import 'package:flutter/material.dart';
// import './quiz1.dart';
import './patient_entry.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new PatientQuiz(),
      )
  );
}

class PatientQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return new PatientQuizState();
  }
}

class PatientQuizState extends State<PatientQuiz>{
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     backgroundColor: Colors.grey[200],
     appBar: new AppBar(
       title: new Text("POC-IT"),
       
    
       backgroundColor: Colors.blue,
     ),

     body: new Container(
          margin: const EdgeInsets.only(top:329,left:80 , bottom:329),
       child: new Column(
          
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
         
           new MaterialButton(
             
             height: 80.0,
             elevation: 10,
            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)
  ),
               color: Colors.white,
               highlightColor: Colors.lightBlue,
               onPressed: startQuiz,
               child: new Text("  Post C-Section  ",
                 style: new TextStyle(
                     fontSize: 30.0,
                     //Color of Csection Button
                     color: Colors.black
                 ),)
           )
         ],
       ),
     ),


   );
  }

  void startQuiz(){
   setState(() {
     Navigator.push(context, new MaterialPageRoute(builder: (context)=> new PatientEntry( )));
   });
  }
}

