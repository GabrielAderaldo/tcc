import 'package:flutter/material.dart';
import 'package:tcc/App/Home/Model/reference_person.dart';
import 'package:tcc/App/Home/ViewModel/especification_view_model.dart';

class EspecificationPage extends StatefulWidget {
  final int index;
  final ReferencePerson referencePerson;
  const EspecificationPage({required this.referencePerson,required this.index, super.key});

  @override
  State<EspecificationPage> createState() => _EspecificationPageState();
}

class _EspecificationPageState extends State<EspecificationPage> {
  final EspecificationViewModel _especificationViewModel =
      EspecificationViewModel();

  @override
  void initState() {
    _especificationViewModel.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.referencePerson.fullName.toString()),
      ),
      body: Center(
        child: Text(widget.index.toString()),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Formularios'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
