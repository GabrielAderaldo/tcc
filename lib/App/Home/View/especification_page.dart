import 'package:flutter/material.dart';

class EspecificationPage extends StatefulWidget {
  final int index;
  const EspecificationPage({required this.index,super.key});

  @override
  State<EspecificationPage> createState() => _EspecificationPageState();
}

class _EspecificationPageState extends State<EspecificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.index.toString()),
      ),
    );
  }
}