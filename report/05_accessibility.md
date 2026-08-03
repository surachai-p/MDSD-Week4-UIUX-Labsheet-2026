## 🧪 การทดลองที่ 5: Dark Mode และ Accessibility Check 

### วัตถุประสงค์
ทดสอบว่า UI ทำงานได้ดีทั้ง Light/Dark Mode และผ่าน Accessibility เบื้องต้น

### ผลการทดสอบ

**ขั้นตอนที่ 5.1: ทดสอบ Dark Mode**
* ตรวจสอบความสามารถในการอ่าน (Readability) เมื่อเปลี่ยน `themeMode` เป็น `ThemeMode.dark`
* *บันทึกผล:* _______________________________________________

**ขั้นตอนที่ 5.2: ตรวจสอบ Touch Target Size**
* รัน App ใน Debug mode และเปิด Flutter Inspector (Show guidelines)
* ตรวจสอบ Interactive element (ต้องมีขนาดอย่างน้อย 48×48 dp)
* *บันทึกผล:* _______________________________________________

**ขั้นตอนที่ 5.3: ตรวจสอบ Semantic Labels**
* เพิ่ม `Semantics` widget (เช่น `tooltip`) สำหรับ element ที่ไม่มี label ชัดเจน
* *บันทึกผล:* _______________________________________________

---
[⬅️ ย้อนกลับไปหน้าหลัก (สารบัญ)](README.md)