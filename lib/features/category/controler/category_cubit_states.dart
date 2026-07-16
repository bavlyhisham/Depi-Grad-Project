abstract class CategoryStates {}
class CategoryInitialState extends CategoryStates{}
class GetCategorydatasuccessful extends  CategoryStates {}

class GetCategoryLoadingState extends  CategoryStates {}
class GetCategoryError extends CategoryStates {}
class ProductofcategoryLoadingState extends CategoryStates {}

class GetProductofcategorydatasuccessful extends CategoryStates {}