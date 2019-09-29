import 'package:flutter/material.dart';
import './quiz1.dart';


var quiz = new AnimalQuiz();
String name="", dob="", town = "";
TextEditingController controller1 = TextEditingController();

int counter = 0;

class AnimalQuiz{

  var images = ["q1", "q2", "q3"];

  var questions = [
    "", "", ""
  ];


  var choices = [
    ["OK"]
  ];

}

class PatientEntry extends StatefulWidget{
  
  // PatientEntry({@required this.questionNumber1});
  @override
  State<StatefulWidget> createState() {
    return new PatientEntryState();
  } 

}

class PatientEntryState extends State<PatientEntry> {
  int questionNumber1 = 0;

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Container(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
      constraints: new BoxConstraints(),
      
      child: new Column(children: <Widget>[
        
        
                //distance btwn q and score
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // specific q (or keep a narray list)

                    ],
                  ),
                ),


                //image
                //space btwn q and picture (up and down)
                new Padding(padding: EdgeInsets.all(20.0)),
                
                new Image.asset(
                  "images/${quiz.images[questionNumber1]}.jpg",
                ),
                //space btwn pic and q
                new Padding(padding: EdgeInsets.all(20.0)),

                // space btwn q and choices
                new Padding(padding: EdgeInsets.all(20.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      new Flexible(
                    
            child: new TextField(
              controller: controller1,
              
            ),

                      )],
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // patientid
                  
           
           
                //button 4
                    new MaterialButton(
                      elevation: 10,
                      minWidth: 50.0,
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
                      highlightColor: Colors.blueAccent,
                      onPressed: (){
                        if (questionNumber1 == 0){
                          name = controller1.text;
                        }else if (questionNumber1 == 1){
                          dob = controller1.text;
                        }else if (questionNumber1 == 2){
                          town = controller1.text;
                        }
                        
                        controller1.text ="";
                        updateQuestion();
                      },
                      child: new Text("OK",
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(60.0)),

                new Container(
                  alignment: Alignment.center,
                  child:  new MaterialButton(
                      // quit button
                      highlightColor: Colors.red[200],
                      minWidth: 150.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      color: Colors.red[400],
                      onPressed:resetQuiz,
                      child: new Text("Restart",
                      
                        style: new TextStyle(
                            fontSize: 23.0,
                            color: Colors.white
                        ),)
                  )
                ),
              ],
            ),
          ),
      )
    ));
  }

  void resetQuiz(){
    setState(() {
      controller1.text = "";
      Navigator.pop(context);
    });
  }

  void updateQuestion(){
    setState(() {
      if(questionNumber1 == quiz.images.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1(name: controller1.text, dob: controller1.text, town: controller1.text)));

      }else{
        questionNumber1++;
        // widget.questionNumber1 = widget.questionNumber1 + 1;
        debugPrint("${questionNumber1}");
      }
    });
  }
}

