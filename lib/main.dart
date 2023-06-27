import 'dart:math';
import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String buttonText = "Click me";
  int numberOfClicks = 0;
  int randomNumber1 = 0;
  int randomNumber2 = 0;
  int randomNumber3 = 0;
  int currentIndex = 0;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: currentIndex == 0
            ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonText = "Button clicked";
                          numberOfClicks++;
                          if (numberOfClicks > 100) {
                            numberOfClicks = 0;
                          }
                          randomNumber1 = Random().nextInt(255);
                          randomNumber2 = Random().nextInt(255);
                          randomNumber3 = Random().nextInt(255);
                        });
                        debugPrint("Button clicked $numberOfClicks times");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(
                            255,
                            randomNumber1,
                            randomNumber2,
                            randomNumber3,
                          ),
                        ),
                      ),
                      child: Text(buttonText),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.yellow,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Page2()),
                        );
                      },
                      child: const Text("Go to page 2"),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked
                    ? Image.asset("images/nature.jpg")
                    : Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoYjIuIOXwvoaCpma0TB-ACKTo9M3cWr4OLQ"),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
