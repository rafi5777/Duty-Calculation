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
    final _tti = TextEditingController();

    double? f1;
    double? f2;
    double? f3;
    double? invoiceCalculation;
    double assesableValues = 0;
    double? tti;
    double ttiWithAssesable = 0;
    double fisCondition = 0;
    double fisConditionOne = 0;
    double secCondition = 0;
    double secConditionOne = 0;
    double thrCondition = 0;
    double thrConditionOne = 0;
    double lastValue = 0;
    double invoPercent;
    double totalDuty;
    num totalDutyValue;

    double firstCheckValue = 0;
    double secondCheckValue = 0;
    double thirdCheckValue = 0;

    num? ttii;
    num? invoAddition;
    num? f11;
    num? f33;

    return Scaffold(
      appBar: AppBar(
        title: Text('Duty Calculation'),
      ),
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
                    child: TextField(
                      controller: _usd,
                      decoration: const InputDecoration(
                          label: Text('\$USD'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
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
                    child: TextField(
                      controller: _invoice,
                      decoration: const InputDecoration(
                          label: Text('Invoice'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
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
                    child: TextField(
                      controller: _less,
                      decoration: const InputDecoration(
                          label: Text('Less %'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
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
                      controller: _tti,
                      decoration: const InputDecoration(
                          label: Text('TTI'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _tkF2,
                      decoration: const InputDecoration(
                          label: Text('Taka'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
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
                  Flexible(
                    child: TextField(
                      controller: _usdF1,
                      decoration: const InputDecoration(
                          label: Text('\$USD'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
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
                  //con double to num
                  invoiceCalculation = invoAddition as double?;

                  f11 = ((((double.parse(_yellow.text) -
                                      (double.parse(_yellow.text) *
                                          double.parse(_less.text) *
                                          0.01)) *
                                  double.parse(_yen.text)) /
                              double.parse(_usd.text)) +
                          (double.parse(_mes.text) * 35)) +
                      invoPercent;
                  f1 = double.parse(f11!.toStringAsFixed(3));
                  _usdF1.text = f1.toString();
                  f2 = double.parse(
                      (f1! * double.parse(_usd.text)).toStringAsFixed(3));
                  _tkF2.text = f2.toString();
                  f33 = (f2! / invoiceCalculation!);

                  f3 = double.parse(f33!.toStringAsFixed(5));
                  double getNumber(double f3, {int precision = 2}) =>
                      double.parse('$f3'
                          .substring(0, '$f3'.indexOf('.') + precision + 1));

                  var output = getNumber(f3!, precision: 4) + 0.0001; // 113.9

                  tti = double.parse(_tti.text) / 100;
                  ttii = tti as num;
                  assesableValues =
                      double.parse((invoAddition! * output).toStringAsFixed(4));
                  ttiWithAssesable = double.parse(
                      (assesableValues * ttii!).toStringAsFixed(4));
                  _adj.text = output.toString();

                  // _duty.text = assesableValues.toString();

                  if (assesableValues >= 500000) {
                    fisCondition = 500000 * 0.01 * 0.25;
                    firstCheckValue = (assesableValues - 500000);
                  } else {
                    fisConditionOne = assesableValues * 0.01 * 0.25;
                  }
                  //fiCondition=fisConditionOne as num;
                  if (firstCheckValue >= 500000) {
                    secCondition = 500000 * 0.0075 * 0.25;
                    secondCheckValue = (firstCheckValue - 500000);
                  } else {
                    secConditionOne = firstCheckValue * 0.0075 * 0.25;
                  }
                  if (secondCheckValue >= 1000000) {
                    thrCondition = 1000000 * 0.005 * 0.25;
                    thirdCheckValue = (secondCheckValue - 1000000);
                  } else {
                    thrConditionOne = secondCheckValue * 0.005 * 0.25;
                  }
                  lastValue = thirdCheckValue * 0.0025 * 0.25;

                  totalDuty = fisCondition +
                      fisConditionOne +
                      secCondition +
                      secConditionOne +
                      thrCondition +
                      thrConditionOne +
                      lastValue +
                      30;
                  double total = double.parse(totalDuty.toStringAsFixed(4)) +
                      ttiWithAssesable;
                 totalDutyValue = total;
                  _duty.text = totalDutyValue.toString();

                },
                child: const Text('       Calculation      '))
          ],
        ),
      ),
    );
  }
}
