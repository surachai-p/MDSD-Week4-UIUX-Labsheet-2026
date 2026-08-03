## 🧪 การทดลอง

### การทดลองที่ 1: สร้าง Color Scheme ด้วย Material Theme Builder

#### วัตถุประสงค์
ใช้ระบบ Dynamic Color ของ Material 3 เพื่อสร้าง Color Scheme สำหรับ Project 

#### ขั้นตอน

**ขั้นตอนที่ 1.1: เปิด Material Theme Builder**
1. เปิด Browser ไปที่ https://m3.material.io/theme-builder
2. จะเห็น UI Preview ของ Material 3 App พร้อม Color Picker

**ขั้นตอนที่ 1.2: สร้าง Color Scheme ของตัวเอง**
1. คลิกที่ **"Primary"** color circle
2. เลือกสีที่เป็น brand color ของ App ที่จะทำ Project
   - ตัวอย่าง: สีเขียว `#2E7D32` สำหรับ App เกี่ยวกับสิ่งแวดล้อม
   - ตัวอย่าง: สีฟ้า `#1565C0` สำหรับ App เกี่ยวกับการเงิน
3. สังเกตว่า Secondary, Tertiary, Neutral **เปลี่ยนอัตโนมัติ** ตาม Primary ที่เลือก
4. ทดลองสลับดูระหว่าง **Light** และ **Dark** mode (รูปไอคอนพระจันทร์ ด้านบนขวามือ) สังเกตว่า contrast ยังชัดเจน

**ขั้นตอนที่ 1.3: Export เป็น Flutter Code**
1. คลิก **"Export"** ที่มุมขวาบน (ไอคอน สี่เหลี่ยม มีเครื่องหมาย + ตรงกลาง)
2. เลือก **"Flutter"**
3. จะได้ไฟล์ `lib/theme.dart` ที่มี `ColorScheme` สำหรับ Light และ Dark
   **การจัดการ Theme สามารถทำได้บน Figma เช่นกัน โดย กดปุ่ม Ctrl + P แล้วค้นหา Plugins ชื่อ Material Theme Builder แล้วทำการกำหนดค่าสีของ Theme ตามต้องการ**


**ขั้นตอนที่ 1.4: บันทึกผล**

| รายการ | ค่าที่ได้ |
|--------|---------|
| Primary Color (Hex) | _________________ |
| Secondary Color (Hex) | _________________ |
| Primary Container (Hex) | _________________ |
| Surface (Hex) | _________________ |

> **คำถาม:** Primary, On Primary, Primary Container, On Primary Container คืออะไร มีลักษณะความสัมพันธ์ของสีอย่างไร?  วิเคราะห์และเติมตารางด้านล่าง

| สี | หน้าที่ |
|-----|--------|
| Primary | _________________ |
| On Primary | _________________ |
| Primary Container | _________________ |
| On Primary Container | _________________ |

---

### การทดลองที่ 2: ออกแบบ UI Mockup ด้วย Figma

#### วัตถุประสงค์
สร้าง Mockup ของ Mobile App อย่างน้อย 3 หน้าด้วย Material Design 3

#### ขั้นตอนเตรียมการ Figma

**ขั้นตอนที่ 2.1: ตั้งค่า Figma Project**
1. ไปที่ https://figma.com และ Login (สร้าง Account ฟรีถ้ายังไม่มี)
2. คลิก **File -> New -> Design**
3. ตั้งชื่อไฟล์: `[ชื่อนักศึกษา]_Week03_MobileUI`
4. ลบ Frame เริ่มต้นออก (ถ้ามี)

**ขั้นตอนที่ 2.2: Import Material Design 3 Kit**


1. เลือกเมนู Assets ที่อยู่ด้านซ้าย
2. เลือก Material 3 Design Kit

**ขั้นตอนที่ 2.3: สร้าง Frame สำหรับ Mobile**
1. กด `F` (Frame tool)
2. ด้านขวามือ สร้าง Mobile Frame  ความกว้างประมาณ 360 dp ความสูงประมาณ 800 dp  (ไม่ต้องยึดชื่อ Preset เพราะ Figma เปลี่ยนชื่อ/ค่า Preset อยู่เรื่อย ๆ ให้พิมพ์ตัวเลข W/H เองในแผง Properties ด้านขวา)
3. สร้าง Frame 3 ชุด (ใช้การ Copy & Paste ได้)ตั้งชื่อ:
   - `Home Screen`
   - `Detail Screen`
   - `Profile Screen`
4. จัดเรียง Frame ให้ชิดกัน



#### ขั้นตอนออกแบบหน้าหลัก (Home Screen)

**ขั้นตอนที่ 2.4: ออกแบบ App Bar**
1. คลิกที่ Frame `Home Screen`
2. เลื่อก Assets → Material 3 Design Kit -> **App bar**
3. ลาก Component ลงบน Frame 
4. วางที่ด้านบนสุด (y = 0)
5. ปรับ width ให้เต็ม Frame (360 dp)
6. Double-click เพื่อแก้ไขชื่อ: **"Green Market by (ชื่อนักศึกษา)"

**ขั้นตอนที่ 2.5: ออกแบบ Content Area (รายการสินค้าผักผลไม้)**
1. **สร้าง Card สำหรับ Item สินค้า:**
   - ไปที่แผง Assets -> ค้นหา **"Card"** แล้วลาก Component `Horizontal Card` ลงบน Frame
   - ปรับขนาด Card เป็น Width = 328px, Height = 100px
   - ที่แผง Design ด้านขวา สังเกตส่วน Fill: ให้เลือกใช้ Theme ที่ทำการสร้างในไฟล์ (Create in this file)
      **การจัดการ Theme สามารถทำได้บน Figma เช่นกัน โดย กดปุ่ม Ctrl + P แล้วค้นหา Plugins ชื่อ Material Theme Builder แล้วทำการกำหนดค่าสีของ Theme ตามต้องการ**
   - จัดตำแหน่ง Card ให้อยู่กลางหน้าจอ (ต่อจาก App Bar)
2. **ปรับแต่งคุณสมบัติต่าง ๆ ของ Card สินค้า:**
   - แก้ไข Header text เป็น **"ผักสลัดออร์แกนิก"** 
   - แก้ไข Subhead Text เป็น **"สดใหม่จากฟาร์ม • ฿45 / กิโลกรัม"**
3. **จัดกลุ่มด้วย Auto Layout และทำซ้ำ (Duplicate):**
   - คลิกขวาที่ Card แล้วเลือก **"Add Auto Layout"** (คีย์ลัด `Shift + A`) เพื่อให้การจัดระยะห่างภายใน Card เป็นไปตามมาตรฐาน
   - คัดลอก Card ออกมาเป็น 4 รายการ โดยกด เลือก ที่ เมนู File -> เลือก Frame ของ card ดังกล่าว -> เลือก card ->  กด`Cmd/Ctrl + D` แล้วเปลี่ยนข้อมูลสินค้าให้หลากหลาย:
     - รายการที่ 1: ผักสลัดออร์แกนิก (สดใหม่จากฟาร์ม • ฿45 / กิโลกรัม)
     - รายการที่ 2: สตรอว์เบอร์รีสด (หวานกรอบ เกรดพรีเมียม • ฿120 / กล่อง)
     - รายการที่ 3: กล้วยหอมทอง (อุดมด้วยวิตามิน • ฿35 / หวี)
     - รายการที่ 4: มะเขือเทศเชอร์รี (ปลอดสารเคมี 100% • ฿50 / ถุง)
   - เว้นระยะห่างระหว่าง Card แต่ละใบ (Spacing) เท่ากับ 12px
4. **เพิ่ม Floating Action Button (FAB):**
   - ค้นหา **"FAB"** ในแถบ Assets
   - ลาก `Extended FAB` มาวางไว้บริเวณมุมล่างขวา (X = 220px, Y = 680px)
   - เปลี่ยนข้อความบน FAB เป็น **"+ เพิ่มสินค้า"**
5. **เพิ่ม Bottom Navigation Bar:**
   - ค้นหา **"Navigation Bar: Vertical items"** ในแถบ Assets
   - ลากมาวางด้านล่างสุดของ Frame (X = 0, Y = 741px)
   - กำหนดให้มี 3 Destinaton Icon/Label:
     - Item 1: `หน้าหลัก` (Icon: home, สถานะ Active)
     - Item 2: `ค้นหา` (Icon: search)
     - Item 3: `โปรไฟล์` (Icon: person)
**กรณีหา icon ไม่เจอ ให้เปลี่ยนไปเลือก Simple Design System**
---

#### ขั้นตอนออกแบบหน้ารายละเอียดสินค้า (Detail Screen)

**ขั้นตอนที่ 2.6: ออกแบบ Detail Screen**
1. คลิกเลือก Frame `Detail_Screen`
2. ลาก Component **App Bar** มาวางด้านบนสุด (X = 0, Y = 0)
   - เปลี่ยน Title เป็น **"รายละเอียดสินค้า"**
   - เปิดการแสดงผล Navigation Icon ฝั่งซ้ายให้เป็นไอคอนย้อนกลับ (`arrow_back`) **ดูในส่วนของ Leading icon: เปลี่ยนตรง icon**
3. **ส่วนแสดงรูปภาพปกสินค้า (Banner Image):**
   - สร้าง Rectangle ขนาด 360 × 200px วางต่อใต้ App Bar (Y = 64px)
   - ตั้งค่าการ Fill ให้เป็น image และใส่รูปภาพขนาดใหญ่ตรงกลางเพื่อจำลองเป็นรูปภาพสินค้า
4. **ส่วนรายละเอียดเนื้อหา (Product Info):**
   - ใส่ข้อความชื่อสินค้า **"ผักสลัดออร์แกนิก"** -> กำหนด Text Style เป็น **"Headline Medium"**
   - ใส่ข้อความราคา **"฿45 / กิโลกรัม"** -> กำหนด Text Style เป็น **"Title Large"** สี `Primary`
   - ใส่ข้อความหัวข้อ **"รายละเอียดสินค้า"** -> Text Style **"Title Medium"**
   - ใส่ข้อความบรรยาย: **"ผักสลัดออร์แกนิกปลูกด้วยระบบไฮโดรโปนิกส์ ไม่ใช้สารเคมีฆ่าแมลง เก็บสดใหม่ทุกเช้า เหมาะสำหรับทำสลัดสุขภาพ"** -> Text Style **"Body Large"**
5. **ส่วนปุ่มดำเนินการ (Action Buttons):**
   - ลาก Component **Button** มาวางด้านล่าง -> กำหนด Width = 328px, เปลี่ยนข้อความเป็น **"เพิ่มลงตะกร้าสินค้า"** (Primary Action)
   - ลาก Component **Outlined Button** วางต่อด้านล่าง -> กำหนด Width = 328px, เปลี่ยนข้อความเป็น **"ย้อนกลับ"** (Secondary Action)

---

#### ขั้นตอนออกแบบหน้าโปรไฟล์ผู้ใช้ (Profile Screen)

**ขั้นตอนที่ 2.6b: ออกแบบ Profile Screen**
1. คลิกเลือก Frame `3_Profile_Screen`
2. ลาก **oApp Bar** มาวางด้านบนสุด เปลี่ยน Title เป็น **"โปรไฟล์ผู้ใช้"**
3. **ส่วนข้อมูลผู้ใช้งาน:**
   - สร้าง Circle (กด `O`) ขนาด 80 × 80px วางไว้กึ่งกลางหน้าจอ (X = 140px, Y = 100px) กำหนดสีเป็น `Primary Container` และใส่ Text ตัวอักษรย่อ หรือ Icon `person`
   - ใส่ข้อความชื่อผู้ใช้ **"สมชาย ใจดี"** -> Text Style **"Headline Small"**
   - ใส่ข้อความอีเมล **"student_ID@kmitl.ac.th"** -> Text Style **"Body Medium"** สี `On Surface Variant`
4. **ส่วนปุ่มจัดการโปรไฟล์:**
   - ลาก Component **Button - Outline** วางกึ่งกลาง -> เปลี่ยนข้อความเป็น **"แก้ไขข้อมูลโปรไฟล์"**
5. **วาง Navigation Bar: Horizontal โดยการคัดลอกจากหน้าหลัก**
   - คัดลอก Navigation Bar จากหน้า Home มาวางที่ตำแหน่งเดียวกัน (Y = 720px)
   - ปรับสถานะ Active ให้ไฮไลท์อยู่ที่ Item 3 (`โปรไฟล์`)

---

#### ขั้นตอนทำ Prototype และเชื่อมโยงหน้าจอ

**ขั้นตอนที่ 2.7: เพิ่ม Prototype Connection**
1. สลับโหมดการทำงานที่แผงขวาจาก **Design** เป็น **Prototype**
2. เลือก Card สินค้ารายการแรก ("ผักสลัดออร์แกนิก") ในหน้า `1_Home_Screen`
3. ลากเส้นเชื่อมโยง (Node) จาก Card ใบนั้นไปยัง Frame `2_Detail_Screen`
4. ในหน้าต่าง Interaction Details กำหนดค่าดังนี้:
   - **Trigger:** `On tap`
   - **Action:** `Navigate to` -> `2_Detail_Screen`
   - **Animation:** `Smart animate` หรือ `Slide in` (Ease out 300ms)
5. ทดลองทดสอบความถูกต้องโดยกดปุ่ม **Present** (รูปไอคอน Play มุมบนขวา หรือ `Cmd/Ctrl + Shift + Enter`)

**ขั้นตอนที่ 2.8: บันทึกผลการทดลอง**

Screenshot หน้าจอ Design ทั้ง 3 หน้า และบันทึกข้อมูลสรุป:

```image
วางรูปหน้าจอ ที่นี่
```

---

### การทดลองที่ 3: แปลง Design เป็น Flutter Code

#### วัตถุประสงค์
เขียน Flutter Widget จาก Design แอปพลิเคชัน **"Green Market"** ที่ออกแบบไว้ใน Figma

#### ขั้นตอนเตรียมการ

**ขั้นตอนที่ 3.1: เตรียม Flutter Project**
1. เปิด Terminal / Command Prompt
2. สร้าง Flutter Project ใหม่:
   ```bash
   flutter create week03_ui_lab
   cd week03_ui_lab
   ```
3. เปิดด้วย VS Code:
   ```bash
   code .
   ```
4. คัดลอกไฟล์ `lib/theme.dart` ที่ Export มาจาก**การทดลองที่ 1** (ขั้นตอนที่ 1.3) ไปวางไว้ที่ `lib/theme.dart` — นี่คือจุดที่งานจากการทดลองที่ 1 ถูกนำมาใช้จริงในการทดลองนี้

**ขั้นตอนที่ 3.2: ตั้งค่า Material 3 Theme**

เปิดไฟล์ `lib/main.dart` และแก้ไขเป็น:

```dart
import 'package:flutter/material.dart';
import 'theme.dart';                 // Theme ที่ Export จาก Material Theme Builder
import 'screens/home_screen.dart';   // หน้า Home ของแอป

void main() {
  // จุดเริ่มต้นของโปรแกรม Flutter
  runApp(const MyApp());
}

///
/// MyApp เป็น Widget หลักของแอปพลิเคชัน
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // ------------------------------------------------------------------
    // สร้าง MaterialTheme จากไฟล์ theme.dart
    //
    // Material Theme Builder จะสร้างคลาส MaterialTheme มาให้
    // โดยต้องส่ง TextTheme เข้าไปใน Constructor
    //
    // ThemeData(useMaterial3: true).textTheme
    // คือ TextTheme มาตรฐานของ Material Design 3
    // ------------------------------------------------------------------
    final materialTheme = MaterialTheme(
      ThemeData(useMaterial3: true).textTheme,
    );

    return MaterialApp(

      // ชื่อแอปพลิเคชัน
      title: 'Green Market App',

      // ซ่อนแถบ DEBUG ที่มุมขวาบน
      debugShowCheckedModeBanner: false,

      // --------------------------------------------------------------
      // Theme สำหรับโหมด Light
      //
      // ใช้ ThemeData ที่สร้างจาก Material Theme Builder
      // ภายในประกอบด้วย
      // - ColorScheme
      // - Typography
      // - Surface Color
      // - Scaffold Background
      // และค่าต่าง ๆ ของ Material Design 3
      // --------------------------------------------------------------
      theme: materialTheme.light(),

      // --------------------------------------------------------------
      // Theme สำหรับโหมด Dark
      // --------------------------------------------------------------
      darkTheme: materialTheme.dark(),

      // --------------------------------------------------------------
      // เลือก Theme ตามการตั้งค่าของระบบปฏิบัติการ
      //
      // ThemeMode.system
      //   Light Mode -> ใช้ theme
      //   Dark Mode  -> ใช้ darkTheme
      // --------------------------------------------------------------
      themeMode: ThemeMode.system,

      // หน้าแรกของแอป
      home: const HomeScreen(),
    );
  }
}
```


**ขั้นตอนที่ 3.3: วิเคราะห์ Design เป็น Widget Tree**

ก่อนเขียน code ให้วาด Widget Tree บนกระดาษหรือ Whiteboard:

```
สำหรับ Green Market Home Screen:

Scaffold
├── AppBar
│   └── Text("Green Market")
├── body: ListView
│   ├── ItemCard (ผักสลัดออร์แกนิก)
│   ├── ItemCard (สตรอว์เบอร์รีสด)
│   ├── ItemCard (กล้วยหอมทอง)
│   └── ItemCard (มะเขือเทศเชอร์รี)
├── floatingActionButton: FloatingActionButton.extended ("+ เพิ่มสินค้า")
└── bottomNavigationBar: NavigationBar
      ├── NavigationDestination (หน้าหลัก)
      ├── NavigationDestination (ค้นหา)
      └── NavigationDestination (โปรไฟล์)
```

**ขั้นตอนที่ 3.4: สร้างไฟล์โครงสร้าง**

สร้างไฟล์ใหม่ใน `lib/`:
```
lib/
├── main.dart
├── theme.g.dart
├── screens/
│   ├── home_screen.dart
│   └── detail_screen.dart
└── widgets/
    └── item_card.dart
```

สร้างโฟลเดอร์และไฟล์ด้วยคำสั่ง:
```bash
mkdir -p lib/screens lib/widgets
touch lib/screens/home_screen.dart
touch lib/screens/detail_screen.dart
touch lib/widgets/item_card.dart
```

#### ขั้นตอนเขียน Widget หลัก

**ขั้นตอนที่ 3.5: สร้าง ItemCard Widget**

เปิด `lib/widgets/item_card.dart`:

```dart
import 'package:flutter/material.dart';

/// ItemCard แสดงข้อมูลสินค้าในแอป Green Market
/// เป็น Reusable Widget ที่รับ data ผ่าน Constructor
class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ดึง ColorScheme และ TextTheme จาก Theme ของแอพ
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 1, // Material 3 Elevated Card style
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      clipBehavior: Clip.antiAlias, // ตัดขอบ Ripple Effect ไม่ให้ล้น Card
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Product Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Product Detail Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Chevron Icon
              Icon(
                Icons.chevron_right,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**ขั้นตอนที่ 3.6: สร้าง Home Screen**

เปิด `lib/screens/home_screen.dart`:

```dart
import 'package:flutter/material.dart';
import '../widgets/item_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // รายการสินค้าตัวอย่างของแอป Green Market
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'ผักสลัดออร์แกนิก',
      'subtitle': 'สดใหม่จากฟาร์ม • ฿45 / กิโลกรัม',
      'icon': Icons.eco,
    },
    {
      'title': 'สตรอว์เบอร์รีสด',
      'subtitle': 'หวานกรอบ เกรดพรีเมียม • ฿120 / กล่อง',
      'icon': Icons.shopping_basket,
    },
    {
      'title': 'กล้วยหอมทอง',
      'subtitle': 'อุดมด้วยวิตามิน • ฿35 / หวี',
      'icon': Icons.lightbulb_outline,
    },
    {
      'title': 'มะเขือเทศเชอร์รี',
      'subtitle': 'ปลอดสารเคมี 100% • ฿50 / ถุง',
      'icon': Icons.local_florist,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Green Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'ค้นหาสินค้า',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ItemCard(
            title: item['title'],
            subtitle: item['subtitle'],
            icon: item['icon'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    title: item['title'],
                    subtitle: item['subtitle'],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('เปิดหน้าเพิ่มสินค้าใหม่'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('เพิ่มสินค้า'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'ค้นหา',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
```

**ขั้นตอนที่ 3.7: สร้าง Detail Screen**

เปิด `lib/screens/detail_screen.dart`:

```dart
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดสินค้า'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Placeholder สำหรับรูปสินค้า
            Container(
              width: double.infinity,
              height: 200,
              color: colorScheme.primaryContainer,
              child: Icon(
                Icons.eco,
                size: 80,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'รายละเอียดสินค้า',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'สินค้าเกษตรคุณภาพสูง ปลูกด้วยกระบวนการธรรมชาติ ปลอดภัยจากสารเคมี '
                    'คัดสรรเป็นพิเศษจากฟาร์มสมาชิกของ Green Market เพื่อให้คุณได้รับประทานอาหาร '
                    'เพื่อสุขภาพที่สดใหม่ในทุกวัน',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('เพิ่มลงตะกร้าสินค้าเรียบร้อยแล้ว'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('เพิ่มลงตะกร้าสินค้า'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('ย้อนกลับ'),
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
```

**ขั้นตอนที่ 3.8: อัปเดต main.dart**

เพิ่ม import และเชื่อมต่อ HomeScreen ให้ถูกต้อง:

```dart
import 'package:flutter/material.dart';
import 'theme.dart';                 // Theme ที่ Export จาก Material Theme Builder
import 'screens/home_screen.dart';   // หน้า Home ของแอป

// ในคลาส MyApp ให้กำหนด home: const HomeScreen()
```

**ขั้นตอนที่ 3.9: รัน App และตรวจสอบ**

```bash
flutter run
```

ตรวจสอบความถูกต้อง:
- [ ] App Bar แสดงชื่อ "Green Market"
- [ ] แสดงรายการสินค้า Card ทั้ง 4 รายการถูกต้อง
- [ ] กด Card สินค้าแล้ว Navigate ไปยัง Detail Screen ได้
- [ ] กด Back / ปุ่มย้อนกลับได้ถูกต้อง
- [ ] Bottom Navigation สลับ Tab ได้
- [ ] FAB แสดง SnackBar เมื่อถูกคลิก

**แก้ไขเปลี่ยนแปลง App Bar ให้แสดง คำว่า "Dev by" ตามด้วยชื่อนักศึกษา** แล้วบันทึกรูปผลการทดลอง
```image
บันทึกรูปที่นี่
``` 
---

### การทดลองที่ 4: ใช้ AI ช่วย Generate UI Component (30 นาที)

#### วัตถุประสงค์
ฝึกใช้ Google AI Studio สร้าง Flutter Widget

#### ขั้นตอน

**ขั้นตอนที่ 4.1: เปิด Google AI Studio**
1. ไปที่ https://aistudio.google.com
2. Login ด้วย Google Account
3. คลิก **"+ New prompt"** → เลือก **"Chat prompt"**

**ขั้นตอนที่ 4.2: Generate ProfileCard Widget**

Copy Prompt ต่อไปนี้ใส่ใน AI Studio:

```
You are an expert Flutter developer using Material Design 3.

Create a Flutter StatelessWidget called "UserProfileCard" that:
1. Shows a circular user avatar (radius 32) using CircleAvatar with initials as fallback
2. Displays username using titleLarge TextStyle
3. Shows email using bodyMedium TextStyle in onSurfaceVariant color
4. Shows a "Follow" FilledButton and "Message" OutlinedButton side by side
5. Shows a row of 3 stats: Posts, Followers, Following (using Column: number + label)
6. Uses Card widget with proper Material 3 elevation
7. Reads colors from Theme.of(context).colorScheme (NO hardcoded colors)
8. Has proper padding (16px) and spacing (8px between elements)
9. Accepts these constructor parameters: name, email, avatarUrl (nullable), 
   postsCount, followersCount, followingCount

Add brief comments explaining each section.
```

**ขั้นตอนที่ 4.3: วิเคราะห์ Code ที่ได้**

อ่าน code ที่ AI สร้างและตอบคำถาม:

| คำถาม | คำตอบ |
|-------|-------|
| AI ใช้ Widget อะไรสร้าง Avatar? | _________________ |
| AI handle กรณี avatarUrl เป็น null อย่างไร? | _________________ |
| AI ใช้ color จาก Theme หรือ hardcode? | _________________ |
| มีส่วนไหนที่ควรปรับปรุง? | _________________ |

**ขั้นตอนที่ 4.4: นำ Code ไปใช้ใน Project**

1. สร้างไฟล์ `lib/widgets/user_profile_card.dart`
2. วาง code จาก AI Studio
3. แก้ไขส่วนที่ผิดหรือไม่เหมาะสม (ถ้ามี)
4. Import และใช้ใน Profile Tab ของ Home Screen (สอบถาม AI ว่าต้องทำอย่างไร)

**ขั้นตอนที่ 4.5: ทดลอง Multimodal — ส่งรูป Figma ให้ AI วิเคราะห์**

1. Screenshot Design จาก Figma ที่ทำในการทดลองที่ 2
2. ใน AI Studio คลิก **"+"** → **"Upload image"**
3. Upload รูป Screenshot
4. พิมพ์ Prompt:
   ```
   This is a mobile app UI design in Figma using Material Design 3.
   Analyze the layout and write the Flutter widget tree structure (as code comments).
   Then implement it as a Flutter StatelessWidget.
   Use Material 3 components and read colors from Theme.of(context).colorScheme.
   ```
5. ดู Code และ Widget Tree ที่ได้ และเปรียบเทียบกับ  Code และ Widget tree ที่เขียนเองในการทดลองที่ 3
   
```text
เขียนผลการเปรียบเทียบที่นี่

```
---

### การทดลองที่ 5: Dark Mode และ Accessibility Check 

#### วัตถุประสงค์
ทดสอบว่า UI ทำงานได้ดีทั้ง Light/Dark Mode และผ่าน Accessibility เบื้องต้น

**ขั้นตอนที่ 5.1: ทดสอบ Dark Mode**

1. ใน `main.dart` เปลี่ยน `themeMode` เป็น `ThemeMode.dark` ชั่วคราว
2. รัน App → ตรวจสอบว่าทุก Text อ่านออกหรือไหม
3. มีสีไหนที่ contrast ต่ำเกินไปไหม (ตัวอักษรจางบนพื้นหลังจาง)
4. เปลี่ยนกลับเป็น `ThemeMode.system`


// ยังไม่ต้องทำข้อ 5.2  5.3
**ขั้นตอนที่ 5.2: ตรวจสอบ Touch Target Size**

ใน Flutter DevTools:
1. รัน App ใน Debug mode: `flutter run --debug`
2. เปิด **Flutter Inspector** กดคีย์ลัด Ctrl + Shift + P (สำหรับ Windows) หรือ Cmd + Shift + P (สำหรับ macOS)

พิมพ์คำว่า: Flutter: Open DevTools
3. Enable **"Show guidelines"** → จะเห็น layout boundary
4. ตรวจสอบว่า Interactive element ทุกชิ้นมีขนาดอย่างน้อย **48×48 dp**

**ขั้นตอนที่ 5.3: ตรวจสอบ Semantic Labels**

เพิ่ม `Semantics` widget สำหรับ element ที่ไม่มี label ชัดเจน:

```dart
// ก่อน: Icon ที่ไม่มี label
IconButton(
  icon: const Icon(Icons.search),
  onPressed: () {},
)

// หลัง: เพิ่ม tooltip เป็น Semantic label
IconButton(
  icon: const Icon(Icons.search),
  onPressed: () {},
  tooltip: 'ค้นหา',  // Screen Reader จะอ่านค่านี้
)
```

ตรวจสอบทุก `IconButton` ว่ามี `tooltip` ครบ

---

### คำถามสรุปการเรียนรู้ (ตอบทุกข้อ)

**ข้อ 1:** Material 3 ต่างจาก Material 2 อย่างไรในด้าน Color System? 

```
คำตอบ: _______________________________________________
```

**ข้อ 2:** เมื่อแปลง Figma Design เป็น Flutter Widget พบปัญหาอะไรบ้าง และแก้ไขอย่างไร?

```
คำตอบ: _______________________________________________
```

**ข้อ 3:** Code ที่ AI สร้างให้นั้นสมบูรณ์แค่ไหน? ต้องปรับปรุงอะไรบ้าง?

```
คำตอบ: _______________________________________________
```

**ข้อ 4:** ถ้าจะนำ UI ที่ออกแบบไปใช้กับ Project จริง จะปรับปรุงอะไรบ้าง?

```
คำตอบ: _______________________________________________
```

---