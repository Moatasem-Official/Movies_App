import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// -->> You can tweak these gradient colors to change the app's accent
const Color kGradientColorStart = Color(0xFF6A11CB);
const Color kGradientColorEnd = Color(0xFF2575FC);

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Appearance Section ---
            _SettingsSection(
              title: 'Appearance',
              children: [
                _SettingsTile(
                  icon: CupertinoIcons.paintbrush_fill,
                  title: 'Theme',
                  subtitle:
                      'Dark', // This can be linked to your actual theme state
                  onTap: () {
                    // TODO: Show a dialog to select the theme (Dark / Light / System)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Theme options would open here.')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- NEW: Content & Privacy Section ---
            _SettingsSection(
              title: 'Content & Privacy',
              children: [
                _SettingsTile(
                  icon: CupertinoIcons.time,
                  title: 'Clear Search History',
                  onTap: () {
                    // TODO: Implement clearing search history with a confirmation dialog
                  },
                ),
                const _Divider(),
                _SettingsTile(
                  icon: CupertinoIcons.trash_fill,
                  title: 'Clear Watchlist',
                  onTap: () {
                    // TODO: Implement clearing watchlist with a confirmation dialog
                  },
                  isDestructive: true, // Makes the text red for caution
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- NEW: Feedback & Support Section ---
            _SettingsSection(
              title: 'Feedback & Support',
              children: [
                _SettingsTile(
                  icon: CupertinoIcons.ant_fill,
                  title: 'Report a Bug',
                  onTap: () {/* TODO: Link to a feedback form or email */},
                ),
                const _Divider(),
                _SettingsTile(
                  icon: CupertinoIcons.lightbulb_fill,
                  title: 'Suggest a Feature',
                  onTap: () {/* TODO: Link to a suggestion form or email */},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- About Section ---
            _SettingsSection(
              title: 'About',
              children: [
                _SettingsTile(
                  icon: CupertinoIcons.star_fill,
                  title: 'Rate App',
                  onTap: () {/* TODO: Link to the app store */},
                ),
                const _Divider(),
                _SettingsTile(
                  icon: CupertinoIcons.lock_shield_fill,
                  title: 'Privacy Policy',
                  onTap: () {/* TODO: Open privacy policy URL */},
                ),
              ],
            ),

            // --- App Version Footer ---
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A custom widget for a settings section with a gradient border
class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [kGradientColorStart, kGradientColorEnd],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            margin:
                const EdgeInsets.all(1.5), // This creates the border thickness
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E), // Inner background color
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}

/// A custom widget for a tappable settings tile
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive ? Colors.red.shade400 : Colors.white70,
              size: 22,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.red.shade400 : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white24,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

/// A custom divider widget
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.white.withOpacity(0.08),
      indent: 50, // Pushes the divider away from the icon
    );
  }
}
