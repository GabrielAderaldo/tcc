import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc/App/Home/ViewModel/especification_view_model.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class ChartData {
  final String label;
  final int value;

  ChartData(this.label, this.value);
}

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final EspecificationViewModel _especificationViewModel =
      EspecificationViewModel();

  @override
  Widget build(BuildContext context) {
    final diasisMap = _especificationViewModel.contarItens(listOfDiagnosis);
    final cityMap = _especificationViewModel.contarItens(listOfCity);
    final stateMap = _especificationViewModel.contarItens(listOfState);

    List<ChartData> data = diasisMap.entries
        .map((entry) => ChartData(entry.key, entry.value))
        .toList();

    List<ChartData> data2 = cityMap.entries
        .map((entry) => ChartData(entry.key, entry.value))
        .toList();

    List<ChartData> data3 = stateMap.entries
        .map((entry) => ChartData(entry.key, entry.value))
        .toList();

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SfCircularChart(
              title: const ChartTitle(text: "Numero de casos"),
              legend: const Legend(isVisible: true),
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: data, // Dados do gráfico
                  xValueMapper: (ChartData data, _) => data.label, // Rótulo
                  yValueMapper: (ChartData data, _) => data.value, // Valor
                  dataLabelSettings: const DataLabelSettings(isVisible: true), // Exibe os valores nas fatias
                ),
              ],
            ),
            SfCircularChart(
              title: const ChartTitle(text: "Numero de paciente por cidade"),
              legend: const Legend(isVisible: true),
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: data2, // Dados do gráfico
                  xValueMapper: (ChartData data, _) => data.label, // Rótulo
                  yValueMapper: (ChartData data, _) => data.value, // Valor
                  dataLabelSettings: const DataLabelSettings(isVisible: true), // Exibe os valores nas fatias
                ),
              ],
            ),
            SfCircularChart(
              title: const ChartTitle(text: "Numero de paciente por estado"),
              legend: const Legend(isVisible: true),
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: data3, // Dados do gráfico
                  xValueMapper: (ChartData data, _) => data.label, // Rótulo
                  yValueMapper: (ChartData data, _) => data.value, // Valor
                  dataLabelSettings: const DataLabelSettings(isVisible: true), // Exibe os valores nas fatias
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
