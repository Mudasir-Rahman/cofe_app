import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.notificationCount = 0,
    this.onProfileTap,
    this.onNotificationTap,
  });

  final String userName;
  final String? avatarUrl;
  final int notificationCount;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;

  static const Color coffeeBrown = Color(0xFF6F4E37);
  static const Color darkCoffee = Color(0xFF2B211B);
  static const Color cream = Color(0xFFF7EDE0);
  static const Color mutedText = Color(0xFF9B8B80);

  @override
  Widget build(BuildContext context) {
    final firstName = userName.trim().isEmpty
        ? 'Coffee Lover'
        : userName.trim().split(RegExp(r'\s+')).first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Row(
        children: [
          // Profile avatar
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 54,
              height: 54,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: coffeeBrown.withValues(alpha: 0.45),
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: cream,
                backgroundImage:
                    avatarUrl != null && avatarUrl!.trim().isNotEmpty
                    ? NetworkImage(avatarUrl!)
                    : null,
                child: avatarUrl == null || avatarUrl!.trim().isEmpty
                    ? const Icon(
                        Icons.person_rounded,
                        color: coffeeBrown,
                        size: 29,
                      )
                    : null,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Greeting and user's name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'GOOD MORNING ☕',
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  firstName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkCoffee,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Notification button
          Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onNotificationTap,
              customBorder: const CircleBorder(),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.notifications_none_rounded,
                      color: darkCoffee,
                      size: 27,
                    ),
                    if (notificationCount > 0)
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 17,
                            minHeight: 17,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFC76B3C),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            notificationCount > 99
                                ? '99+'
                                : '$notificationCount',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
