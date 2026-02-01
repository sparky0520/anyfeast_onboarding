import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResultsScreen extends StatelessWidget {
  final String gender;
  final int birthYear;
  final double height;
  final double weight;
  final bool isMetric;
  final String dietPlan;
  final List<String> allergies;

  const ResultsScreen({
    super.key,
    required this.gender,
    required this.birthYear,
    required this.height,
    required this.weight,
    required this.isMetric,
    required this.dietPlan,
    required this.allergies,
  });

  Map<String, dynamic> calculateMetrics() {
    // Convert to metric if needed
    double heightCm = isMetric ? height : height * 30.48;
    double weightKg = isMetric ? weight : weight * 0.453592;

    // Calculate BMI
    double heightM = heightCm / 100;
    double bmi = weightKg / (heightM * heightM);

    // Calculate age
    int age = DateTime.now().year - birthYear;

    // Calculate BMR (Mifflin-St Jeor Equation)
    double bmr;
    if (gender.toLowerCase() == 'male') {
      bmr = (10 * weightKg) + (6.25 * heightCm) - (5 * age) + 5;
    } else {
      bmr = (10 * weightKg) + (6.25 * heightCm) - (5 * age) - 161;
    }

    // Calculate TDEE (assuming moderate activity)
    double tdee = bmr * 1.55;

    // Daily calorie goal (slight deficit for health)
    double dailyGoal = tdee - 200;

    // Protein target (1.6g per kg bodyweight for active lifestyle)
    double proteinGrams = weightKg * 1.6;

    return {
      'bmi': bmi.toStringAsFixed(1),
      'bmiStatus': _getBMIStatus(bmi),
      'bmr': bmr.round(),
      'tdee': tdee.round(),
      'dailyGoal': dailyGoal.round(),
      'protein': proteinGrams.round(),
    };
  }

  String _getBMIStatus(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    final metrics = calculateMetrics();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF1D3557)),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    '100%',
                    style: TextStyle(
                      color: Color(0xFFE63946),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Success Icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE63946).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE63946),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Your Health Profile is Ready!',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Here\'s what we calculated based on your profile.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Metrics Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE63946),
                            Color(0xFFF4A261),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Your Health Metrics',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: _buildMetric(
                                  'BMI',
                                  metrics['bmi'],
                                  metrics['bmiStatus'],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              Expanded(
                                child: _buildMetric(
                                  'BMR',
                                  '${metrics['bmr']}',
                                  'calories/day',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Divider(
                            color: Colors.white.withOpacity(0.3),
                            thickness: 1,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildMetric(
                                  'TDEE',
                                  '${metrics['tdee']}',
                                  'calories/day',
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              Expanded(
                                child: _buildMetric(
                                  'Daily Goal',
                                  '${metrics['dailyGoal']}',
                                  'calories',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Protein Target Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1FAEE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFA8DADC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.fitness_center_rounded,
                              color: Color(0xFF1D3557),
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Protein Target',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF457B9D),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${metrics['protein']}g per day',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1D3557),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Diet Plan Summary
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '🍽️',
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Your Diet Plan',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            dietPlan,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFE63946),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (allergies.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            const Text(
                              'Avoiding:',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF457B9D),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: allergies.map((allergy) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1FAEE),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    allergy,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF1D3557),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to main app
                      },
                      child: const Text('Start Cooking!'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Refine my preferences',
                      style: TextStyle(
                        color: Color(0xFF457B9D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, String subtitle) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
