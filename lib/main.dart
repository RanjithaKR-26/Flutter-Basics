// @dart=2.9

import 'package:flutter/material.dart';
import 'package:new_project/src/graphql_config.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  
  var app = GraphQLProvider(
    client: GraphqlConfig().client,
    child: MyApp(
      settingsController: settingsController,
    ),
  );

  runApp(app);
}
