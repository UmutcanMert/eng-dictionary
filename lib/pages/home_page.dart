import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/initial_home_page.dart';
import 'package:flutter_application_1/pages/english_page.dart';
import 'package:flutter_application_1/pages/german_page.dart';
import 'package:flutter_application_1/pages/turkish_page.dart';


//stf statefull shorting
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  //list of pages for screen for the Tab
  List<Widget> widgetList = [
    const InitialHomePage(),
    const TurkishPage(),
    const EnglishPage(),
    const GermanPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Dictionary")),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            //profile
            const DrawerHeader(
              child: 
              Icon(
                Icons.person, 
                size: 50,
              )),
              // List of Items for menu
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/homepage");
                }, // when click on home button, it shows clicking visualizing
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("English Page"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/englishpage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Turkish Page"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/turkishpage");
                }, 
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("German Page"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/germanpage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/aboutpage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Help"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/helppage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  // go to specified page
                  Navigator.pushNamed(context, "/settingspage");
                },
              ),
          ],
        ),
      ), //the part opening from side
    bottomNavigationBar: BottomNavigationBar(
      //backgroundColor: Colors.lightBlueAccent,
      onTap: (index) {
        setState(() {
          myIndex = index;
        });
      },
      currentIndex: myIndex,

      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home,
          color: Colors.white,
          ),
          label: "Home",
          backgroundColor: Theme.of(context).colorScheme.primary),

          BottomNavigationBarItem(
          icon: const Icon(Icons.language,
          color: Colors.white,
          ),
          label: "Tr",
          backgroundColor: Theme.of(context).colorScheme.primary),

          BottomNavigationBarItem(
          icon: const Icon(Icons.language,
          color: Colors.white,
          ),
          label: "Eng",
          backgroundColor: Theme.of(context).colorScheme.primary),

          BottomNavigationBarItem(
          icon: const Icon(Icons.language,
          color: Colors.white,
          ),
          label: "Deu",
          backgroundColor: Theme.of(context).colorScheme.primary),
                                                                                                                           
      ]
    ),
    body: Center(
      child: widgetList[myIndex],
    ),
    ); //everything is widget
  }
}