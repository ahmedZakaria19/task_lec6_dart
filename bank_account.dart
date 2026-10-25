class BankAccount {
  String _accountHolder = "";
  double _balance = 0;
  void deposit(double amount) {
    if (amount > 0) _balance += amount;
    print("Deposited $amount");
  }
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawed $amount");
    }
  }
  BankAccount(this._accountHolder);
  String get accountHolder => _accountHolder;
  double get balance => _balance;
  set accountHolder(String accountHolder) => _accountHolder = accountHolder;
  set balance(double balance) => _balance = balance;
}
void main() {
  BankAccount account = new BankAccount("Ahmed");
  account.deposit(100);
  account.withdraw(50);
  account.withdraw(100);
  print(account.accountHolder);
  print(account.balance);
}
