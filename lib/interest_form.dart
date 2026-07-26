// Ported "Anmäl intresse" form. On the live site this posts to Formspree;
// here submission is inert (see design.md Decision 7 / Non-Goals).

import 'package:flutter/material.dart';

import 'demo_action.dart';
import 'theme.dart';

class InterestForm extends StatefulWidget {
  const InterestForm({super.key});

  @override
  State<InterestForm> createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Anmäl intresse', style: Theme.of(context).textTheme.titleLarge),
          Text('ej bindande', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: MammaMindSpacing.xs),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Namn'),
            validator: (v) => (v == null || v.isEmpty) ? 'Ange namn' : null,
          ),
          const SizedBox(height: MammaMindSpacing.xs),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'E-post'),
            keyboardType: TextInputType.emailAddress,
            validator: (v) =>
                (v == null || !v.contains('@')) ? 'Ange giltig e-post' : null,
          ),
          const SizedBox(height: MammaMindSpacing.sm),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showDemoOnlyMessage(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MammaMindColors.accent,
              foregroundColor: MammaMindColors.textWhite,
            ),
            child: const Text('Skicka intresseanmälan'),
          ),
        ],
      ),
    );
  }
}
