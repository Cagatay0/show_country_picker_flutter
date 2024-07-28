import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
  });
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    double height = 52;
    double width = 300;
    double radius = 16;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                scrollPadding: const EdgeInsets.all(0),
                controller: textEditingController,
                focusNode: focusNode,
                style: textStyle(),
                onChanged: (value) => onChanged(value),
                decoration: InputDecoration(
                  hintText: "Write any country",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 12),
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 17,
      color: Colors.black,
    );
  }
}
