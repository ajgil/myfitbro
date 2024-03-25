import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/features/presentation/screens/wods/providers/counter_provider.dart';
import 'package:myfitbro/features/presentation/screens/wods/providers/weight_provider.dart';
import 'package:myfitbro/features/state_management.dart';

class AddItem extends ConsumerWidget {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  AddItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // contadores
    final counter = ref.watch(counterProvider);
    final weight = ref.watch(weightProvider);
    final isDarkMode = ref.watch(darkModeProvider);
    final wodName = ref.watch(wodNameProvider);
    final textStyles = Theme.of(context).textTheme;

    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xffffffff).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              wodName,
              style: const TextStyle(fontSize: 15),
            ),
             TextButton.icon(
              icon: const Icon(
                Icons.refresh_rounded,
                size: 20,
              ),
              //label: Text(wodName, style: const TextStyle(fontSize: 20)),
              label: const Text('nombre aleatorio'),
              onPressed: () {
                ref.read(wodNameProvider.notifier).changeWodName(Random(3) as String);
              },
            ),
            IconButton(
              icon: Icon(
                isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 20,
              ),
              onPressed: () {
                ref.read(darkModeProvider.notifier).toggleDarkMode();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text('Cantidad Reps', style: textStyles.titleSmall),
            TextButton.icon(
              icon: const Icon(
                Icons.add,
                size: 20,
              ),
              label: Text('$counter', style: const TextStyle(fontSize: 40)),
              onPressed: () {
                ref.read(counterProvider.notifier).increaseByOne();
              },
            ),
            /*
          CustomTextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            label: 'Repeticiones',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Missing quantity reps';
              }
              return null;
            },
       
          ),
          */
            const SizedBox(
              height: 5,
            ),
            Text('Peso Kgs', style: textStyles.titleSmall),
            TextButton.icon(
              icon: const Icon(
                Icons.add,
                size: 20,
              ),
              label: Text('$weight', style: const TextStyle(fontSize: 40)),
              onPressed: () {
                ref.read(weightProvider.notifier).increaseByTwo();
              },
            ),
            /*
            CustomTextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              label: 'Peso',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Missing weight';
                }
                return null;
              },
            ),
            */
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final weight = int.tryParse(weightController.text);
                final quantity = int.tryParse(quantityController.text);

                if (weight != null && quantity != null) {
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
      ),
    );
  }
  /*
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
  */
}
