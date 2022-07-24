


class CategoriesModel{
late bool status;

late CategoriesModelData categoriesModelData;

CategoriesModel.fromJson(Map<String,dynamic> json){
  status = json['status'];
  categoriesModelData = (json['data'] != null ? CategoriesModelData.fromJson(json['data']): null)!;

}


}




class CategoriesModelData{

late  List<CategoriesData> categoriesData=[];
 CategoriesModelData.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      categoriesData.add(CategoriesData.fromJson(element));
    });
  }


}


class CategoriesData{

late String name;
 late String image;

 CategoriesData.fromJson(Map<String,dynamic> json){
  name = json['name']; 
  image = json['image'];
 }

}