import 'package:flutter/material.dart';
import 'package:tcc/App/Home/View/component/rl_card.dart';
import 'package:tcc/App/Home/ViewModel/home_view_model.dart';
class ListReferencePersonComponent extends StatelessWidget {
  const ListReferencePersonComponent({
    super.key,
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
                onTap: () => _homeViewModel.goToEspecificationScreen(ctx: context,index: index,referencePerson: listRPerson),
                child: ReferencePersonCard(fullName: listRPerson.fullName ?? "NOME COMPLETO",
                cpf: listRPerson.cpf ?? "CPF",
                diagnosis: listRPerson.diagnosis ?? "DIAGNOSTICO"
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
