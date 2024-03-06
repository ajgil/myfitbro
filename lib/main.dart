import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myfitbro/app.dart';
import 'package:myfitbro/bootstrap.dart';
//import 'package:myfitbro/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //F.appFlavor = Flavor.local;
  await dotenv.load(fileName: '.env');

  //String url = dotenv.get('supabaseUrl');
  String supabaseBaseUrl = dotenv.env['supabaseUrl'] ?? '';
  String key = dotenv.get('supabaseKey');

  await Supabase.initialize(
    //url: url,
    url: supabaseBaseUrl,
    anonKey: key,
  );
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const MyFitBro(),
    ),
  );
}
