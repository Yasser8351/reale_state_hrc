enum LoadingState {
  initial,
  loading,
  loaded,
  socketException,
  timeout,
  noDataFound,
  error,
}

enum LoadingType {
  login,
  registration,
  updateData,
  completeRegister,
  faqs,
  project,
  addApartment,
  getApartment,
  deleteApartment,
  updateApartment,
  offer,
  socialMedia,
  area,
  interest,
}

enum SwitchType {
  // isListings,
  // isSold,
  isSell,
  isRent,
  isAllNotifcation,
}

enum ImageType {
  picFront,
  picBack,
}

enum FileTypePicker {
  sap,
  cheque,
}

enum ShimmerType {
  shimmerCircular,
  shimmerHorizontal,
  shimmerRectangular,
  shimmerListRectangular,
  circularProgressIndicator,
  none
}
