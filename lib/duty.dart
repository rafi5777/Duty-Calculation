import 'package:flutter/material.dart';

class Duty extends StatefulWidget {
  const Duty({Key? key}) : super(key: key);

  @override
  State<Duty> createState() => _DutyState();
}

class _DutyState extends State<Duty> {
  @override
  Widget build(BuildContext context) {
    final _yen = TextEditingController();
    final _usd = TextEditingController();
    final _mes = TextEditingController();
    final _invoice = TextEditingController();
    final _yellow = TextEditingController();
    final _less = TextEditingController();
    final _adj = TextEditingController();
    final _duty = TextEditingController();
    final _tkF2 = TextEditingController();
    final _usdF1 = TextEditingController();
    double result;
    double resultCal;
    double? d1;
    double? f1;
    double f2;
    double? f3;
    double mesResult;
    double? invoice_calculation;
    num invoAddition;
    num invoPercent;
    num f11;
    num d11;
    num f33;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _yen,
                      decoration: const InputDecoration(
                          label: Text('¥EN'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _usd,
                        decoration: const InputDecoration(
                            label: Text('\$USD'), border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _mes,
                      decoration: const InputDecoration(
                          label: Text('Mes'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _invoice,
                        decoration: const InputDecoration(
                            label: Text('Invoice'),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _yellow,
                      decoration: const InputDecoration(
                          label: Text('Yellow Book Value'),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _less,
                        decoration: const InputDecoration(
                            label: Text('Less %'),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _usdF1,
                      decoration: const InputDecoration(
                          label: Text('\$USD'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _tkF2,
                        decoration: const InputDecoration(
                            label: Text('Taka'), border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _adj,
                      decoration: const InputDecoration(
                          label: Text('Adj'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text('TTI'), border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _duty,
                decoration: const InputDecoration(
                    label: Text('Duty'), border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  invoPercent = double.parse(_invoice.text) * 0.0201;
                  invoAddition = (double.parse(_invoice.text) + invoPercent) *
                      double.parse(_usd.text);
                  invoice_calculation=invoAddition as double?;


                  f11 = ((((double.parse(_yellow.text) - (double.parse(_yellow.text) * double.parse(_less.text) * 0.01)) * double.parse(_yen.text)) / double.parse(_usd.text)) + (double.parse(_mes.text) * 35))+invoPercent;
                  f1 = f11 as double?;
                  _usdF1.text = f1.toString();
                  f2 = (f1! * double.parse(_usd.text));
                  _tkF2.text = f2.toString();
                  // d11 = ((double.parse(_invoice.text) * 0.0201) +
                  //         double.parse(_invoice.text)) *
                  //     double.parse(_usd.text);
                  // d1 = d11 as double?;
                  f33 = f2 / invoice_calculation!;
                  f3 = double.parse(f33.toStringAsFixed(4));
                  // f3=f33.toStringAsFixed(3) as double;
                  // result=double.parse(_yellow.text)-(double.parse(_yellow.text)*double.parse(_less.text)*0.01);
                  //mesResult=double.parse(_mes.text)*35;

                  // resultCal=result;
                  _adj.text = f3.toString();
                  // showDialog(
                  //   context: context,
                  //   builder:(context)=>const AlertDialog(
                  //     title: Text('Duty Value'),
                  //   )
                  // );
                },
                child: const Text('Calculation'))
          ],
        ),
      ),
    );
  }
}
