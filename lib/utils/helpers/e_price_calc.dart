class EPriceCalc {
  /// ---- Calculate Price base on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// --- Calculate Shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// --- Calculate Tax rate
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// --- Get the tax rate for location
  static double getTaxRateForLocation(String location) {
    /// Lookup the tax rate for the given location from a tax rate database or API
    /// Return the appropriate tax rate
    return 0.10;
  }

  /// --- Get the tax rate for location
  static double getShippingCost(String location) {
    /// Lookup the shipping rate for the given location from a shipping database or API
    /// Calculate the shipping cost on the base of weight and distance etc.
    return 5.00;
  }

  /// --- Sum all cart values and return total amount
  // static double calculateCartTotalPrice(CartModel cart) {

  //   return cart.items.map((e)=>e.price).fold(0,(previousPrice,currentPrice)=>previousPrice+(currentPrice??0));
  // }
}
