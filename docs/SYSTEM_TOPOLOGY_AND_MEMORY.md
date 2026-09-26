# זיכרון מצב מאוחד ומפות סביבה (System Topology & Unified Memory)

נשמר מהמכתב של 24/09/2026. הקובץ הזה אינו מיזוג ל-`main` עד אישור. `STATUS.md` ו-`PROJECT_INDEX.md` נשארים מקורות הסטטוס הרשמיים עד החלטה נפרדת.

## 1. מטרת העל

ריכוז כלל נכסי המערכת, תפקידי המודלים, מצבי ה-Workflow והיסטוריית הריצות במקום אחד מרכזי ב-GitHub, על מנת למנוע כפילויות, פיזור מידע והעברת נתונים ידנית בין צ'אטים.

## 2. מיפוי אפליקציות, מודלים ותפקידים בצוות

| אפליקציה / כלי | מודל / רכיב פעיל | תפקיד במערכת | סטטוס נוכחי ומצב אבטחה |
| --- | --- | --- | --- |
| GitHub | github-sync Repository | זיכרון מרכזי, ניהול קוד, גרסאות, תיעוד וחוזי נתונים | פעיל (Public Repository) |
| CodeRabbit | GitHub App Bot | סקירת PRs אוטומטית, זיהוי פרצות אבטחה, אכיפת תקנים ויצירת Prompts | מחובר למאגר; מבצע סריקות ב-PRs |
| n8n Cloud | Cycle Lab 2409 | מנוע אוטומציה וזרימת נתונים בין מודלים | FROZEN / Draft Mode (נבדק ב-Paper Run ID#13) |
| Perplexity | Research Engine | שכבת מחקר, אימות מקורות, ניתוח סיכונים וניסוח טיוטות | RESEARCH_ONLY (ללא API calls בלייב) |
| Claude Code / Cline | VS Code Agent | פיתוח קוד מקומי, ניהול Hooks (PreToolUse/PostToolUse) ו-Skills | Sandbox מקומי מבוקר |
| Grok | Verification Agent | אימות נתונים, סיכום סטטוסים ובדיקות עקביות של הרצות נייר | פעיל בצ'אט ניטור וביקורת |
| Gemini | AI Processor | ניתוח טקסט, תמצית מורכבת והזנת נתונים ראשונית (Gemini Summary) | מיוצג ב-Workflow ב-n8n |
| Copilot | Merge Agent | מיזוג נתונים מרובי מקורות (Copilot Merge) והשלמות קוד | מיוצג ב-Workflow ב-n8n |
| DeepSeek / ChatGPT | Logic & Code Agents | אלגוריתמיקה, כתיבת סקריפטים ופתרון בעיות מבניות | עבודה בסביבת VS Code / Chat |
| Notion / Slack | Communication Layer | תיעוד משאבים והודעות עדכון לצוות | מחוברים לסנכרון חי כפוף לאישור |
| monday.com | Master Management Context | מנהל על ומסגרת תיאום עבודה מרוכזת | הנהלה ראשית |

## 3. היסטוריית ריצה מאומתת – n8n (Cycle Lab 2409)

- סטטוס ריצה אחרונה: ID#13 (תאריך 24/09/2026, 03:40:32).
- תוצאה: Succeeded in 1.964s.
- מסלול הנתונים המאומת (Green Path): When clicking Test workflow → Normalize Input → IF Validation → Route Step → Gemini Summary → Perplexity Research → Grok Verification → Copilot Merge → Mark Complete.
- פלט Node סופי (Mark Complete):
  - run_id: cycle-test-001
  - status: COMPLETED
  - approval_status: HOLD (מנגנון הגנה Fail-Closed)
- מגבלות אבטחה בתוקף:
  - כפתור Publish לא נלחץ (Draft Mode נשמר).
  - אין חיבור חי לשירותי מייל, monday או API חיצוניים.

## 4. חוקי עבודה ומשמעת צוות (Team Rules)

1. מקור אמת יחיד: קובץ זה ב-GitHub הוא הסמכות לקביעת סטטוס הפרויקטים.
2. איסור Side-Effects: אין להפעיל מפתחות API, הרצות אוטומטיות בלייב או כתיבה למערכות חיצוניות ללא אישור אנושי מפורש ממורדכי.
3. חובת חתימה: כל מודל מחויב לחתום בתחתית כל הודעה/תשובה בצ'אט במבנה המוגדר: [שם המודל] | [שם הצ'אט/הפלטפורמה] | [תאריך ושעה].
