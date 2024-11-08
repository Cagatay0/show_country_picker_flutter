# show_country_picker_flutter

A Flutter library to show a country picker with functionalities to search and select countries.

### Features

- Displays a list of countries.
- Allows users to search for countries.
- Customizable UI elements.
- Easy integration into Flutter projects.

### Installation

Add this to your package's pubspec.yaml file:

<!-- |dependencies:|
|   show_country_picker_flutter: ^1.0.0| -->

```yaml
dependencies:
  show_country_picker_flutter: ^1.0.0
```

Then, run flutter pub get to install the package.

### Usage

To use the ShowCountryPickerFlutter widget, you can integrate it with showModalBottomSheet for a modal bottom sheet experience. Here’s a minimal example:

```dart
showModalBottomSheet(
  context: context,
  builder: (context) {
    return ShowCountryPickerFlutter(
      textEditingController: textEditingController,
      focusNode: focusNode,
      onTap: (Map<String, dynamic> countryDetail) =>
          log(countryDetail.toString()),
      // isDisplayDialCode: true, // Uncomment if you want to display dial code
    );
  },
);
```

In this example:

- 'context': The BuildContext in which the modal bottom sheet is being shown.
- 'textEditingController': A TextEditingController used to manage the text field within the picker.
- 'focusNode': A FocusNode for managing focus in the picker.
- 'onTap': A callback function that logs the details of the selected country.
- 'isDisplayDialCode': Uncomment this line if you want to display the dial code alongside the country name.
