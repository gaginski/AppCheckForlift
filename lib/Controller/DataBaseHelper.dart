import 'dart:async';
import 'dart:io';
import 'package:CheckForklift/Class/Config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static dynamic _database = null;

//usada para definir as colunas da tabeala
  String configTable = 'config';
  String colId = 'id';
  String colToken = 'token';
  String colUsuLogado = 'usuarioLogado';
  String colSenhaUser = 'senhaUsuarioLogado';

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'CheckForklift.db';

    var contatosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return contatosDatabase;
  }

  Future<int> insertConfig(ClassConfig config) async {
    Database db = await this.database;

    var resultado = await db.insert(configTable, config.ClassToMap(config));

    return resultado;
  }

  Future<ClassConfig> getCofig() async {
    Database db = await this.database;

    List<Map> maps = await db.query(configTable,
        columns: [colId, colToken, colUsuLogado, colSenhaUser]);

    if (maps.length > 0) {
      return new ClassConfig().MapToClass(maps.first);
    } else {
      return new ClassConfig();
    }
  }

  //Atualizar o objeto Contato e salva no banco de dados
  Future<int> updateContato(ClassConfig config) async {
    var db = await this.database;

    var resultado = await db.update(configTable, config.ClassToMap(config),
        where: '$colId = ?', whereArgs: [config.id]);

    return resultado;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $configTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colToken TEXT, $colUsuLogado INT, $colSenhaUser TEXT)');
  }

  //Deletar um objeto Contato do banco de dados
  Future<int> deleteConfig(int id) async {
    var db = await this.database;

    int resultado =
        await db.delete(configTable, where: "$colId = ?", whereArgs: [id]);

    return resultado;
  }

//Obtem o número de objetos contato no banco de dados
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $configTable');

    int resultado = Sqflite.firstIntValue(x);
    return resultado;
  }

  Future close() async {
    Database db = await this.database;
    db.close();
  }
}
