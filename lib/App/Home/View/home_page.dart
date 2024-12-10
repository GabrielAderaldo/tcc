import 'package:flutter/material.dart';
import 'package:tcc/App/Home/Service/home_service.dart';
import 'package:tcc/App/infra/dio/dio_dto.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeService _service = HomeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async {
          final teste = await _service.listReferencePerson(token: token);
          print(teste);
        }, child: const Text("data")),
      ),
    );
  }
}