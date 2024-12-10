import 'package:flutter/material.dart';
import 'package:tcc/App/Home/ViewModel/home_view_model.dart';

class AddReferencePersonComponent extends StatelessWidget {
  const AddReferencePersonComponent({
    super.key,
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextField(
          controller: _homeViewModel.fullNameController,
          decoration: const InputDecoration(
            label: Text('Nome Completo'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.socialNameController,
          decoration: const InputDecoration(
            label: Text('Nome social'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.motherNameController,
          decoration: const InputDecoration(
            label: Text('Nome da mãe'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.cpfController,
          decoration: const InputDecoration(
            label: Text('cpf'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.nisController,
          decoration: const InputDecoration(
            label: Text('nis'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.diagnosisController,
          decoration: const InputDecoration(
            label: Text('Diagnostico'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _homeViewModel.cityController,
          decoration: const InputDecoration(
            label: Text('Cidade'),
            border: OutlineInputBorder(),
          ),
        ),
        DropdownMenu(
          onSelected: (String? value) => _homeViewModel.setDropDownValue(newDropDownValue: value!),
          initialSelection: _homeViewModel.stateList.first,
          dropdownMenuEntries: _homeViewModel.stateList.map((e)=> DropdownMenuEntry(value: e, label: e)).toList()
          ),
          Row(
          children: [
            Expanded(child: ListTile(leading: const Text("Masculino"),trailing: Radio(value: RadiuValue.Masculino, groupValue: _homeViewModel.radiuValue, onChanged: (value)=> _homeViewModel.setRadiuValue(newRadiuValue: value!)))),
            Expanded(child: ListTile(leading: const Text("Feminino"),trailing: Radio(value: RadiuValue.Feminino, groupValue: _homeViewModel.radiuValue, onChanged: (value)=> _homeViewModel.setRadiuValue(newRadiuValue: value!))))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: _homeViewModel.createReferencePerson, child: const Text("Criar uma nova pessoa de referencia")),
        )
      ],
    );
  }
}

