# Slack Agents on Vercel with the AI SDK

**סטטוס:** DRAFTED (סיכום נכתב, טרם בוצע הקורס בפועל)
**מקור רשמי:** <https://vercel.com/academy/slack-agents>
**פלטפורמה:** Vercel Academy
**עדכון אחרון של דף זה:** 17.09.2026

---

## FACT — נתונים מאומתים מהמקור הרשמי

- מוקד הקורס: בניית סוכן Slack ש"עדיין עונה ב-3 בלילה" — משכפול תבנית Slack Agent ועד פריסת בוט על Vercel ששורד rate limits וכשלי API בלי להשאיר את הצוות "עיוור" (ללא נראות).
- משך משוער: 6–10 שעות ממוקדות.
- ארבעה תחומי למידה שמציג דף הקורס הרשמי:
  1. **Foundation & Architecture** — הקמת sandbox, חיווט Nitro + Bolt, אירועי HTTP מבוססי VercelReceiver, ו-correlation middleware.
  2. **Interaction Surfaces** — פקודות, קיצורי דרך, חלונות ו־App Home, עם אישור קבלה ומעקב לפי מזהה בקשה.
  3. **AI Orchestration** — system prompts, כלים, streaming, retries, ו-fallback באמצעות ה-AI SDK.
  4. **Production Operations** — פריסה ל-Vercel, הרשאות מינימליות, structured logs ו-runbook.
- בנפרד, דף הקורס מונה שש יחידות: Orientation, Slack Apps, Interaction Surfaces, AI Orchestration & Tools, Deployment & Operations, Course Complete.
- תוצרי למידה מוצהרים: סוכן Slack שרץ בסביבת עבודה אמיתית (לא רק ערוץ הדגמה) — כולל טיפול בשגיאות ו-retries, structured logs עם correlation IDs, OAuth scopes מינימליים, תזמור AI דרך ה-AI SDK, ו-runbook + SLOs שמאפשרים לאדם אחר לתחזק את המערכת.

## OBSERVATION — פרשנות/סיכום שלנו

- זהו הקורס המורכב ביותר מבין ארבעת אלה שנכתבו בשלב זה — הוא לא רק "Foundations" אלא בניית מערכת production-grade מקצה לקצה, כולל שכבת תפעול (SLOs, runbook) שלא מופיעה בקורסים האחרים.
- קיימת חפיפה ישירה עם עולם התוכן של המאגר הזה (`github-sync`): הרעיון של "correlation IDs" ו-"structured logs" מוזכר גם ב-README.md של המאגר תחת "Safety and quality" — סימן שהקורס הזה רלוונטי במיוחד אם בעתיד ירצו לחבר סוכן Slack כחלק מהאקוסיסטם הרב-סוכנים.
- מומלץ לבצע קורס זה **אחרי** "Vercel Foundations" ו-"Workflow Foundations", כי הוא מניח היכרות עם דשבורד הפריסה ועם דפוסי עבודה אסינכרוניים/עמידים לכשלים (retries, resumability) שהקורס Workflow Foundations מלמד בנפרד.

## UNSUPPORTED — טרם אומת

- ארבעת תחומי הלמידה ושש יחידות הקורס אומתו מול הדף הרשמי. רשימת כל השיעורים הבודדים ותוכנם עדיין לא אומתו במלואם.
- לא אומת אם הקורס דורש חשבון Slack workspace אמיתי כדי להשלים את התרגול (סביר, אך לא מאושר מהמקור).
- **חשוב מבחינת SAFETY_RULES:** קורס זה מלמד חיבור בין Slack ל-Vercel/AI SDK בפועל. כל יישום בפועל של הידע הזה (יצירת אינטגרציה חדשה, טוקנים, OAuth scopes אמיתיים) כפוף לכלל "אין אוטומציות חדשות ללא אישור אנושי" (SAFETY_RULES #2) ו"אין כתיבה חיצונית ללא אישור אנושי" (#1) — זה קורס לימודי בלבד בשלב זה, לא אישור להקמת סוכן Slack חי.

## מה עוד נדרש כדי לסגור פערים

- גישה ידנית ל-<https://vercel.com/academy/slack-agents> לפירוט השיעורים בתוך כל חטיבה.
- אם וכאשר יוחלט להטמיע סוכן Slack בפועל — יש לפתוח דיון נפרד ומאושר בנפרד, מחוץ להיקף "למידה בלבד" של המסמך הזה.
