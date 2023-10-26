import 'package:flutter/material.dart';
import 'package:bbbb/Dashboard/WindowPage.dart';
import 'package:bbbb/Dashboard/shipmentpage.dart';
import 'package:bbbb/Dashboard/NotificationPage.dart';
import 'package:bbbb/Dashboard/userprofile.dart';
import 'package:bbbb/Dashboard/DashboardBox.dart';
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

if (index == 0) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WindowPage()));
      } else if (index == 1) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShipmentPage()));
      } else if (index == 2) {
        // Navigate to UserProfilePage
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfilePage()));
      } else if (index == 3) {
        // Navigate to NotificationPage
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Dashboard",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0), // Top padding for the search bar
            child: Container(
              width: 500.0,
              height: 50, // Search bar ki width
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white, // Border color
                  width: 2.0, // Border width
                ),
              ),
              padding: EdgeInsets.all(5.0), // Padding around the search bar
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey, // Icon color
                  ),
                  SizedBox(width: 10.0), // Spacing between icon and TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search", // Placeholder text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none, // Text field ka border hide karein
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              // Your dashboard content goes here
            ),
          ),
        ],
      ),
   bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed, // Fixed type bottom navigation bar
  showSelectedLabels: false, // Selected label ko hide karein
  showUnselectedLabels: false, // Unselected labels ko hide karein
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.window),
      label: 'Window',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_shipping),
      label: 'Shipment',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'User Profile',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.blue,
  onTap: _onItemTapped,
),


    );   
  }
}
