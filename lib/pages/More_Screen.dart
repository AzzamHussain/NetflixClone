import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title:
                const Text("New & hot", style: TextStyle(color: Colors.white)),
            actions: [
              Icon(
                Icons.cast,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 25,
                  width: 25,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              tabs: const [
                Tab(
                  text: "Coming Soon",
                ),
                Tab(
                  text: " Everyone'",
                ),
              ],
            ),
          ),
        )));
  }
}
