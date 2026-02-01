import 'package:flutter/material.dart';
import '../widgets/progress_bar.dart';
import '../widgets/diet_card.dart';
import 'results_screen.dart';

class DietaryPreferencesScreen extends StatefulWidget {
  final String gender;
  final int birthYear;
  final double height;
  final double weight;
  final bool isMetric;

  const DietaryPreferencesScreen({
    super.key,
    required this.gender,
    required this.birthYear,
    required this.height,
    required this.weight,
    required this.isMetric,
  });

  @override
  State<DietaryPreferencesScreen> createState() =>
      _DietaryPreferencesScreenState();
}

class _DietaryPreferencesScreenState extends State<DietaryPreferencesScreen> {
  String? selectedDiet;
  Set<String> allergies = {};

  final List<Map<String, dynamic>> dietOptions = [
    {
      'name': 'Balanced',
      'description': 'Everything in moderation',
      'icon': '🥗',
    },
    {
      'name': 'Vegetarian',
      'description': 'No meat or fish',
      'icon': '🥬',
    },
    {
      'name': 'Vegan',
      'description': 'Plant-based only',
      'icon': '🌱',
    },
    {
      'name': 'Keto',
      'description': 'Low carb, high fat',
      'icon': '🥑',
    },
    {
      'name': 'Halal',
      'description': 'Islamic dietary laws',
      'icon': '🕌',
    },
    {
      'name': 'Mediterranean',
      'description': 'Heart-healthy classics',
      'icon': '🫒',
    },
  ];

  final List<String> commonAllergies = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Wheat/Gluten',
    'Soy',
    'Fish',
    'Shellfish',
  ];

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
            const MinimalProgressBar(progress: 1.0),
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
                        child: const Center(
                          child: Text(
                            '🍽️',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Title
                    Text(
                      'What is your diet plan?',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select the diet that best matches your preferences.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    // Diet Options Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: dietOptions.length,
                      itemBuilder: (context, index) {
                        final diet = dietOptions[index];
                        return DietCard(
                          icon: diet['icon'],
                          name: diet['name'],
                          description: diet['description'],
                          isSelected: selectedDiet == diet['name'],
                          onTap: () {
                            setState(() {
                              selectedDiet = diet['name'];
                            });
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    // Allergies Section
                    Row(
                      children: [
                        const Text(
                          '⚠️',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Any allergies?',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Optional - we\'ll avoid these ingredients',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: commonAllergies.map((allergy) {
                        final isSelected = allergies.contains(allergy);
                        return FilterChip(
                          label: Text(allergy),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                allergies.add(allergy);
                              } else {
                                allergies.remove(allergy);
                              }
                            });
                          },
                          backgroundColor: const Color(0xFFF1FAEE),
                          selectedColor: const Color(0xFFE63946),
                          labelStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1D3557),
                            fontWeight: FontWeight.w500,
                          ),
                          checkmarkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide.none,
                          ),
                        );
                      }).toList(),
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
                      onPressed: selectedDiet != null
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultsScreen(
                                    gender: widget.gender,
                                    birthYear: widget.birthYear,
                                    height: widget.height,
                                    weight: widget.weight,
                                    isMetric: widget.isMetric,
                                    dietPlan: selectedDiet!,
                                    allergies: allergies.toList(),
                                  ),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDiet != null
                            ? const Color(0xFFE63946)
                            : const Color(0xFFE0E0E0),
                      ),
                      child: const Text('See My Plan'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: selectedDiet != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultsScreen(
                                  gender: widget.gender,
                                  birthYear: widget.birthYear,
                                  height: widget.height,
                                  weight: widget.weight,
                                  isMetric: widget.isMetric,
                                  dietPlan: selectedDiet!,
                                  allergies: allergies.toList(),
                                ),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Skip allergies',
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
}
