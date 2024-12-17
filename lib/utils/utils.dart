String getAmountText(int amount) {
  if (amount < 0) {
    amount = amount * -1;
  }

  return '\$${amount.toString()}';
}
