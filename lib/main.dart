import './exports/main_exports.dart';

void main() {
  runApp(
    GetMaterialApp(
      getPages: RoutesPages.paths,
      initialRoute: RoutesConstantes.kNotes,
      locale: Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
