import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/features/shared/widgets/custom_text_form_field.dart';
import 'package:myfitbro/features/shared/widgets/widgets.dart';
import 'package:myfitbro/features/state_management.dart';

class AddItem extends ConsumerWidget {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  AddItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            label: 'Repeticiones',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Missing the verification code';
              }
              return null;
            },
            //decoration: const InputDecoration(labelText: ''),
          ),
          CustomTextFormField(
            controller: weightController,
            keyboardType: TextInputType.number,
            label: 'Peso',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Missing the verification code';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              final weight = int.tryParse(weightController.text);
              final quantity = int.tryParse(quantityController.text);
              print('peso: $weight, cantidad: $quantity');

              if (weight != null && quantity != null) {
                // int nextId = ref.read(cartListProvider.notifier).countTotalItems();
                // Añadir item a la lista
                ref.read(cartListProvider.notifier).add(
                      CartItem(
                        name: weight,
                        quantity: quantity,
                        inCart: false,
                      ),
                    );

                // Limpiar campos
                weightController.clear();
                quantityController.clear();

                // Ocultar modal
                Navigator.of(context).pop();
              }
            },
            child: const Text('Añadir a la lista'),
          ),
        ],
      ),
    );
  }
}
