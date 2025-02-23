import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  String? _sourceCountry;
  String? _targetCountry;
  double? _convertedAmount;
  List<String> _taxRefundTips = [];
  bool _showTips = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Currency Converter',
            style: TextStyle(color: Color(0xFFFFFFFF))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Amount Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _amountController,
                  style: const TextStyle(color: Color(0xFFFFFFFF)),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter amount',
                    hintStyle: TextStyle(color: Color(0xFFA5A5A5)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Source Country Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFF1E1E1E),
                    hint: const Text('Select source country',
                        style: TextStyle(color: Color(0xFFA5A5A5))),
                    value: _sourceCountry,
                    isExpanded: true,
                    items: ['USA', 'France', 'UK', 'Japan']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(color: Color(0xFFFFFFFF))),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _sourceCountry = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Target Country Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFF1E1E1E),
                    hint: const Text('Select target country',
                        style: TextStyle(color: Color(0xFFA5A5A5))),
                    value: _targetCountry,
                    isExpanded: true,
                    items: ['USA', 'France', 'UK', 'Japan']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(color: Color(0xFFFFFFFF))),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _targetCountry = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Results Display
              if (_convertedAmount != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF4CD964),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Converted Amount',
                        style: TextStyle(
                          color: Color(0xFFA5A5A5),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${_convertedAmount?.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E1E1E),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        // Implement scan functionality
                        setState(() {
                          _showTips = true;
                          // Simulated tips - replace with actual API call
                          _taxRefundTips = [
                            'Keep your original receipt',
                            'Visit the tax-free counter at the airport',
                            'Minimum purchase amount: €100',
                          ];
                        });
                      },
                      icon: const Icon(Icons.camera_alt,
                          color: Color(0xFFF2F2F2)),
                      label: const Text('Scan',
                          style: TextStyle(color: Color(0xFFF2F2F2))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CD964),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Simulate conversion
                        setState(() {
                          _convertedAmount = 120.50; // Replace with actual conversion
                        });
                      },
                      child: const Text('Convert',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),

              // Tax Refund Tips
              if (_showTips) ...[
                const SizedBox(height: 24),
                const Text(
                  'Tax Refund Tips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...(_taxRefundTips.map((tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Color(0xFF4CD964),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                tip,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )))
              ],
            ],
          ),
        ),
      ),
    );
  }
}
