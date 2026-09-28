import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

// ==========================================
// !MÀN HÌNH CHÍNH (ProfileScreen)
// !Khung chứa được cố định rộng 336px 
// ==========================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E8F0), // Nền bên ngoài màn hình mô phỏng
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            width: 390, // Fixed (390px)
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(44), // Radius: 44px
              border: Border.all(
                color: const Color(0xFFCBD5E1), // Màu viền ngoài
                width: 3, // Border: 3px
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 44,    // Padding Top: 44px
              right: 24,  // Padding Right: 24px
              bottom: 36, // Padding Bottom: 36px
              left: 24,   // Padding Left: 24px
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Height: Hug (tự ôm sát nội dung ~1,163px)
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ProfileHeader(),
                SizedBox(height: 24), // Gap: 24px

                ProfileInfo(),
                SizedBox(height: 24), // Gap: 24px

                ProfileStatsCard(),
                SizedBox(height: 24), // Gap: 24px

                ProfileAbout(),
                SizedBox(height: 24), // Gap: 24px

                ProfileSkills(),
                SizedBox(height: 24), // Gap: 24px

                ProfileProjects(),
                SizedBox(height: 24), // Gap: 24px

                ProfileContact(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//=========================================
//! 1. HEADER (336 x 42)
// ==========================================
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  Widget _buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF475569)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(icon: Icons.chevron_left, onTap: () {}),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          _buildIconButton(icon: Icons.share_outlined, onTap: () {}),
        ],
      ),
    );
  }
}

// ==========================================
// 2. PROFILE INFO (Avatar + Text) (336 x 241 Hug)
// ==========================================
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336, // Width: Fill (336px)
      child: Column(
        mainAxisSize: MainAxisSize.min, // Height: Hug (241px)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Avatar tròn viền gradient + tích xanh
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(3.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF8A65), Color(0xFFFFD54F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.JPG"),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: Color(0xFF0284C7),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8), // Gap: 8px

          // 2. Họ tên
          const Text(
            'Alex Rivers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              letterSpacing: 0,
              height: 1,
            ),
          ),

          const SizedBox(height: 8), // Gap: 8px

          // 3. Vị trí công việc
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),

          const SizedBox(height: 8), // Gap: 8px

          // 4. Địa điểm
          Container(
            width: 134,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Color(0xFF64748B),
                ),
                SizedBox(width: 6),
                Text(
                  'Tokyo, Japan',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. STATS CARD (336 x 78)
// ==========================================
class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({super.key});

  Widget _buildStatItem(String val, String label) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            val,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingItem(String val, String label) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                val,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFF59E0B),
                  height: 1,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 78,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildStatItem('148', 'Projects')),
          Container(height: 24, width: 1, color: const Color(0xFFE2E8F0)),
          Expanded(child: _buildStatItem('9 Yrs', 'Experience')),
          Container(height: 24, width: 1, color: const Color(0xFFE2E8F0)),
          Expanded(child: _buildRatingItem('4.9', 'Rating')),
        ],
      ),
    );
  }
}
// ==========================================
// 4. ABOUT ME (336 x Hug)
// ==========================================
class ProfileAbout extends StatelessWidget {
  const ProfileAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 336,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              height: 1,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, intuitive UX, and design systems.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. SKILLS & EXPERTISE (336 x 105 Hug)
// ==========================================
class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  Widget _buildTag({
    required String label,
    required IconData icon,
    required Color bg,
    required Color text,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      constraints: const BoxConstraints(minHeight: 32),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: text),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: text,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336, // Width: Fill (336px)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Height: Hug (105px)
        children: [
          const Text(
            'Skills & Expertise',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              height: 1,
            ),
          ),
          const SizedBox(height: 10), // Gap: 10px
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildTag(
                label: 'Flutter',
                icon: Icons.polyline,
                bg: const Color(0xFFE0F2FE),
                text: const Color(0xFF0284C7),
              ),
              _buildTag(
                label: 'Dart',
                icon: Icons.code,
                bg: const Color(0xFFDCFCE7),
                text: const Color(0xFF16A34A),
              ),
              _buildTag(
                label: 'Clean Arch',
                icon: Icons.layers_outlined,
                bg: const Color(0xFFFFE4E6),
                text: const Color(0xFFE11D48),
              ),
              _buildTag(
                label: 'UI/UX',
                icon: Icons.brush_outlined,
                bg: const Color(0xFFF3E8FF),
                text: const Color(0xFF9333EA),
              ),
              _buildTag(
                label: 'Firebase',
                icon: Icons.local_fire_department_outlined,
                bg: const Color(0xFFFEF3C7),
                text: const Color(0xFFD97706),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// ==========================================
// 6. FEATURED PROJECTS (336 x 185)
// ==========================================
class ProfileProjects extends StatelessWidget {
  const ProfileProjects({super.key});

  Widget _buildProjectCard({
    required String imageAsset,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            height: 90,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      height: 185,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildProjectCard(
                  imageAsset: "images/mattrang.jpg",
                  title: 'E-Shop Flutter',
                  subtitle: 'Mobile App • 2026',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildProjectCard(
                  imageAsset: "images/thiennhien.jpg",
                  title: 'Crypto Vault',
                  subtitle: 'Finance • Clean Arch',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 7. CONTACT INFORMATION (336 x 192)
// ==========================================
class ProfileContact extends StatelessWidget {
  const ProfileContact({super.key});

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    bool isHeader = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      dense: true,
      visualDensity: const VisualDensity(vertical: -1),
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 17, color: const Color(0xFF475569)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
          color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF475569),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Color(0xFFCBD5E1)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 192,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // Bọc Material để ListTile vẽ hiệu ứng ink splash chuẩn xác mà không báo lỗi
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildContactTile(
              icon: Icons.alternate_email,
              title: 'Contact Information',
              isHeader: true,
              onTap: () {},
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
            _buildContactTile(
              icon: Icons.mail_outline,
              title: 'alex.rivers@email.com',
              onTap: () {},
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
            _buildContactTile(
              icon: Icons.call_outlined,
              title: '+81 (90) 1234-5678',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}