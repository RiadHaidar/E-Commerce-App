class AddToFavoritesModel
{
  late bool status;
late  String message;

  AddToFavoritesModel.fromjson(Map<String , dynamic> json)
  {
    status = json['status'];
    message =json['message'];
  }
}