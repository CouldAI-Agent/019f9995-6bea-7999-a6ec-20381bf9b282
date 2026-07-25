import '../models/category.dart';
import '../models/quiz_question.dart';
import 'package:flutter/material.dart';

class MockData {
  static final List<Category> categories = [
    Category(
      id: '1',
      title: 'History of Karnataka',
      description: 'Explore the great empires of Vijayanagara, Chalukya, and Hoysala.',
      icon: Icons.account_balance,
      color: Colors.orange,
      content: 'Karnataka has a rich history that dates back to the paleolithic hand-axe culture. It was the home of some of the most powerful empires in ancient and medieval India, including the Mauryan Empire, the Satavahanas, the Kadambas, the Chalukyas, the Rashtrakutas, the Hoysalas, and the Vijayanagara Empire. These empires have left a lasting legacy on the region\\'s culture, art, and architecture.',
    ),
    Category(
      id: '2',
      title: 'Kannada Literature',
      description: 'Discover the rich literary heritage from Pampa to Kuvempu.',
      icon: Icons.menu_book,
      color: Colors.blue,
      content: 'Kannada literature is one of the oldest in India, with a recorded history spanning over a millennium. It boasts eight Jnanpith Award winners, the highest for any Indian language. Prominent figures include Adikavi Pampa, Ranna, Basavanna, and modern writers like Kuvempu, D.R. Bendre, and Girish Karnad.',
    ),
    Category(
      id: '3',
      title: 'Art & Architecture',
      description: 'Marvel at the intricate designs of Hampi, Belur, and Halebidu.',
      icon: Icons.architecture,
      color: Colors.purple,
      content: 'The architectural heritage of Karnataka is vast and varied. The rock-cut temples of Badami, the intricate carvings of the Hoysala temples in Belur and Halebidu, and the majestic ruins of Hampi (a UNESCO World Heritage Site) showcase the exceptional craftsmanship of ancient Kannadigas. The Indo-Saracenic style is also prominent in Mysore.',
    ),
    Category(
      id: '4',
      title: 'Geography & Nature',
      description: 'Learn about the Western Ghats, rivers, and wildlife sanctuaries.',
      icon: Icons.landscape,
      color: Colors.green,
      content: 'Karnataka is blessed with diverse geography, from the coastal regions along the Arabian Sea to the lush Western Ghats (a biodiversity hotspot) and the Deccan Plateau. Major rivers like the Kaveri and Krishna flow through the state. It is home to numerous wildlife sanctuaries and national parks, protecting species like tigers and elephants.',
    ),
  ];

  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      id: 'q1',
      questionText: 'Who is known as the Adikavi of Kannada literature?',
      options: ['Ranna', 'Pampa', 'Janna', 'Ponna'],
      correctOptionIndex: 1,
      explanation: 'Pampa, a 10th-century Jain poet, is widely regarded as the Adikavi (first poet) of Kannada literature.',
    ),
    QuizQuestion(
      id: 'q2',
      questionText: 'Which ancient empire was centered in Hampi?',
      options: ['Hoysala', 'Chalukya', 'Vijayanagara', 'Rashtrakuta'],
      correctOptionIndex: 2,
      explanation: 'The Vijayanagara Empire, one of the greatest empires in Indian history, had its capital in Hampi.',
    ),
    QuizQuestion(
      id: 'q3',
      questionText: 'How many Jnanpith Awards has Kannada literature won?',
      options: ['6', '7', '8', '9'],
      correctOptionIndex: 2,
      explanation: 'Kannada literature has won 8 Jnanpith Awards, the highest literary honor in India.',
    ),
    QuizQuestion(
      id: 'q4',
      questionText: 'Which river is considered the lifeline of Southern Karnataka?',
      options: ['Krishna', 'Tungabhadra', 'Godavari', 'Kaveri'],
      correctOptionIndex: 3,
      explanation: 'The Kaveri river is often referred to as the lifeline of Southern Karnataka, providing water for agriculture and drinking.',
    ),
  ];
}
