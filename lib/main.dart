// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TabBarExample(),
//     );
//   }
// }
//
// class TabBarExample extends StatefulWidget {
//   const TabBarExample({super.key});
//
//   @override
//   State<TabBarExample> createState() => _TabBarExampleState();
// }
//
// class _TabBarExampleState extends State<TabBarExample>
//     with SingleTickerProviderStateMixin {
//   late TabController _controller;
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 3, vsync: this);
//     _controller.addListener(() {
//       if (!_controller.indexIsChanging) {
//         setState(() => _selectedIndex = _controller.index);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tab Bar",style: TextStyle(color: Colors.white),),
//         centerTitle: true,
//         backgroundColor: Colors.pink,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(3, (index) {
//               final labels = ["Chat", "Status", "Call"];
//               final isSelected = _selectedIndex == index;
//               return Expanded(
//                 child: GestureDetector(
//                   onTap: () => _controller.animateTo(index),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 6),
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.pink : Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.pink, width: 1.5),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       labels[index],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.pink,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//           const SizedBox(height: 12),
//           Expanded(
//             child: TabBarView(
//               controller: _controller,
//               children: const [
//                 Center(child: Text("Chat UI")),
//                 Center(child: Text("Status UI")),
//                 CallListTab(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CallListTab extends StatelessWidget {
//   const CallListTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 20,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text("Call List $index"),
//           subtitle: const Text("Tab bar ui"),
//           trailing: const Icon(Icons.arrow_circle_right_rounded, size: 18),
//         );
//       },
//     );
//   }
// }













import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        setState(() => _selectedIndex = _controller.index);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tab Bar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              final labels = ["Chat", "Status", "Call"];
              final isSelected = _selectedIndex == index;
              return Expanded(
                // ❗ MODIFIED CODE: Replaced GestureDetector with InkWell
                child: InkWell(
                  onTap: () {
                    _controller.index = index;
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.pink : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.pink, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: const [
                Center(child: Text("Chat UI")),
                Center(child: Text("Status UI")),
                CallListTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CallListTab extends StatelessWidget {
  const CallListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Call List $index"),
          subtitle: const Text("Tab bar ui"),
          trailing: const Icon(Icons.arrow_circle_right_rounded, size: 18),
        );
      },
    );
  }
}