import 'package:flutter/material.dart';
import 'package:tcc/App/Home/View/component/add_reference_person_component.dart';
import 'package:tcc/App/Home/View/component/list_reference_person_component.dart';
import 'package:tcc/App/Home/ViewModel/home_view_model.dart';


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
      body: switch(_homeViewModel.state){
        
        // TODO: Handle this case.
        HomePageState.idle => _homeViewModel.currentPageIndex == 0 ? ListReferencePersonComponent(homeViewModel: _homeViewModel) : AddReferencePersonComponent(homeViewModel: _homeViewModel),
        // TODO: Handle this case.
        HomePageState.sucess => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Pessoa de referencia criada com sucesso!"),
              ElevatedButton(onPressed: (){
                _homeViewModel.resetScreen();
              }, child: const Text("Voltar a tela de inicio"))
            ],
          ),
        ),
        // TODO: Handle this case.
        HomePageState.error => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_outlined,color: Colors.red),
              Text(_homeViewModel.errorMessage),
              ElevatedButton(onPressed: (){
                _homeViewModel.resetScreen();
              }, child: const Text("Voltar a tela de inicio"))
            ],
          )
          ),
      },

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => _homeViewModel.setCurrentPageIndex(newIndex: value),
        selectedIndex: _homeViewModel.currentPageIndex,
        destinations: const <Widget> [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Cadastro de nova pessoa de referencia'),
        ],
      ),
    );
  }
}
