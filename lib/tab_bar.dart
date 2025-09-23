import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My Profile",style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.grey[400],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
            ),
            leading: Icon(
              Icons.menu,
            ),
            iconTheme: IconThemeData(color: Colors.white),
            toolbarHeight: 90,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 250,
                child: Center(child: Text("Profile Details Goes here")),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.blue,
                  bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          )
                        )
                      ),
                      tabs:[
                        Tab(
                          icon: Icon(Icons.directions_bike,color: Colors.white,),
                        ),
                Tab(
                    icon: Icon(
                      Icons.directions_car,color: Colors.white,
                    ),
                ),
                      ]
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                      children:[ Container(
                        color: Colors.red,
                        child: Center(
                          child: Text("bike"),
                        ),
                      ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("car"),
                  ),
                ),
                ]
                  )
              )
            ],
          ),
        )
    );
  }
}
