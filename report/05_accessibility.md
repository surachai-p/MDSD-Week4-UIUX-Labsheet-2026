## 🧪 การทดลองที่ 5: Dark Mode และ Accessibility Check 

### วัตถุประสงค์
ทดสอบว่า UI ทำงานได้ดีทั้ง Light/Dark Mode และผ่าน Accessibility เบื้องต้น

### ผลการทดสอบ

**ขั้นตอนที่ 5.1: ทดสอบ Dark Mode**
* ตรวจสอบความสามารถในการอ่าน (Readability) เมื่อเปลี่ยน `themeMode` เป็น `ThemeMode.dark`
* *บันทึกผล :* โทนสี Dark Mode สามารถอ่านได้ชัดเจน เนื่องจากใช้ระบบ ColorScheme ของ Material 3 ซึ่งมีการคำนวณค่าความเปรียบต่าง ระหว่างสีพื้นหลัง และสีตัวอักษรมาให้อย่างเหมาะสม ตัวหนังสือไม่กลืนไปกับพื้นหลัง

**ขั้นตอนที่ 5.2: ตรวจสอบ Touch Target Size**
* รัน App ใน Debug mode และเปิด Flutter Inspector (Show guidelines)
* ตรวจสอบ Interactive element (ต้องมีขนาดอย่างน้อย 48×48 dp)
* *บันทึกผล :* จากการเปิด Show guidelines พบว่า Interactive elements หลักของแอป เช่น IconButton หรือปุ่มบน Bottom Navigation Bar มีการจองพื้นที่ Layout boundary ที่เพียงพอต่อการสัมผัส โดยปุ่มมาตรฐานของ Material 3 ถูกออกแบบมาให้มีขนาด Touch Target อย่างน้อย 48x48 dp อยู่แล้ว ทำให้ผู้ใช้กดใช้งานได้ง่ายและไม่พลาด

**ขั้นตอนที่ 5.3: ตรวจสอบ Semantic Labels**
* เพิ่ม `Semantics` widget (เช่น `tooltip`) สำหรับ element ที่ไม่มี label ชัดเจน
* *บันทึกผล :* แอปพลิเคชันมีการใช้งาน Semantic Labels ผ่าน Property ต่างๆ อย่างครบถ้วน เช่น การใช้ tooltip : 'ค้นหาสินค้า' ใน IconButton และการมี label ใน FloatingActionButton และ NavigationDestination ซึ่งช่วยให้ระบบ Screen Reader สามารถอ่านบรรยายหน้าที่ของปุ่มให้ผู้บกพร่องทางการมองเห็นเข้าใจได้

---
[⬅️ ย้อนกลับไปหน้าหลัก (สารบัญ)](README.md)