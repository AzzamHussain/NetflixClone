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
          title: const Text("New & hot", style: TextStyle(color: Colors.white)),
          actions: [
            Icon(
              Icons.cast,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 25,
                width: 25,
              ),
            )
          ],
        ))));
  }
}
