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
    _especificationViewModel.initDate();
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Nome completo: "),
                trailing: Text(widget.referencePerson.fullName!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Nome Social: "),
                trailing: Text(widget.referencePerson.socialName!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Nome da Mãe: "),
                trailing: Text(widget.referencePerson.motherName!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("NIS: "),
                trailing: Text(widget.referencePerson.nis!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("CPF: "),
                trailing: Text(widget.referencePerson.cpf!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("diagnostico: "),
                trailing: Text(widget.referencePerson.diagnosis!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("RG: "),
                trailing: Text("${widget.referencePerson.rg!.number!} | ${widget.referencePerson.rg!.uf!}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("A pessoa está em situação de risco ou abrigo: "),
                trailing: Text(widget.referencePerson.isShelter!.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Localização: "),
                trailing: Text(widget.referencePerson.localLocalization!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("cep: "),
                trailing: Text(widget.referencePerson.cep!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Endereço: "),
                trailing: Text(widget.referencePerson.adress!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Bairro: "),
                trailing: Text(widget.referencePerson.neighborhood!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Complemento: "),
                trailing: Text(widget.referencePerson.adressComplement!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Numero da casa: "),
                trailing: Text(widget.referencePerson.adressNumber!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Cidade: "),
                trailing: Text(widget.referencePerson.city!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Telefone: "),
                trailing: Text(widget.referencePerson.phone!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Estado: "),
                trailing: Text(widget.referencePerson.state!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Data de nascimento: "),
                trailing: Text(widget.referencePerson.birthDate!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: const Text("Genero biologico"),
                trailing: Text(widget.referencePerson.biologicalGender!),
              ),
            ),
          ],
        ),
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
              title: const Text('Graficos sobre os dados'),
              onTap:()=>_especificationViewModel.goToDataPage(ctx: context),
            )
          ],
        ),
      ),
    );
  }
}
