import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// ══════════════════════════════════════════════════════════════════
//  CURRENCY FORMATTER
//  Centralizes all currency display logic for the whole app.
// ══════════════════════════════════════════════════════════════════

class CurrencyFormatter {
  CurrencyFormatter._();

  /// Currency symbol map — expand as needed.
  static const _symbols = {'IDR': 'Rp', 'USD': '\$', 'EUR': '€', 'SGD': 'S\$'};

  /// Returns the symbol for [currency], or the code itself as fallback.
  static String symbol(String currency) =>
      _symbols[currency.toUpperCase()] ?? currency;

  /// Formats [amount] with thousands separator.
  ///
  /// Examples:
  ///   format(350000, 'IDR')  → "Rp 350.000"
  ///   format(9.99,   'USD')  → "$ 9,99"
  ///   format(186000, 'IDR')  → "Rp 186.000"
  static String format(double amount, String currency) {
    final formatter = _formatterFor(currency);
    final sym = symbol(currency);
    return '$sym ${formatter.format(amount)}';
  }

  /// Formats [amount] with thousands separator but WITHOUT currency symbol.
  /// Used inside the TextFormField as a display hint.
  ///
  /// Example: formatAmount(350000, 'IDR') → "350.000"
  static String formatAmount(double amount, String currency) {
    return _formatterFor(currency).format(amount);
  }

  /// Parses a formatted string back to double.
  /// Strips symbols and separators, handles both '.' and ',' decimals.
  ///
  /// Examples:
  ///   parse("350.000")  → 350000.0
  ///   parse("9,99")     → 9.99
  ///   parse("Rp 186.000") → 186000.0
  static double? parse(String input, String currency) {
    // Strip everything except digits, dots, and commas
    var cleaned = input.replaceAll(RegExp(r'[^\d.,]'), '');
    if (cleaned.isEmpty) return null;

    if (_isDecimalCurrency(currency)) {
      // USD/EUR: dots = thousands separator, comma = decimal
      // "1.234,56" → "1234.56"
      cleaned = cleaned.replaceAll('.', '').replaceAll(',', '.');
    } else {
      // IDR/SGD: dots = thousands separator, no decimals
      // "350.000" → "350000"
      cleaned = cleaned.replaceAll('.', '').replaceAll(',', '');
    }

    return double.tryParse(cleaned);
  }

  // ── Private helpers ────────────────────────────────────────────────

  static NumberFormat _formatterFor(String currency) {
    return switch (currency.toUpperCase()) {
      'IDR' ||
      'SGD' => NumberFormat('#,###', 'id_ID'), // uses '.' as thousands sep
      'USD' => NumberFormat('#,###.##', 'en_US'),
      'EUR' => NumberFormat('#.###,##', 'de_DE'),
      _ => NumberFormat('#,###', 'en_US'),
    };
  }

  static bool _isDecimalCurrency(String currency) =>
      ['USD', 'EUR'].contains(currency.toUpperCase());
}

// ══════════════════════════════════════════════════════════════════
//  THOUSANDS SEPARATOR INPUT FORMATTER
//  Plugs into TextFormField.inputFormatters to auto-format while typing.
// ══════════════════════════════════════════════════════════════════

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final String currency;

  ThousandsSeparatorInputFormatter({required this.currency});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final rawText = newValue.text;

    // Allow empty input
    if (rawText.isEmpty) return newValue;

    // Strip all non-digit chars to get the raw number
    final digitsOnly = rawText.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.isEmpty) return newValue;

    // Parse as integer (IDR has no decimals)
    final number = int.tryParse(digitsOnly);
    if (number == null) return oldValue;

    // Format with thousands separator
    final formatted = CurrencyFormatter.formatAmount(
      number.toDouble(),
      currency,
    );

    return TextEditingValue(
      text: formatted,
      // Keep cursor at the end
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
