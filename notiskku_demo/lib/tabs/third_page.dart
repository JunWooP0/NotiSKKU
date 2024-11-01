import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool editMode = false;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/greenlogo.png',
                      width: 40,
                    ),
                    const Text(
                      '공지보관함',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          editMode = true;
                        },
                        child: const Text(
                          '편집',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
