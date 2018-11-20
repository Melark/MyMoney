/*
 This type specifies 'CLASS' but DART does not have a specific identifier for interfaces, because in dart, each class implemnts its own interface.
 The reasoning behind this is because interfaces do npt infer behavior, only properties and structure. Therefore because classes have properties defined within them, you basically
 make any class an interface if you implement it using "implements"
*/
class ITransaction {
  // TODO: Add more properties like Date and Enums to indicate Type (if it makes sense to do so)
  String title;
  String description;
  double amount;
}