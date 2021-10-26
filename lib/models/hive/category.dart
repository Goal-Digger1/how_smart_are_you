import 'package:hive/hive.dart';
part 'category.g.dart';

@HiveType(typeId: 3)
class Category extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late List<int> levelIDS;
  Category({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.levelIDS = const [0,0,0,0]
  });
}