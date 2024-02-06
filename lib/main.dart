import 'package:myfitbro/app.dart';
import 'package:myfitbro/bootstrap.dart';
import 'package:myfitbro/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  F.appFlavor = Flavor.local;
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const MyFitBro(),
    ),
  );
}
