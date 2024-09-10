import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../widgets/decimal_text_input_formatter.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.groupDocId});

  final String groupDocId;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _formKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final expenseNameController = TextEditingController();
  final expenseAmountController = TextEditingController();

  ColorSeed groupColor = ColorSeed.baseColor;
  final NumberFormat numFormat = NumberFormat('###,##0.00', 'en_US');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    expenseNameController.dispose();
    expenseAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double spacing = 10;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.createNewExpense,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      const SizedBox(height: spacing),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: expenseNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .expenseNameValidationEmpty;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: AppLocalizations.of(context)!.expenseName,
                        ),
                      ),
                      const SizedBox(height: spacing),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: expenseAmountController,
                        inputFormatters: [
                          DecimalTextInputFormatter(decimalRange: 2)
                        ],
                        onFieldSubmitted: (value) {
                          final formattedPrice =
                              numFormat.format(double.parse(value));
                          debugPrint('Formatted $formattedPrice');
                          expenseAmountController.value = TextEditingValue(
                            text: formattedPrice,
                            selection: TextSelection.collapsed(
                                offset: formattedPrice.length),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .expenseAmountValidationEmpty;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText:
                              AppLocalizations.of(context)!.expenseAmount,
                        ),
                      ),
                      const SizedBox(height: spacing),
                      FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var amount =
                                  double.parse(expenseAmountController.text);

                              db
                                  .collection("groups")
                                  .doc(widget.groupDocId)
                                  .collection("expenses")
                                  .add({
                                "name": expenseNameController.text,
                                "amount": amount,
                                "createdBy": auth.currentUser?.uid,
                                "createdAt": FieldValue.serverTimestamp(),
                              }).then((documentSnapshot) {
                                db
                                    .collection("groups")
                                    .doc(widget.groupDocId)
                                    .collection("expenses")
                                    .aggregate(sum("amount"))
                                    .get()
                                    .then((AggregateQuerySnapshot
                                        aggregateSnapshot) {
                                  db
                                      .collection("groups")
                                      .doc(widget.groupDocId)
                                      .update({
                                    "sumAmount":
                                        aggregateSnapshot.getSum("amount") ??
                                            0.0
                                  }).then(
                                    (value) {
                                      Navigator.pop(context);
                                    },
                                  );
                                });
                              });
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.create))
                    ],
                  )))),
    );
  }
}
