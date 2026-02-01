import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/progress_bar.dart';
import 'dietary_preferences_screen.dart';

class BodyMetricsScreen extends StatefulWidget {
  final String gender;
  final int birthYear;

  const BodyMetricsScreen({
    super.key,
    required this.gender,
    required this.birthYear,
  });

  @override
  State<BodyMetricsScreen> createState() => _BodyMetricsScreenState();
}

class _BodyMetricsScreenState extends State<BodyMetricsScreen> {
  bool isMetric = true;
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  bool get canContinue {
    return heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1D3557)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Health Profile Setup',
          style: TextStyle(
            color: Color(0xFF1D3557),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const MinimalProgressBar(progress: 0.66),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    // Icon
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1FAEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.straighten_rounded,
                          size: 48,
                          color: Color(0xFFE63946),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Title
                    Text(
                      'What are your measurements?',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This helps us calculate your calorie and nutrition targets.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    // Unit Toggle
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1FAEE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildUnitToggle('Metric (cm/kg)', true),
                            _buildUnitToggle('Imperial (ft/lbs)', false),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Height Input
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: isMetric ? 'e.g., 170' : 'e.g., 5\'8"',
                        suffixText: isMetric ? 'cm' : 'ft',
                        suffixStyle: const TextStyle(
                          color: Color(0xFF457B9D),
                          fontWeight: FontWeight.w600,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1FAEE),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Weight Input
                    Text(
                      'Weight',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: isMetric ? 'e.g., 70' : 'e.g., 154',
                        suffixText: isMetric ? 'kg' : 'lbs',
                        suffixStyle: const TextStyle(
                          color: Color(0xFF457B9D),
                          fontWeight: FontWeight.w600,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1FAEE),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: canContinue
                      ? () {
                          final height =
                              double.tryParse(heightController.text) ?? 0;
                          final weight =
                              double.tryParse(weightController.text) ?? 0;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DietaryPreferencesScreen(
                                gender: widget.gender,
                                birthYear: widget.birthYear,
                                height: height,
                                weight: weight,
                                isMetric: isMetric,
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canContinue
                        ? const Color(0xFFE63946)
                        : const Color(0xFFE0E0E0),
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitToggle(String label, bool isMetricOption) {
    final isSelected = isMetric == isMetricOption;
    return GestureDetector(
      onTap: () {
        setState(() {
          isMetric = isMetricOption;
          heightController.clear();
          weightController.clear();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected
                ? const Color(0xFF1D3557)
                : const Color(0xFF457B9D),
          ),
        ),
      ),
    );
  }
}
