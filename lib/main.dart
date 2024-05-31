import 'package:add_to_cart/cart_screen.dart';
import 'package:add_to_cart/database/database_provider.dart';
import 'package:add_to_cart/product_screen.dart';
import 'package:add_to_cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider())
      ],
      child: MaterialApp(
        title: "cart screen",
        debugShowCheckedModeBanner: false,
        home: CartScreen(),
      ),
    );
  }
}





// class PatternApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pattern Generator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Pattern Generator',
//             style: TextStyle(color: Colors.white),
//           ),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.blue, Colors.green],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//           ),
//         ),
//         body: PatternGenerator(),
//       ),
//     );
//   }
// }

// class PatternGenerator extends StatefulWidget {
//   @override
//   _PatternGeneratorState createState() => _PatternGeneratorState();
// }

// class _PatternGeneratorState extends State<PatternGenerator> {
//   final TextEditingController _controller = TextEditingController();
//   String pattern = '';
//   PatternType _selectedPattern = PatternType.Diamond;

//   void generateDiamondPattern(int n) {
//     String result = '';
//     for (int i = 1; i <= n; i++) {
//       for (int j = n; j > i; j--) {
//         result += " ";
//       }
//       for (int k = 1; k <= i; k++) {
//         result += " *";
//       }
//       result += "\n";
//     }
//     for (int i = n - 1; i >= 1; i--) {
//       for (int j = n; j > i; j--) {
//         result += " ";
//       }
//       for (int k = 1; k <= i; k++) {
//         result += " *";
//       }
//       result += "\n";
//     }
//     setState(() {
//       pattern = result;
//     });
//   }

//   void generateSquarePattern(int n) {
//     String result = '';
//     for (int i = 0; i < n; i++) {
//       for (int j = 0; j < n; j++) {
//         result += "* ";
//       }
//       result += "\n";
//     }
//     setState(() {
//       pattern = result;
//     });
//   }

//   void generateTrianglePattern(int n) {
//     String result = '';
//     for (int i = 0; i < n; i++) {
//       for (int j = 0; j <= i; j++) {
//         result += "* ";
//       }
//       result += "\n";
//     }
//     setState(() {
//       pattern = result;
//     });
//   }

//   void generatePattern(int n) {
//     switch (_selectedPattern) {
//       case PatternType.Diamond:
//         generateDiamondPattern(n);
//         break;
//       case PatternType.Square:
//         generateSquarePattern(n);
//         break;
//       case PatternType.Triangle:
//         generateTrianglePattern(n);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(19.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 233, 226, 226),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: TextField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter number of rows',
//                 border: InputBorder.none,
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _controller.clear();
//                   },
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           DropdownButton<PatternType>(
//             value: _selectedPattern,
//             onChanged: (PatternType? newValue) {
//               setState(() {
//                 _selectedPattern = newValue!;
//               });
//             },
//             items: PatternType.values
//                 .map<DropdownMenuItem<PatternType>>((PatternType value) {
//               return DropdownMenuItem<PatternType>(
//                 value: value,
//                 child: Text(value.toString().split('.').last),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               int n = int.tryParse(_controller.text) ?? 0;
//               if (n <= 0) {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Error"),
//                       content: Text("Please enter a valid number."),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("OK"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 generatePattern(n);
//               }
//             },
//             child: Text(
//               'Generate Pattern',
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.blue),
//               elevation: MaterialStateProperty.all(0), // Removes shadow
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Text(
//                 pattern,
//                 style: TextStyle(
//                     fontSize: 18, color: Color.fromARGB(255, 20, 208, 221)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// enum PatternType {
//   Diamond,
//   Square,
//   Triangle,
// }
