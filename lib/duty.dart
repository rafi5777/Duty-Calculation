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
    double f2;
    double? f3;
    double? invoiceCalculation;
    double? assesableValues;
    double tti;
    double ttiWithAssesable;
    double fisCondition;
    double secCondition;
    double thrCondition;

    num ttii;
    num invoAddition;
    num invoPercent;
    num f11;
    num f33;

    num fiCondition;
    num seCondition;
    num thCondition;

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
                    ),),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _usd,
                        decoration: const InputDecoration(
                            label: Text('\$USD'), border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),),),],),),
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
                    ),),
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
                      ),),),],),),
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
                    ),),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _less,
                        decoration: const InputDecoration(
                            label: Text('Less %'),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),),),],),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _tti,
                        decoration: const InputDecoration(
                            label: Text('TTI'), border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),),),
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
                      ),),),],),),
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
                    ),),],),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _duty,
                decoration: const InputDecoration(
                    label: Text('Duty'), border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),),
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
                  f1 = double.parse(f11.toStringAsFixed(3));
                  _usdF1.text = f1.toString();
                  f2 = double.parse(
                      (f1! * double.parse(_usd.text)).toStringAsFixed(3));
                  _tkF2.text = f2.toString();
                  f33 = f2 / invoiceCalculation!;
                  f3 = double.parse(f33.toStringAsFixed(4));
                  tti = double.parse(_tti.text) / 100;
                  ttii = tti;
                  assesableValues =
                      double.parse((invoAddition * f3!).toStringAsFixed(3));
                  ttiWithAssesable = (assesableValues! * ttii);
                  _adj.text = f3!.toString();
                  //_duty.text = fisCondition.toString();

                    if (ttiWithAssesable <= 500000) {
                      fisCondition = 500000 * 0.01 * .25;

                    }
                  _duty.text = fisCondition.toString();

                  // fiCondition= fisCondition;
                  },
                child: const Text('Calculation'))],),),);}}
