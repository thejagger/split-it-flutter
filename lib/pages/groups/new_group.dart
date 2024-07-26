import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';

class NewGroup extends StatefulWidget {
  const NewGroup(
      {super.key,
      required this.colorSelected,
      required this.handleColorSelect});

  final ColorSeed colorSelected;
  final void Function(int) handleColorSelect;

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  final _formKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;
  final groupNameController = TextEditingController();
  final groupColorController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    groupNameController.dispose();
    groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        expand: false,
        builder: (BuildContext _, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.createNewGroup,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                        const SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: groupNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .groupNameValidationEmpty;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.groupName,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 4),
                            padding: const EdgeInsets.all(8),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: ColorSeed.values.length,
                            itemBuilder: (context, i) {
                              return IconButton(
                                  icon:
                                      const Icon(Icons.radio_button_unchecked),
                                  selectedIcon:
                                      const Icon(Icons.radio_button_checked),
                                  color: ColorSeed.values[i].color,
                                  isSelected: widget.colorSelected ==
                                      ColorSeed.values[i],
                                  onPressed: () {
                                    widget.handleColorSelect(i);
                                  });
                            }),
                        const SizedBox(height: 20),
                        FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                db.collection("groups").add({
                                  "name": groupNameController.text,
                                  "color_seed_hash": widget.colorSelected.color.value.toRadixString(16)
                                }).then((documentSnapshot) =>
                                    {Navigator.pop(context)});
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.create))
                      ],
                    ))),
          );
        });
  }
}
