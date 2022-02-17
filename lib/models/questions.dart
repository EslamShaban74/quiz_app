import 'dart:math';

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });
}

List sampleData = [
  {
    "id": 1,
    "question":
        "When was Facebook Founded? ",
    "options": ['2001', '2000', '2004', '2008'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": " Who is the richest man in the world ? ",
    "options": ['Bill Gates', 'Jeff Bezos', 'Elon Musk', 'Mark Zuckerberg'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Who is the founder of Facebook? ",
    "options": ['Mark Zuckerberg', 'Steve Jobs', 'Elon Musk', 'Bill Gates'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Flutter is a UI toolkit to build CrossPlatforms Applications created by ______",
    "options": ['Google', 'Facebook', 'Amazon', 'SpaceX'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "When was Google founded?",
    "options": ['2000', '2004', '1998', '2002'],
    "answer_index": 2,
  },
];
