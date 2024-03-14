class Transaction {
  final String name;
  final String currencyCode;
  final double amount;
  final String status;
  final DateTime paymentDate;

  const Transaction({
    required this.name,
    required this.currencyCode,
    required this.amount,
    required this.status,
    required this.paymentDate,
  });
}

final scheduledTransactions = [
  Transaction(
    name: 'Apollo Quiboloy',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'PENDING',
    paymentDate: DateTime.now(),
  ),
  Transaction(
    name: 'Rodrigo Duterte',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'IN PROGRESS',
    paymentDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    name: 'Bong Go',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'COMPLETED',
    paymentDate: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Transaction(
    name: 'Bato Dela Rosa',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'COMPLETED', //CANCELLED',
    paymentDate: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Transaction(
    name: 'Manny Pacquiao',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'FAILED',
    paymentDate: DateTime.now().subtract(const Duration(days: 4)),
  ),
  Transaction(
    name: 'Leni Robredo',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'PENDING',
    paymentDate: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Transaction(
    name: 'Isko Moreno',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'IN PROGRESS',
    paymentDate: DateTime.now().subtract(const Duration(days: 6)),
  ),
  Transaction(
    name: 'Bongbong Marcos',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'COMPLETED',
    paymentDate: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Transaction(
    name: 'Grace Poe',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'COMPLETED', //'CANCELLED',
    paymentDate: DateTime.now().subtract(const Duration(days: 8)),
  ),
  Transaction(
    name: 'Chel Diokno',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'FAILED',
    paymentDate: DateTime.now().subtract(const Duration(days: 9)),
  ),
  Transaction(
   name: 'Francis Tolentino',
    currencyCode: 'PHP',
    amount: 1000.00,
    status: 'PENDING',
    paymentDate: DateTime.now().subtract(const Duration(days: 10)), 
  )
];
