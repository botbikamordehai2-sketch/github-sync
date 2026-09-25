# Learning Hub — GitHub + Vercel

תיקייה זו מרכזת תוכנית למידה עצמית ב-GitHub וב-Vercel, לקראת עבודה שוטפת בריפו `github-sync` ופריסות עתידיות (למשל פרויקט `Trinity Gateway Labs`, שטרם אומת — ראו הערה למטה).

## מטרה

- לבנות בסיס ידע מובנה, מבוסס מקורות רשמיים בלבד, לפני שמתחילים לבצע שינויים בפועל בריפו או בפריסות.
- למנוע פעולה "מהבטן" — כל שינוי מבני, אוטומציה, או פריסה עתידית ייבדק קודם מול הידע שנאסף כאן.
- לשמור על עקביות בין הסוכנים השונים באקוסיסטם (Claude, Copilot, Gemini וכו') לגבי מה כבר נלמד ומה עדיין לא.

## מבנה התיקייה

```text
docs/bundle/learning-hub/
├── README.md                          — מסמך זה
├── COURSE_INDEX.md                    — טבלת כל הקורסים, סטטוס, קישור רשמי
├── LEARNING_PLAN.md                   — סדר לימוד מומלץ ותלות בין קורסים
├── PROGRESS.md                        — יומן התקדמות בפועל
├── PRE_DEPLOYMENT_LEARNING_REPORT.md  — דוח מסכם לפני כל פריסה/הטמעה בפועל
├── github/                            — סיכומים מקוריים לקורסי GitHub Skills (כרגע ריקה — טרם נכתב תוכן)
├── vercel/                            — סיכומים מקוריים לקורסי Vercel Academy
└── projects/                          — קבצי פרויקט ספציפיים (ריקה כרגע; ראו הערה)
```

## כללי עבודה במסמכים אלו

1. **מקורות רשמיים בלבד** — vercel.com/academy, github.com/skills, docs.github.com, vercel.com/docs. לא בלוגים חיצוניים, לא סיכומי צד-שלישי כמקור ראשי.
2. **אין העתקת שיעורים מלאים** — רק קישור למקור + סיכום מקורי בשפתנו.
3. **כל טענה מסומנת FACT / OBSERVATION / UNSUPPORTED** (לפי SAFETY_RULES.md של המאגר):
   - **FACT** — אומת ישירות מול המקור הרשמי (או מובאה ישירה ממנו).
   - **OBSERVATION** — פרשנות/מסקנה שלנו, לא ציטוט.
   - **UNSUPPORTED** — טענה שלא הצלחנו לאמת (כולל מקרים שבהם גישה ישירה לדף נחסמה טכנית — ראו הערה על מגבלת רשת למטה).
4. **אין שינוי קבצי ממשל** (`GOVERNANCE.md`, `SAFETY_RULES.md`, `PROJECT_INDEX.md`, `REPOSITORIES.md` וכו') דרך התיקייה הזו.
5. **אין commit/push/PR** ללא אישור מפורש בכל שלב.

## הערת שקיפות טכנית — חסימת רשת

בסביבת ה-agent הנוכחית, גישת WebFetch ישירה לדומיין `vercel.com` (וגם `examples.vercel.com`) חסומה ברמת ה-egress proxy. המידע על קורסי Vercel בתיקייה זו נאסף באמצעות תוצאות חיפוש (WebSearch) שמצטטות את דפי הקורס הרשמיים, **לא** באמצעות טעינה ישירה ומאומתת של הדף. לכן פרטים מסוימים (רשימת שיעורים מדויקת, משכי זמן) מסומנים UNSUPPORTED בכל קובץ קורס עד שיאומתו ידנית מול המקור.

## הערה על `projects/trinity-gateway-labs.md`

הקובץ **לא נוצר** בשלב זה. הפרויקט `Trinity Gateway Labs` אינו מופיע לא ב-`PROJECT_INDEX.md` ולא ב-`REPOSITORIES.md` של מאגר זה — שני מקורות-העל היחידים לפרויקטים/ריפואים באקוסיסטם. סטטוסו: **UNSUPPORTED**. הקובץ ייווצר רק לאחר אישור מפורש ופרטים מאומתים.

## קישורים

- [COURSE_INDEX.md](./COURSE_INDEX.md)
- [LEARNING_PLAN.md](./LEARNING_PLAN.md)
- [PROGRESS.md](./PROGRESS.md)
- [PRE_DEPLOYMENT_LEARNING_REPORT.md](./PRE_DEPLOYMENT_LEARNING_REPORT.md)
