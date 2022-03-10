enum PaymentMode { cash, online }
enum DateFilter { alltime, today, selectday, weekly, monthly, yearly }

String getPaymentModeName(PaymentMode mode) {
  return mode == PaymentMode.cash ? 'Cash' : 'Online';
}
