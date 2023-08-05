class BankAccount {
  String bankName;
  String accountNumber;
  double balance;

  BankAccount({
    required this.bankName,
    required this.accountNumber,
    required this.balance,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      balance: json['balance'].toDouble(),
    );
  }
}

class UserContent {
  String username;
  List<BankAccount> bankAccounts;

  UserContent({
    required this.username,
    required this.bankAccounts,
  });

  factory UserContent.fromJson(Map<String, dynamic> json) {
    var bankAccountList = json['bankAccounts'] as List;
    List<BankAccount> accounts =
        bankAccountList.map((item) => BankAccount.fromJson(item)).toList();

    return UserContent(
      username: json['username'],
      bankAccounts: accounts,
    );
  }
}

class HomeResponse {
  String screen;
  UserContent content;

  HomeResponse({
    required this.screen,
    required this.content,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      screen: json['screen'],
      content: UserContent.fromJson(json['content']),
    );
  }
}
