# Optimize Your Vercel Account

**סטטוס:** DRAFTED (סיכום נכתב, טרם בוצע הקורס בפועל)
**מקור רשמי:** <https://vercel.com/academy/optimize-your-vercel-account>
**פלטפורמה:** Vercel Academy
**עדכון אחרון של דף זה:** 17.09.2026

---

## FACT — נתונים מאומתים מהמקור הרשמי

- הקורס בנוי סביב תרחיש דמה: מותג נעליים עצמאי בדיוני בשם "Saturday" — דרכו מתורגלות ההגדרות שמשפיעות על עלות ואבטחה.
- כולל checklist שניתן להריץ עם צוות שלם במהלך אחר-צהריים אחד.
- נושאי אבטחה שמכוסים: sensitive env vars, Deployment Protection ל-previews, כללי firewall מותאמים אישית (custom firewall rules), Bot Protection, וה-Activity Log.
- נושאי עלות שמכוסים: צמצום עלויות function על ידי שינוי מה רץ, מתי, ובאיזו תדירות — כולל Fluid Compute, Runtime Cache, ו-on-demand ISR; וכן צמצום data transferred, requests served, ודקות build.
- הקורס עובר על כל הגדרה בדשבורד Vercel שמשפיעה על אופן ריצת הפרויקטים; תוכנית Hobby מספיקה לרוב השיעורים, וחלקים הרלוונטיים ל-Pro/Enterprise מסומנים בבירור.
- שיעור מתקדם בקורס: התקנת agent skill בשם `vercel-optimize` והרצתו מול פרויקט Vercel אמיתי כדי למפות המלצות מבוססות-פרודקשן.
- תתי-עמודים שאותרו תחת הקורס: Read the Usage Page, Deploy Saturday, Automate the Audit, Tour the Dashboard, Managed Rules, Image Optimization.

## OBSERVATION — פרשנות/סיכום שלנו

- מבנה תתי-העמודים מרמז על סדר לוגי: הכרת הדשבורד (Tour the Dashboard) → פריסת תרחיש הדוגמה (Deploy Saturday) → קריאת נתוני שימוש (Read the Usage Page) → אופטימיזציית תמונות (Image Optimization) → הגדרת כללי ניהול/אבטחה (Managed Rules) → אוטומציה של הביקורת כולה (Automate the Audit).
- הקורס מתאים כשלב שני אחרי "Vercel Foundations" — הוא מניח היכרות בסיסית עם הדשבורד ומרחיב לכיוון עלות ואבטחה בפועל, ולא ליסודות בלבד.
- הרלוונטיות לאקוסיסטם שלנו (github-sync / Learning Hub): הבנת Deployment Protection וניהול env vars רגישים חופפת ישירות לכלל "אין חשיפת מידע רגיש" ב-SAFETY_RULES.md של המאגר הזה.

## UNSUPPORTED — טרם אומת

- מספר מדויק של שיעורים תחת כל תת-נושא (למשל כמה שיעורים תחת "Managed Rules") לא אומת — WebFetch ישיר לדף נחסם ברשת הסביבה (egress proxy ל-vercel.com), והמידע כאן מבוסס על snippet של מנוע חיפוש שמצטט את הדף הרשמי.
- משך זמן כולל מדויק (בשעות) לביצוע הקורס לא צוין במקור שאוחזר.
- פרטי ה-agent skill "vercel-optimize" (התקנה, דרישות מוקדמות) לא אומתו לעומק — יש לבדוק זאת ידנית לפני הרצה על פרויקט אמיתי, בהתאם לכלל "אין אוטומציות חדשות ללא אישור אנושי" (SAFETY_RULES #2).

## מה עוד נדרש כדי לסגור פערים

- גישה ידנית ל-<https://vercel.com/academy/optimize-your-vercel-account> ולתתי-העמודים שלו לאימות רשימת שיעורים מלאה.
- החלטה מפורשת של מוטי לפני הרצת agent skill כלשהו (`vercel-optimize`) מול חשבון Vercel אמיתי.
