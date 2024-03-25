import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfitbro/features/state_management.dart';

class EditItem extends ConsumerStatefulWidget {
  final int id;
  final String currentWeight;
  final int currentQuantity;
  const EditItem({
    super.key,
    required this.id,
    required this.currentWeight,
    required this.currentQuantity,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditItemState();
}

class _EditItemState extends ConsumerState<EditItem> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    weightController.text = widget.currentWeight;
    quantityController.text = widget.currentQuantity.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    // Eliminar item
                    ref.read(cartListProvider.notifier).delete(widget.id);
                    // Ocultar modal
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
          TextField(
            controller: weightController,
             keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Nombre del producto'),
          ),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              final weight = int.tryParse(weightController.text);
              final quantity = int.tryParse(quantityController.text);

              if (weight != null && quantity != null) {
                // Actualizar item en la lista
                ref.read(cartListProvider.notifier).edit(
                      widget.id,
                      weight,
                      quantity,
                    );

                // Limpiar campos
                weightController.clear();
                quantityController.clear();

                // Ocultar modal
                Navigator.of(context).pop();
              }
            },
            child: const Text('Actualizar'),
          ),
        ],
      ),
    );
  }
}