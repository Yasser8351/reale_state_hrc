class ListingModel {
  final String apartmentName;
  final String priceRent;
  final int statusId;
  final String priceSale;
  final String propertyFeatures;

  ListingModel(
      {required this.apartmentName,
      this.statusId = 1,
      required this.priceRent,
      required this.priceSale,
      required this.propertyFeatures});
}
