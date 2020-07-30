import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:riddle_app/list_class.dart';
import 'package:riddle_app/question_list.dart';

class RiddlePage extends StatefulWidget {
  @override
  _RiddlePageState createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final ListClass obj;
  var questionIndex = 0;
  var correctAnsCount = 0;

  void reset() {
    questionIndex = 0;
    correctAnsCount = 0;
  }

  String getQuestionAnswer() {
    return allList[questionIndex].ans;
  }

  void answer(String userPickedAns) {
    String correctAns = getQuestionAnswer();
    setState(() {
      if (correctAns == userPickedAns) {
        correctAnsCount += 1;
      }
    });
  }

  void nextQuestion() {
    if (questionIndex < allList.length - 1) {
      questionIndex += 1;
    }
  }

  bool isFinish() {
    if (questionIndex >= allList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void ansQ(String userPickedAns) {
    String correctAns = getQuestionAnswer();
    String newAns = userPickedAns;
    setState(() {
      // answer(allList[questionIndex].ans);
      if (isFinish() == false) {
        if (correctAns == userPickedAns) {
          correctAnsCount += 1;
        }
        nextQuestion();

        //questionIndex += 1;
        // if (correctAns == userPickedAns) {
        //   correctAnsCount += 1;
        // }
        // Alert(
        //   image: Image.asset('assets/correct.gif'),
        //   context: context,
        //   title: 'Finished!',
        //   desc: 'Your Score-$correctAnsCount/7',
        // ).show();
        // reset();
      } else {
        answer(newAns);
        Alert(
          image: Image.asset('assets/correct.gif'),
          context: context,
          title: 'Finished!',
          desc: 'Your Score-$correctAnsCount/7',
        ).show();
        reset();
        // if (correctAns == userPickedAns) {
        //   correctAnsCount += 1;
        // }
        // nextQuestion();
      }
    });
  }

  _RiddlePageState({this.obj});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/tree.jpg',
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.darken,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                  child: Text(
                    'Question No.${allList[questionIndex].qn}/7',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    allList[questionIndex].question,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[200],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic1}',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic2}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic3}',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${allList[questionIndex].pic4}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          //answer(allList[questionIndex].ans);
                          ansQ(allList[questionIndex].ans1);
                        },
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
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          //answer(allList[questionIndex].ans);
                          ansQ(allList[questionIndex].ans2);
                        },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          //answer(allList[questionIndex].ans);
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
