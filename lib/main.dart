import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String? title = 'Handbook';
String? schoolLogo = 'assets/images/usls.png';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title!,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Gilgan',
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Image.asset(
                'assets/images/usls.png',
                height: 75,
                width: 75,
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
          backgroundColor: const Color(0xFF077428),
        ),
        drawer: SafeArea(child: Drawer(surfaceTintColor: Colors.white)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 40),
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 58,
                    width: 280,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'What do you want to know?',
                        hintStyle: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 16,
                          color: Color(0xFF02542D),
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF02542D),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xFF077428),
                          ),
                        ),
                        filled: false,
                        fillColor: Colors.grey,
                      ),
                      onChanged: (value) => (),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 16),
                    icon: Icon(Icons.info, color: Colors.grey, size: 32),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
