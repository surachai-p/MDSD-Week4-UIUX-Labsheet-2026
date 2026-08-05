## 🧪 การทดลองที่ 4: ใช้ AI ช่วย Generate UI Component (30 นาที)

### วัตถุประสงค์
ฝึกใช้ Google AI Studio สร้าง Flutter Widget

### การทำงาน
* **4.1-4.2** ใช้ Prompt สร้าง `UserProfileCard` Widget
* **4.4** นำ Code ไปปรับใช้ในไฟล์ `lib/widgets/user_profile_card.dart`

---

### Code ที่ Ai ให้มา
```
import 'package:flutter/material.dart';

/// A Material Design 3 user profile card displaying avatar, user info,
/// statistics, and action buttons.
class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final int postsCount;
  final int followersCount;
  final int followingCount;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
  });

  /// Helper to extract initials from the user's name for avatar fallback
  String get _initials {
    if (name.trim().isEmpty) return '';
    final nameParts = name.trim().split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    }
    return nameParts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Read theme and color scheme from current BuildContext
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      // Material 3 Card uses colorScheme.surface and elevation by default
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- 1. User Avatar Section ---
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              backgroundImage: (avatarUrl != null && avatarUrl!.isNotEmpty)
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: (avatarUrl == null || avatarUrl!.isEmpty)
                  ? Text(
                      _initials,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 8.0),

            // --- 2. User Info Section (Name & Email) ---
            Text(
              name,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              email,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),

            // --- 3. Statistics Section ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatColumn(
                  count: postsCount,
                  label: 'Posts',
                ),
                _StatColumn(
                  count: followersCount,
                  label: 'Followers',
                ),
                _StatColumn(
                  count: followingCount,
                  label: 'Following',
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // --- 4. Action Buttons Section ---
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper sub-widget to display individual stat item (Column: Number + Label)
class _StatColumn extends StatelessWidget {
  final int count;
  final String label;

  const _StatColumn({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$count',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
```

### 🔍 วิเคราะห์ Code ที่ได้ (ขั้นตอนที่ 4.3)

| คำถาม | คำตอบ |
|-------|-------|
| AI ใช้ Widget อะไรสร้าง Avatar? | ใช้ CircleAvatar ในการสร้างพื้นที่วงกลม และแสดงรูปภาพด้วย NetworkImage |
| AI handle กรณี avatarUrl เป็น null อย่างไร? | ใช้การเช็คเงื่อนไข (avatarUrl == null || avatarUrl!.isEmpty) หากเป็น null หรือค่าว่าง จะเปลี่ยนไปใช้ fallback คือ Widget Text เพื่อแสดงตัวอักษรย่อของชื่อ (_initials) แทน |
| AI ใช้ color จาก Theme หรือ hardcode? | อ่านค่าจาก Theme ทั้งหมด เช่น colorScheme.primaryContainer, colorScheme.onSurfaceVariant โดยไม่มีการใช้สีแบบ Hardcode เลย |
| มีส่วนไหนที่ควรปรับปรุง? | โค้ดค่อนข้างสมบูรณ์ แต่อาจเพิ่มการจัดการ Error ให้กับ NetworkImage เผื่อกรณีที่ URL ส่งมาถูกต้องแต่โหลดรูปภาพไม่สำเร็จ แอปจะได้ไม่แครช |

---

### 🤖 ทดลอง Multimodal (ขั้นตอนที่ 4.5)
ส่งรูป Figma จากการทดลองที่ 2 ให้ AI วิเคราะห์ และเปรียบเทียบกับ Code / Widget Tree ที่เขียนเองในการทดลองที่ 3

## Widget Tree ที่เอไอให้มา

```
/*
WIDGET TREE STRUCTURE:

Scaffold
├── AppBar (Material 3)
│   ├── leading: IconButton (Icon: Icons.menu)
│   ├── title: Text ("Green Market by poh")
│   └── actions: [ CircleAvatar / Icon Badge ]
│
├── body: Container (Color: colorScheme.secondaryContainer)
│   └── Stack
│       ├── ListView.builder (Padding: 16.0)
│       │   └── Card (Material 3 Elevation & Rounded Corners)
│       │       └── Padding (12.0)
│       │           └── Row
│       │               ├── CircleAvatar (Leading letter "A")
│       │               ├── SizedBox (Width: 12.0)
│       │               ├── Expanded
│       │               │   └── Column (Title + Subtitle)
│       │               └── Row / Graphic Placeholder
│       │
│       └── Positioned (Bottom-Right overlay on last item / floating)
│           └── FilledButton.icon ("+ เพิ่มสินค้า")
│
└── bottomNavigationBar: NavigationBar (Material 3)
    ├── NavigationDestination (Icon: Icons.stars, Label: "หน้าหลัก")
    ├── NavigationDestination (Icon: Icons.stars_outlined, Label: "ค้นหา")
    └── NavigationDestination (Icon: Icons.stars_outlined, Label: "โปรไฟล์")

```

**ผลการเปรียบเทียบ:**
```
> โครงสร้างหลัก : มองตรงกันว่าใช้ Scaffold เป็นหน้าต่างหลัก มี AppBar อยู่ด้านบน และใช้ bottomNavigationBar (Material 3) อยู่ด้านล่างสุด
> การจัดการรายการสินค้าในหน้าจอหลัก
    > มนุษย์ : มองแบบรวบยอดโดยดึงเอา ItemCard แยกออกเป็น Custom Widget ชิ้นเดียว ทำให้โครงสร้างดูสะอาดและเป็นระเบียบ
    > AI : แตกโครงสร้างภายใน Card ออกมาละเอียดยิบย่อย ซึ่งทำให้เห็นการจัดวาง UI ชัดเจนมาก แต่อาจจะทำให้ไฟล์หลักโค้ดยาวเกินไปหากไม่แยกเป็น Widget ย่อย
> การจัดวางปุ่มลอยตัว
    > มนุษย์ : เลือกใช้ Property floatingActionButton ของ Scaffold ตรงๆ ซึ่งเป็นวิธีมาตรฐานและถูกต้องที่สุดของ Flutter
    > AI : เนื่องจาก AI ประมวลผลจาก "รูปภาพ 2 มิติ" มันจึงมองเห็นแค่ว่ามีปุ่มวางซ้อนทับอยู่ด้านบนรายการสินค้า AI เลยเลือกใช้โครงสร้าง Stack และใช้ Positioned เพื่อยึดปุ่ม FilledButton.icon ไว้ที่มุมขวาล่างแทน ซึ่งในทางปฏิบัติเขียนแบบนี้ทำงานได้เหมือนกัน แต่ไม่ใช่ Best Practice ของโครงสร้าง Material Design
> ความละเอียดของ App Bar : AI สแกนภาพแล้วเห็นรายละเอียดครบถ้วน จึงกำหนด leading (ปุ่มเมนูด้านซ้าย) และ actions (รูปโปรไฟล์ด้านขวา) มาให้ใน Tree ด้วย ในขณะที่เราวางโครงหลักไว้แค่ชื่อ Title
```

---
[⬅️ ย้อนกลับไปหน้าหลัก (สารบัญ)](README.md)