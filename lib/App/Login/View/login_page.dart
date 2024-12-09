import 'package:flutter/material.dart';
import 'package:tcc/App/Login/Service/login_service.dart';
import 'package:tcc/App/Login/ViewModel/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _viewModel = LoginViewModel();

  @override
  void initState() {
    _viewModel.addListener((){
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch(_viewModel.state){
        LoginPageState.idle => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text("CONECTA RAROS"),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ListView(
                children: [
                  Padding(padding: const EdgeInsets.all(20),child: TextField(
                    controller: _viewModel.loginController,
                    decoration: const InputDecoration(
                      label: Text("Login"),
                      border: OutlineInputBorder()
                    ),
                   ),
                  ),

                  Padding(padding: const EdgeInsets.all(20),child: TextField(
                    controller: _viewModel.passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Pass"),
                      border: OutlineInputBorder()
                    ),
                   ),
                  ),

                  Padding(padding: const EdgeInsets.all(20),child: ElevatedButton(onPressed: 
                  () async {
                    
                    _viewModel.login();
                  }, child: const Text("ACESSAR")),)

                ],
              ),
            ),
            const Center(
              child: Text("Versão em teste de tcc, feito por Gabriel Aderaldo"),
            )
          ],
          )
        ),
        LoginPageState.sucess => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login feito com sucesso!"),
              ElevatedButton(onPressed: (){
                _viewModel.goToHome(ctx: context);
              }, child: const Text("Ir para a tela de home"))
            ],
          ),
        ),
        LoginPageState.error => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_outlined,color: Colors.red),
              Text(_viewModel.error),
              ElevatedButton(onPressed: (){
                _viewModel.resetScreen();
              }, child: const Text("Voltar a tela de inicio"))
            ],
          ),
        ),
      },
    );
  }
}