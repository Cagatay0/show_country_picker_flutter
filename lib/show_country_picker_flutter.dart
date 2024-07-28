library show_country_picker_flutter;

import 'package:flutter/material.dart';
import 'package:show_country_picker_flutter/country_operation.dart';
import 'package:show_country_picker_flutter/text_field_widget.dart';

class ShowCountryPickerFlutter extends StatefulWidget {
  const ShowCountryPickerFlutter(
      {super.key,
      required this.textEditingController,
      required this.focusNode,
      required this.onTap,
      this.isDisplayDialCode = false});
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function onTap;

  final bool isDisplayDialCode;

  @override
  State<ShowCountryPickerFlutter> createState() =>
      _ShowCountryPickerFlutterState();
}

class _ShowCountryPickerFlutterState extends State<ShowCountryPickerFlutter> {
  @override
  void initState() {
    widget.textEditingController.text = "";

    getCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFieldWidget(
          textEditingController: widget.textEditingController,
          focusNode: widget.focusNode,
          onChanged: (value) => onChangeTextFieldFilter(value),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: filterCountryList.length,
            itemBuilder: (context, index) {
              return itemWidget(index);
            },
          ),
        ),
      ],
    );
  }

  Widget itemWidget(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => widget.onTap(filterCountryList[index]),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  richTextWidget(
                    filterCountryList[index]["flag"],
                    textStyle(true),
                  ),
                  const SizedBox(width: 10),
                  widget.isDisplayDialCode
                      ? SizedBox(
                          width: 40,
                          child: richTextWidget(
                            filterCountryList[index]["dialling_code"],
                            textStyle(false),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: richTextWidget(
                        filterCountryList[index]["name"],
                        textStyle(false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget richTextWidget(String text, TextStyle style) {
    return RichText(
      maxLines: 2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: text,
        style: style,
      ),
    );
  }

  TextStyle textStyle(bool isFlag) {
    return TextStyle(
      fontSize: isFlag ? 24 : 17,
      color: Colors.black,
    );
  }

  onChangeTextFieldFilter(String value) {
    String inputText = value.toLowerCase().replaceAll(' ', '');
    filterCountryList.clear();
    for (var element in countryList) {
      String name = element["name"].toLowerCase().replaceAll(' ', '');
      if (name.contains(inputText)) {
        filterCountryList.addAll([element]);
      }
    }
    setState(() {});
  }
}
