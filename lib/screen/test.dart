import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Question> questions = [
    Question("Question 1: Feeling bad about yourself - or that you're a failure or have let yourself or your family down", 0),
    Question("Question 2: Feeling down, depressed or hopeless", 0),
    Question("Question 3: Feeling tired or having little energy", 0),
    Question("Question 4: Little interest or pleasure in doing things", 0),
    Question("Question 5: Trouble falling asleep, staying asleep, or sleeping too much", 0),
    Question("Question 6: Poor appetite or overeating", 0),
    Question("Question 7: Trouble concentrating on things, such as reading the newspaper or watching television", 0),
    Question("Question 8: Thoughts that you would be better off dead or of hurting yourself in some way", 0),
    Question("Question 9: Moving or speaking so slowly that other people could have noticed. Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual", 0),
    Question("Question 10: I felt that I had nothing to look forward to", 0),
  ];

  int totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            question: questions[index],
            onOptionSelected: (score) {
              setState(() {
                questions[index].score = score;
                totalScore = questions.map((question) => question.score).reduce((a, b) => a + b);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the total score when the test is completed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Test Completed'),
                content: Text('Total Score: $totalScore/20'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class Question {
  String text;
  int score;
  String selectedOption = ''; // Track the selected option

  Question(this.text, this.score);
}

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(int) onOptionSelected;

  QuestionWidget({required this.question, required this.onOptionSelected});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.question.text),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(2); // Assign 2 points for "Yes"
                  setState(() {
                    widget.question.selectedOption = 'Yes'; // Update the selected option
                  });
                },
                child: Text('Yes'),
                style: ElevatedButton.styleFrom(
                  primary: widget.question.selectedOption == 'Yes' ? Colors.green : Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(0); // Assign 0 points for "No"
                  setState(() {
                    widget.question.selectedOption = 'No'; // Update the selected option
                  });
                },
                child: Text('No'),
                style: ElevatedButton.styleFrom(
                  primary: widget.question.selectedOption == 'No' ? Colors.green : Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onOptionSelected(1); // Assign 1 point for "Not Sure"
                  setState(() {
                    widget.question.selectedOption = 'Not Sure'; // Update the selected option
                  });
                },
                child: Text('Not Sure'),
                style: ElevatedButton.styleFrom(
                  primary: widget.question.selectedOption == 'Not Sure' ? Colors.green : Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
