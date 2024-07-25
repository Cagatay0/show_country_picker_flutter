library show_country_picker_flutter;

import 'package:flutter/material.dart';
import 'package:show_country_picker_flutter/country_operation.dart';

class CountryListWidget extends StatefulWidget {
  const CountryListWidget({super.key});

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  CountryOperation _countryOperation = CountryOperation();
  @override
  void initState() {
    _countryOperation.getCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const ContactAndCountryFilterTextFieldWidget(
        //   isContactTextField: true,
        //   isCountryViewTextField: true,
        // ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            // itemCount: phoneNumberController.filterCountryList.length,
            itemCount: 1,
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            // onTap: () => phoneNumberController.selectedCountry(index),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  // Hero(
                  //   tag: phoneNumberController.filterCountryList[index].flag,
                  //   child: richTextWidget(
                  //       phoneNumberController.filterCountryList[index].flag,
                  //       Theme.of(context).textTheme.displayMedium!),
                  // ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: richTextWidget(
                        "phoneNumberController.filterCountryList[index].diallingCode",
                        Theme.of(context).textTheme.headlineSmall!),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 70,
                      child: richTextWidget(
                          "phoneNumberController.filterCountryList[index].name",
                          Theme.of(context).textTheme.headlineSmall!),
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
}
