import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sub_tracker/global_widget/dropdown/drop_down_field_controller.dart';

class DropDownField<T> extends StatelessWidget {
  final DropDownFieldController ddController =
      Get.put(DropDownFieldController());

  final List<T> items;
  final TextEditingController controller;
  final void Function(T?)? onChange;
  final String hint;
  final T currentValue;
  final String Function(T) itemLabelBuilder;

  DropDownField(
      {super.key,
      required this.controller,
      required this.currentValue,
      required this.items,
      required this.hint,
      this.onChange,
      required this.itemLabelBuilder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(() {
          return Expanded(
            child: TextField(
              onTap: () {
                Get.log("masuk sini");
                ddController.isShowDrop.value = !ddController.isShowDrop.value;
              },
              controller: controller,
              showCursor: false,
              decoration: InputDecoration(
                  labelText: hint,
                  suffixIcon: const Icon(Icons.arrow_drop_down_sharp)),
            ),
          );
        }),
        const SizedBox(
          width: 8,
        ),

      ],
    );
  }

  Widget showDropDown() {
    return DropdownButton(
      items: items.map((T item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            itemLabelBuilder(item),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        onChange!(newValue);
      },
    );
  }
}
