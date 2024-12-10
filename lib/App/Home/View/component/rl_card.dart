import 'package:flutter/material.dart';

class ReferencePersonCard extends StatelessWidget {
  
  final String fullName;
  final String cpf;
  final String diagnosis;
  
  const ReferencePersonCard({required this.fullName,required this.cpf,required this.diagnosis,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Text("Nome completo :"),
            trailing: Text(fullName),
          ),
          ListTile(
            leading: const Text("CPF: "),
            trailing: Text(cpf),
          ),
          ListTile(
            leading: const Text("Diagnostico: "),
            trailing: Text(diagnosis),
          )
        ],
      ),
    );
  }
}