import 'package:flutter/material.dart';
import 'package:tcc/App/Home/Service/home_service.dart';
import 'package:tcc/App/Home/View/component/rl_card.dart';
import 'package:tcc/App/Home/ViewModel/home_view_model.dart';
import 'package:tcc/App/infra/dio/dio_dto.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _homeViewModel.getReferencePersonList();
    _homeViewModel.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _homeViewModel.getReferencePersonList(),
        child: ListView.builder(
          itemCount: _homeViewModel.referencePersonList.length,
          itemBuilder: (context, index) {
            final listRPerson = _homeViewModel.referencePersonList[index];
            if(_homeViewModel.referencePersonList.isEmpty){
              return const Center(
                child: Text("Lista vazia"),
              );
            }
            
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: GestureDetector(
                  onTap: () => _homeViewModel.goToEspecificationScreen(ctx: context,index: index),
                  child: ReferencePersonCard(fullName: listRPerson.fullName ?? "NOME COMPLETO",
                  cpf: listRPerson.cpf ?? "CPF",
                  diagnosis: listRPerson.diagnosis ?? "DIAGNOSTICO"
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
