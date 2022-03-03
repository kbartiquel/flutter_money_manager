enum PaymentMode { cash, online }

String getPaymentModeName(PaymentMode mode) {
  return mode == PaymentMode.cash ? 'Cash' : 'Online';
}
