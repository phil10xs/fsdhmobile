import 'package:flutter/material.dart';
import 'package:fsdh_mobile/model/constants.dart';
import 'package:fsdh_mobile/view-model/report.dart';
import 'package:fsdh_mobile/views/utils/validators.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({Key? key}) : super(key: key);

  @override
  _AddNewExpenseState createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  static final GlobalKey<FormState> _addKeyLogin = GlobalKey<FormState>();
  final _labelNode = FocusNode();
  final _labelCtrl = TextEditingController();
  final _amountNode = FocusNode();
  final _amountCtrl = TextEditingController();
  String _weekValue = '1';

  @override
  void dispose() {
    _labelNode.dispose();
    _labelCtrl.dispose();
    _amountNode.dispose();
    _amountCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: Form(
              key: _addKeyLogin,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'INPUT EXPENSES',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => App.pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    InputDecorator(
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.only(left: 12, right: 12, top: 8),
                          labelText: 'Week number',
                          errorText: validateRequired(
                            'Week',
                            'Week',
                          )),
                      child: DropdownButton<String?>(
                        underline: Container(height: 0),
                        value: _weekValue,
                        isExpanded: true,
                        disabledHint: Text(
                          'Weeks',
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onChanged: (name) {
                          setState(() {
                            _weekValue = name!;
                          });
                        },
                        items: <DropdownMenuItem<String?>>[
                          for (final week in weeks)
                            DropdownMenuItem<String?>(
                              value: week['value'],
                              key: ValueKey(week),
                              child: Text(
                                week['label']!,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      focusNode: _labelNode,
                      controller: _labelCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Label/Category',
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) => validateRequired(value!, 'Label'),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_labelNode);
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      focusNode: _amountNode,
                      controller: _amountCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      validator: (value) => validateRequired(value!, 'Number'),
                      onEditingComplete: () {
                        _amountNode.unfocus();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FlatButton(
                          key: GlobalKey<State>(debugLabel: 'login-button'),
                          color: Colors.blue,
                          onPressed: () {
                            if (_addKeyLogin.currentState!.validate()) {
                              Provider.of<ReportNotifier>(
                                context,
                                listen: false,
                              ).addBudget(
                                _weekValue,
                                _labelCtrl.text,
                                _amountCtrl.text,
                              );
                              App.pop();
                            }
                          },
                          child: const Text(
                            'ADD EXPENSE',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
