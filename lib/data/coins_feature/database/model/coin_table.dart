import 'package:drift/drift.dart';

class CoinTable extends Table {
  TextColumn get id => text().unique()();

  TextColumn get symbol => text()();

  TextColumn get name => text()();

  TextColumn get image => text().nullable()();

  RealColumn get currentPrice => real()();

  @override
  Set<Column> get primaryKey => {id};
}
