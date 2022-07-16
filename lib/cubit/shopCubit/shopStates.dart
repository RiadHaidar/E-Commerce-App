abstract class ShopStates{}

class ShopInitialState extends ShopStates{}
class ShopHomeLoadingState extends ShopStates{}
class ShopHomeSuccessState extends ShopStates{}
class ShopHomeErrorState extends ShopStates{}


class ShopCategoriesLoadingState extends ShopStates{}
class ShopCategoriesSuccessState extends ShopStates{}
class ShopCategoriesErrorState extends ShopStates{}

class ShopHomeChangeScreen extends ShopStates{}