import 'package:news_app/features/favourite/domain/entity/model/add_favourite_model.dart';

class AddFavouriteDto extends AddFavouriteModel {
  @override
  // ignore: overridden_fields
  final bool done;
  AddFavouriteDto({
    required this.done
  }) : super(done: true);
}
