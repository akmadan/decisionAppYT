import 'package:decisionlite/services/functions/firebaseFunctions.dart';
import 'package:decisionlite/services/providers/pollProvider.dart';
import 'package:decisionlite/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDecision extends StatefulWidget {
  const AddDecision({Key? key}) : super(key: key);

  @override
  _AddDecisionState createState() => _AddDecisionState();
}

class _AddDecisionState extends State<AddDecision> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PollsProvider>(
        builder: (context, model, child) => Container(
          padding: EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PollsContainer(),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        saveDecision(model.pollsWeights, model.pollTitle);
                      }
                      //
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Decision Uploaded')));
                    },
                    child: Text('Upload decision'))
                // ElevatedButton(
                //   onPressed: () {}, child: Text('Add Poll'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
