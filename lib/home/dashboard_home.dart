import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:graduation_dashboard/home/slots_details.dart';
import 'package:graduation_dashboard/home/total_earning.dart';
import 'package:graduation_dashboard/home/total_per_day.dart';
import 'package:graduation_dashboard/home/total_spaces.dart';

import '../login.dart';
import '../my_theme.dart';


class MyHomePage extends StatefulWidget {
  static const String routName = 'homeee';

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Smart Barking Dashboard',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Color(0xEA88581A)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/dash2.jpeg'),
                fit: BoxFit.fill)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              controller: sideMenu,
              style: SideMenuStyle(
                // showTooltip: false,
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: const Color(0x9156544C),
                  selectedColor: const Color(0x56544C83),
                  selectedTitleTextStyle: const TextStyle(color: Colors.black),
                  selectedIconColor: Colors.black,
                  unselectedTitleTextStyle:
                  const TextStyle(color: Colors.white),
                  unselectedIconColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: MyTheme.lightPrimaryColor),
              title: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    child: Image.asset(
                      'assets/images/dash1.PNG',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Divider(
                    indent: 8,
                    endIndent: 8,
                  ),
                ],
              ),
              footer: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'smart parking',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Total Spaces',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                    // Navigator.of(context).pop(SlotsDetails.routName);
                  },
                  icon: const Icon(Icons.free_cancellation_rounded),
                  // badgeContent: const Text(
                  //   '3',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  tooltipContent: "This is a tooltip for Dashboard item",
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Parking Slots',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                    // Navigator.of(context).pop(TotalEarning.routName);
                  },
                  icon: const Icon(Icons.details_sharp),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Total Earning',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                  icon: const Icon(Icons.money_outlined),
                  // trailing: Container(
                  //     decoration: const BoxDecoration(
                  //         color: Colors.amber,
                  //         borderRadius: BorderRadius.all(Radius.circular(6))),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 6.0, vertical: 3),
                  //       child: Text(
                  //         'New',
                  //         style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                  //       ),
                  //     )),
                ),
                // // SideMenuItem(
                // //   priority: 2,
                // //   title: 'Total Earning',
                // //   onTap:(page, _) {
                // //     sideMenu.changePage(page);
                // //   },
                // //   icon: const Icon(Icons.money_outlined),
                //   // trailing: Container(
                //   //     decoration: const BoxDecoration(
                //   //         color: Colors.amber,
                //   //         borderRadius: BorderRadius.all(Radius.circular(6))),
                //   //     child: Padding(
                //   //       padding: const EdgeInsets.symmetric(
                //   //           horizontal: 6.0, vertical: 3),
                //   //       child: Text(
                //   //         'New',
                //   //         style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                //   //       ),
                //   //     )),
                // // ),
                // SideMenuItem(
                //   priority: 3,
                //   title: 'Exit',
                //   onTap: (page, _) {
                //     sideMenu.changePage(page);
                //   },
                //   icon: const Icon(Icons.download),
                // ),
                // SideMenuItem(
                //   priority: 4,
                //   title: 'Settings',
                //   onTap: (page, _) {
                //     sideMenu.changePage(page);
                //   },
                //   icon: const Icon(Icons.settings),
                // ),
                // // SideMenuItem(
                // //   priority: 5,
                // //   onTap:(page){
                // //     sideMenu.changePage(5);
                // //   },
                // //   icon: const Icon(Icons.image_rounded),
                // // ),
                // // SideMenuItem(
                // //   priority: 6,
                // //   title: 'Only Title',
                // //   onTap:(page){
                // //     sideMenu.changePage(6);
                // //   },
                // // ),
                SideMenuItem(
                  priority: 3,
                  title: 'Total Car Number',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                  icon: Icon(Icons.text_rotation_down_sharp),
                ),
                SideMenuItem(
                  priority: 4,
                  title: 'Logout',
                  onTap: (_, page) {
                    Navigator.of(context).pushNamed(Login.routName);
                  },
                  icon: Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: page,
                children: [
                  Container(
                    // color: Colors.white,
                    child: Center(child: TotalSpaces()),
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: MyTheme.lightPrimaryColor)),
                    //color: Colors.white,
                    child: Center(child: SlotsDetails()),
                  ),
                  Container(
                    //color: Colors.white,
                    child: Center(child: TotalEarning()),
                  ),
                  Container(
                    //color: Colors.white,
                    child: Center(child: Totalnumberperday()),
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   child: Center(
                  //     child: ElevatedButton(
                  //       child: Text('Sign out'),
                  //       onPressed: () async {
                  //         await authBase.logout();
                  //         Navigator.of(context).pushReplacementNamed('login');
                  //       },
                  //     ),
                  //   ),
                  // ),

                  /*
                   Center(
          child: FlatButton(
            child: Text('Sign out'),
            onPressed: () async {
              await authBase.logout();
              Navigator.of(context).pushReplacementNamed('login');
            },
          ),
        ),
                   */
                  // Container(
                  //   color: Colors.white,
                  //   child: const Center(
                  //     child: Text(
                  //       'Download',
                  //       style: TextStyle(fontSize: 35),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   color: Colors.white,
                  //   child: const Center(
                  //     child: Text(
                  //       'Settings',
                  //       style: TextStyle(fontSize: 35),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   color: Colors.white,
                  //   child: const Center(
                  //     child: Text(
                  //       'Only Title',
                  //       style: TextStyle(fontSize: 35),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   color: Colors.white,
                  //   child: const Center(
                  //     child: Text(
                  //       'Only Icon',
                  //       style: TextStyle(fontSize: 35),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
