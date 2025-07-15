FlashCard Quiz App 
A clean and interactive Flutter app that lets users attempt a quiz based on flashcards. The questions are dynamically fetched from a remote JSON API using HTTP requests. Designed to practice and test general knowledge or subject-specific topics.

Features
-  Fetches quiz questions from a REST API (via `http` package)
-  Multiple-choice questions with score tracking
-  Final result screen with total score
-  Simple and responsive UI using Material Design
-  "Next Question" navigation and score state management using `setState()`
-  Reusable custom widgets (`QuestionWidget`, `NextButton`, `ResultBox`)

Packages Used
| Package         | Purpose                                |
|----------------|----------------------------------------|
| `http`          | Fetching question data from the server |
| `flutter/material.dart` | Core Flutter widgets for UI   |

Project Structure
lib/
├── model/ 
│ ├── question_model.dart
│ └── db_connect.dart # Handles API interaction
├── widgets/
│ ├── question_widget.dart
│ ├── next_button.dart
│ └── result_box.dart
├── screens/
│ └── home_screen.dart
├── constants.dart
└── main.dart

