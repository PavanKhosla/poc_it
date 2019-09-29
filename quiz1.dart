import 'package:flutter/material.dart';
import './patient_entry.dart';
import './main.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz{
  var images = [
    "q4", "q5", "q6", "q7","q8", "q9", "q10"
  ];


  var questions = [
    "","","","","","",""
  ];


  var choices = [
    ["Yes", "No"],["Yes", "No"],["Yes", "No"],["Yes", "No"],["Yes", "No"],["Yes", "No"],["Yes", "No"]
  ];


  var correctAnswers = [
    "Yes", "Yes", "Yes", "Yes","Yes", "Yes", "Yes"
  ];
}

class Quiz1 extends StatefulWidget{
  final String name;
  final String dob;
  final String town;
  Quiz1({@required this.name, @required this.dob, @required this.town});
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  // final String name;
  // final String dob;
  // final String town;
  // Quiz1State({@required this.name, @required this.dob, @required this.town});
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
                      new Text("    Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                          //score font
                            fontSize: 25.0
                        ),),

                      
                    ],
                  ),
                ),


                //image
                //space btwn q and picture (up and down)
                new Padding(padding: EdgeInsets.all(10.0)),

                new Image.asset(
                  "images/${quiz.images[questionNumber]}.jpg",
                ),
                //space btwn pic and q
                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    //q font
                    fontSize: 25.0,
                  ),),
                // space btwn q and choices
                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
                      minWidth: 120.0,
                      elevation: 10,
                      color: Colors.grey,
                      highlightColor: Colors.blueAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          finalScore++;
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        ),),
                    ),



                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //button 2
                    new MaterialButton(
                      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      minWidth: 120.0,
                      color: Colors.grey,
                      highlightColor: Colors.blue,
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          finalScore++;
                        }
                        
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

               
                new Padding(padding: EdgeInsets.all(60.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child:  new MaterialButton(
                    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
    elevation: 10,
    highlightColor: Colors.red[200],
                      // quit button
                      minWidth: 150.0,
                      height: 50.0,
                      color: Colors.red[400],
                      onPressed: resetQuiz,
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
      
      // Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new PatientEntry()));
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.images.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return new Material(
        child: new Container(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
      constraints: new BoxConstraints(),
      child: new Column(children: <Widget>[
              
              
              new Padding(padding: EdgeInsets.symmetric(horizontal: 300.0, vertical: 150.0)),
              new Text("Patient Risk Score:"+"\n"+"$score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),
              //final screen format
              

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  
                  debugPrint(name);
                  debugPrint(dob);
                  debugPrint(town);
                  debugPrint("$finalScore");
                  // Reset because form is completed
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=> new PatientQuiz()));
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  
                },
        
                child: new Text("SUBMIT",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),


      ),
    ));
  }


}