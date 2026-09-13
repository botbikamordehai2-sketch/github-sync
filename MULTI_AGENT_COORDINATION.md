# תוכנית תיאום רב-סוכנים — מוטי בוטביקה

**תאריך:** 13.09.2026  
**מקור:** לוח האיחוד + זיכרון השיחות + 6 קבצי github-sync  
**סטטוס:** RESEARCH_ONLY — מסמך תיאום/תיעוד בלבד. לא ביצוע. לא הרשאה. לא אוטומציה.

---

## 1. הבעיה שהתוכנית פותרת

מספר סוכני AI פעילים במקביל, ללא תיאום ביניהם: Claude, Notion AI, Eva, Lexi, Sidekick, Copilot, Perplexity, DeepSeek, Angie, ClickUp AI.

זה יצר בפועל:

- **כפילות artifacts** (3 דשבורדים עקבו אחרי אותם פרויקטים)
- **הצעת אוטומציה לא מאושרת** מצד Sidekick
- **סתירות עובדתיות** בין כלים שונים

המטרה: לא לצמצם סוכנים — אלא לתת להם כלל-משחק משותף.

---

## 2. עקרון-העל (חל על כל סוכן)

כללי SAFETY_RULES.md ו־GOVERNANCE.md חלים על *כל* כלי AI:

- FX: תמיד RESEARCH_ONLY  
- אין כתיבה חיצונית ללא אישור אנושי  
- אין שינוי סטטוס ללא אישור אנושי  
- אין אוטומציות חדשות  
- FACT / OBSERVATION / UNSUPPORTED לכל טענה

---

## 3. מיפוי בעלות בפועל

| סוכן | מה הוא מפעיל | סוג גישה |
|---|---|---|
| Claude | לוח האיחוד, תיקוני github-sync, Job Scout, Morning Brief | קורא + מציע |
| Notion AI | קבצי github-sync, NEWS→Notion | כותב ב-Notion |
| Eva | SEO Command Center | כותב ב-monday |
| Lexi | Lead Gen | כותב ב-monday |
| Sidekick | הציע אוטומציה לא מאושרת | נדחה |
| Copilot / Perplexity | מחקר | קורא בלבד |
| DeepSeek | Content Engine (בוטל) | לא פעיל |
| Angie | WordPress | כותב באתר |
| ClickUp AI | Cloud Tracking | פנימי ל-ClickUp |

OBSERVATION: רובם לא רואים זה את זה → תיאום חייב לעבור דרך האדם.

---

## 4. הדפוס שכבר עובד (Notion AI ↔ Claude ↔ אדם)

1. Notion AI מנסח  
2. Claude מצליב FACT/OBSERVATION/UNSUPPORTED  
3. אתה מאשר  
4. רק אז כתיבה

---

## 5. נקודות פתוחות (דורשות החלטה אנושית)

- Sidekick: האם לאשר חלק מהצינור?  
- Lexi: גודל ריצה  
- לוחות פורקס כפולים ב-monday  
- ClickUp AI: האם להפנות ידנית ללוח האיחוד?

---

## 6. כלל אנטי-כפילות

שום סוכן לא יוצר artifact/board חדש לפרויקטים האלה  
בלי לבדוק קודם את לוח האיחוד.

---

## 7. תהליך מוצע להמשך

1. כל טענה מסומנת FACT/OBSERVATION/UNSUPPORTED  
2. אם נוגע ליותר מסוכן אחד → Claude מצליב  
3. אין כתיבה בלי preview + אישור אנושי

---

*מסמך זה הוא תיעוד בלבד. לא בוצע, לא נדחף, לא מפעיל שום סוכן.*
