// 5
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:riddle_app/list_class.dart';
import 'package:riddle_app/question_list.dart';

// create riddle page
class RiddlePage extends StatefulWidget {
  @override
  _RiddlePageState createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  // create ListClass object
  final ListClass obj;
  // create question index
  var questionIndex = 0;
  // create correct ans counter
  var correctAnsCount = 0;

  // create the constractor
  _RiddlePageState({this.obj});

  // create reset method after finish all questions reset the page
  void reset() {
    questionIndex = 0;
    correctAnsCount = 0;
  }

  // create getQuestionAnswer method to get the correct answer
  String getQuestionAnswer() {
    return allList[questionIndex].ans;
  }

  // create answer method to check userPickedAns and getQuestionAnswer is equal or not. Then increase the marks
  void answer(String userPickedAns) {
    String correctAns = getQuestionAnswer();
    setState(() {
      if (correctAns == userPickedAns) {
        correctAnsCount += 1;
      }
    });
  }

  // create nextQuestion method to go to next question
  void nextQuestion() {
    if (questionIndex < allList.length - 1) {
      questionIndex += 1;
    }
  }

  // create isFinish method to check questions are finish or not
  bool isFinish() {
    if (questionIndex >= allList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // Image changer
  Widget imageLogic() {
    if (correctAnsCount < 3) {
      return Image(
        image: AssetImage('assets/wrong.gif'),
      );
    } else if (correctAnsCount >= 3 && correctAnsCount <= 5) {
      return Image(
        image: AssetImage('assets/ok.gif'),
      );
    } else {
      return Image(
        image: AssetImage('assets/correct.gif'),
      );
    }
  }

  // create ansQ method to generate the logic
  void ansQ(String userPickedAns) {
    String correctAns = getQuestionAnswer();
    String newAns = userPickedAns;
    // create the setState method
    setState(() {
      // 1st check questions are finish or not
      if (isFinish() == false) {
        // 2nd check userPickedAns and getQuestionAnswer is equal or not. Then increase the marks
        if (correctAns == userPickedAns) {
          correctAnsCount += 1;
        }
        // 3rd call the nextQuestion methode to go to next question
        nextQuestion();
      } else {
        // otherwise
        // 1st call the answer to check userPickedAns and getQuestionAnswer is equal or not. Then increase the marks
        answer(newAns);
        // 2nd create Alrt to tell the user that he reach the end of the question
        Alert(
          image: imageLogic(),
          context: context,
          title: 'Finished!',
          desc: 'Your Score-$correctAnsCount/7',
        ).show();
        // 4th call the reset method to reset the page
        reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create the stack
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // set the background image
          Image.asset(
            'assets/tree.jpg',
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.darken,
          ),

          // create SingleChildScrollView
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                  // create text to count questions
                  child: Text(
                    'Question No.${allList[questionIndex].qn}/7',
                    style: TextStyle(
                      color: Colors.deepOrange[100],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                // add some padding
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  // create a text to show question
                  child: Text(
                    allList[questionIndex].question,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[200],
                    ),
                  ),
                ),
                // add some padding
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  // create a row to show 2 images side by side
                  child: Row(
                    children: <Widget>[
                      // create expanded widget
                      Expanded(
                        // create cliprrect to give radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // set the image
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic1}',
                          ),
                        ),
                      ),
                      // add sizedbox widget
                      SizedBox(
                        width: 10,
                      ),
                      // same as 1st image
                      Expanded(
                        // same as 1st image
                        child: ClipRRect(
                          // same as 1st image
                          borderRadius: BorderRadius.circular(20.0),
                          // same as 1st image
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic2}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // give some padding
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  // same as 1st row
                  child: Row(
                    children: <Widget>[
                      // same as 1st image
                      Expanded(
                        child: ClipRRect(
                          // same as 1st image
                          borderRadius: BorderRadius.circular(20.0),
                          // same as 1st image
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic3}',
                          ),
                        ),
                      ),
                      // add sizedbox
                      SizedBox(
                        width: 10,
                      ),
                      // same as 1st image
                      Expanded(
                        // same as 1st image
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // same as 1st image
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic4}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // add sizedbox
                SizedBox(
                  height: 10,
                ),
                // create a row for answer button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // create a expanded widget
                    Expanded(
                      // create a flatbutton
                      child: FlatButton(
                        splashColor: Colors.green[900],
                        onPressed: () {
                          ansQ(allList[questionIndex].ans1);
                        },
                        // create a card and pass the answer
                        child: Card(
                          color: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                '${allList[questionIndex].ans1}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // same as 1st answer button
                    Expanded(
                      // same as 1st answer button
                      child: FlatButton(
                        splashColor: Colors.green[900],
                        onPressed: () {
                          ansQ(allList[questionIndex].ans2);
                        },
                        // same as 1st answer button
                        child: Card(
                          color: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                '${allList[questionIndex].ans2}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // create a row for 3rd answer button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // same as 1st answer button
                    Expanded(
                      // same as 1st answer button
                      child: FlatButton(
                        splashColor: Colors.green[900],
                        onPressed: () {
                          ansQ(allList[questionIndex].ans3);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  '${allList[questionIndex].ans3}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
