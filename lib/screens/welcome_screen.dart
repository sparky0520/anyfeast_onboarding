import 'package:flutter/material.dart';
import 'basic_profile_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              // Hero Illustration
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1FAEE),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: WelcomeIllustrationPainter(),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Title
              Text(
                'Welcome to AnyFeast',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Subtitle
              Text(
                'Curated recipes delivered to your door.\nNo hassle, just delicious meals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF457B9D),
                      height: 1.5,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Benefits
              _buildBenefit(context, '🎯', 'Personalized meal plans'),
              const SizedBox(height: 12),
              _buildBenefit(context, '🥗', 'Fresh ingredients delivered'),
              const SizedBox(height: 12),
              _buildBenefit(context, '⏱️', 'Save hours every week'),
              const Spacer(),
              // CTA Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicProfileScreen(),
                      ),
                    );
                  },
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Skip to main app
                },
                child: Text(
                  'Skip for now',
                  style: TextStyle(
                    color: const Color(0xFF457B9D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefit(BuildContext context, String emoji, String text) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 12),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class WelcomeIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Tomato
    paint.color = const Color(0xFFE63946);
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      30,
      paint,
    );
    paint.color = const Color(0xFF2A9D8F);
    final tomatoLeaf = Path()
      ..moveTo(size.width * 0.3, size.height * 0.3 - 30)
      ..quadraticBezierTo(
        size.width * 0.3 - 10,
        size.height * 0.3 - 45,
        size.width * 0.3 - 15,
        size.height * 0.3 - 35,
      );
    canvas.drawPath(tomatoLeaf, paint);

    // Carrot
    paint.color = const Color(0xFFF4A261);
    final carrot = Path()
      ..moveTo(size.width * 0.7, size.height * 0.35)
      ..lineTo(size.width * 0.75, size.height * 0.5)
      ..lineTo(size.width * 0.7, size.height * 0.52)
      ..lineTo(size.width * 0.65, size.height * 0.5)
      ..close();
    canvas.drawPath(carrot, paint);
    paint.color = const Color(0xFF2A9D8F);
    final carrotLeaves = Path()
      ..moveTo(size.width * 0.7, size.height * 0.35)
      ..lineTo(size.width * 0.65, size.height * 0.25)
      ..moveTo(size.width * 0.7, size.height * 0.35)
      ..lineTo(size.width * 0.75, size.height * 0.25);
    canvas.drawPath(
      carrotLeaves,
      paint..style = PaintingStyle.stroke,
    );

    // Knife
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF457B9D);
    final knife = Path()
      ..moveTo(size.width * 0.5, size.height * 0.6)
      ..lineTo(size.width * 0.6, size.height * 0.7)
      ..lineTo(size.width * 0.58, size.height * 0.72)
      ..lineTo(size.width * 0.48, size.height * 0.62)
      ..close();
    canvas.drawPath(knife, paint);
    paint.color = const Color(0xFF1D3557);
    final knifeHandle = Rect.fromLTWH(
      size.width * 0.42,
      size.height * 0.66,
      15,
      8,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(knifeHandle, const Radius.circular(4)),
      paint,
    );

    // Recipe card
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    final card = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.25, size.height * 0.65, 60, 40),
      const Radius.circular(8),
    );
    canvas.drawRRect(card, paint);
    paint.color = const Color(0xFFE0E0E0);
    paint.style = PaintingStyle.stroke;
    canvas.drawRRect(card, paint);

    // Recipe lines
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFE63946);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.28, size.height * 0.69, 30, 3),
        const Radius.circular(2),
      ),
      paint,
    );
    paint.color = const Color(0xFFE0E0E0);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.28, size.height * 0.74, 45, 2),
        const Radius.circular(1),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.28, size.height * 0.78, 40, 2),
        const Radius.circular(1),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
