import 'package:flutter/material.dart';
import 'package:riddle_app/riddle_Page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/leafs.jpg',
            fit: BoxFit.fitHeight,
            color: Colors.black26,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 250, 30, 10),
                    child: Text(
                      'GOOGLY',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Color(0xff8cba51),
                height: 10,
                thickness: 2,
                endIndent: 70,
                indent: 70,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2b580c),
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RiddlePage(),
            ),
          ),
        },
        child: Icon(
          Icons.queue_play_next,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff8cba51),
        child: Container(
          height: 60.0,
        ),
        elevation: 4,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
