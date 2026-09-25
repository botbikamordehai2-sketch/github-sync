# Learning Plan — Learning Hub

**עדכון אחרון:** 17.09.2026
**עקרון מנחה:** ללמוד GitHub ו-Vercel במקביל שני מסלולים נפרדים (אין תלות ישירה בין המסלולים), אבל בכל מסלול לשמור על סדר הדרגתי מהיסודות למתקדם.

---

## מסלול GitHub — כולם NOT_STARTED

סדר מומלץ (OBSERVATION — מבוסס על סדר "First day" / "First week" הרשמי של GitHub Skills):

1. Introduction to GitHub — `NOT_STARTED`
2. Communicate Using Markdown — `NOT_STARTED`
3. Review Pull Requests — `NOT_STARTED`
4. Resolve Merge Conflicts — `NOT_STARTED`
5. Hello GitHub Actions — `NOT_STARTED`
6. Test with Actions — `NOT_STARTED`
7. Secure Repository Supply Chain — `NOT_STARTED`

**FACT:** GitHub Skills עצמם מקבצים "Introduction to GitHub" ו-"Communicate Using Markdown" תחת "היום הראשון ב-GitHub", ו-"Review Pull Requests" + "Resolve Merge Conflicts" תחת "השבוע הראשון ב-GitHub" — לפי תוצאת החיפוש שאוחזרה מ-`learn.github.com/skills`.
**OBSERVATION:** מיקום "Hello GitHub Actions" → "Test with Actions" → "Secure Repository Supply Chain" בסוף הרשימה הוא הנחה שלנו (מהבסיסי-CI ועד לאבטחת שרשרת אספקה), לא סדר רשמי מאומת במפורש.

## GitHub — משאבי אבטחה נוספים — כולם NOT_STARTED

סדר מומלץ (OBSERVATION — מהיסודי למתקדם, בהמשך למסלול הראשי):

8. CodeQL / Code Scanning — `NOT_STARTED` — **COURSE** מאומת (github.com/skills/introduction-to-codeql)
9. Secret Scanning and Push Protection — `NOT_STARTED` — **COURSE** מאומת (github.com/skills/introduction-to-secret-scanning)
10. Dependabot — `NOT_STARTED` — **RESOURCE** בלבד (לא אומת כ-GitHub Skills עצמאי; חופף חלקית ל-Secure Repository Supply Chain)
11. Branch Protection — `NOT_STARTED` — **RESOURCE** בלבד (לא אותר תרגיל skills/* מתאים)

**OBSERVATION:** מיקום זה בסוף מסלול ה-GitHub הוא הנחה שלנו — אלו נושאי אבטחה מתקדמים שהגיוני ללמוד אחרי היסודות (Introduction, Markdown, PR review, merge conflicts) ואחרי הבסיס של Actions, ולא סדר רשמי מאומת.

## מסלול Vercel

סדר מומלץ (OBSERVATION, מנומק בכל קובץ סיכום בנפרד):

1. **Vercel Foundations** — `DRAFTED` — יסודות חשבון ו-deployments; נקודת כניסה.
2. **Next.js Foundations** — `NOT_STARTED` — יסודות הפריימוורק שרוב הקורסים המתקדמים (AI SDK, Workflow) בנויים עליו.
3. **Optimize Your Vercel Account** — `DRAFTED` — עלות ואבטחה ברמת החשבון, לאחר שמכירים את הדשבורד.
4. **Workflow Foundations** — `DRAFTED` — בניית תהליכים עמידים/רב-שלביים.
5. **Builders Guide to the AI SDK** — `NOT_STARTED` — יסודות ה-AI SDK.
6. **Using AI Gateway in Production** — `NOT_STARTED` — הרחבה ל-AI Gateway בפרודקשן, מניח היכרות עם ה-AI SDK.
7. **Slack Agents on Vercel with the AI SDK** — `DRAFTED` — הקורס המורכב ביותר; משלב AI SDK + workflows/ops; מתאים כשלב מסכם.
8. **Agent-Friendly APIs** — `NOT_STARTED` — בניית API + תיעוד ידידותי לסוכני AI; מניח היכרות בסיסית עם Next.js.
9. **Vercel Sandbox** — `NOT_STARTED` — הרצת קוד לא-מהימן ב-microVMs מבודדים; שלב טכני מתקדם לפני "Creating a Software Factory".
10. **Creating a Software Factory** — `NOT_STARTED` — בניית "factory" מבוסס-סיכון לניהול שינויי קוד על ידי סוכנים; מניח היכרות עם AI Gateway ו-Sandbox.
11. **Enterprise Apps and Agents** — `NOT_STARTED` — אפליקציית ארגון עם סוכן מוגבל-הרשאות ואישור אנושי; מתאים כשלב מסכם/ארגוני.

**UNSUPPORTED:** הסדר בין הקורסים 8–11 (Agent-Friendly APIs, Vercel Sandbox, Creating a Software Factory, Enterprise Apps and Agents) הוא הערכה פנימית שלנו בלבד — מבוססת על כך ש"Creating a Software Factory" מזכיר במקור Sandbox CPU-hours ו-AI Gateway כדרישות טכניות, ו"Enterprise Apps and Agents" עוסק בממשל/אישורים ברמה ארגונית שהגיוני שתבוא אחרונה. אין לכך אישור רשמי מ-Vercel Academy.

**UNSUPPORTED (המשך):** הסדר בין הקורסים 2–6 (Next.js Foundations, Optimize, Workflow, AI SDK, AI Gateway) אינו מגובה בהמלצת סדר רשמית מ-Vercel Academy — זו הערכה פנימית שלנו בלבד, מבוססת על תלות תוכן משוערת (למשל: AI Gateway כנראה מניח AI SDK), ולא על מקור מאומת.

## עדכון תוכנית

התוכנית הזו תעודכן בכל פעם שסטטוס קורס משתנה (`NOT_STARTED` → `DRAFTED` → `VERIFIED`/`COMPLETED`), בתיאום עם [PROGRESS.md](./PROGRESS.md) ו-[COURSE_INDEX.md](./COURSE_INDEX.md). כל שינוי סטטוס טעון אישור מוטי, בהתאם ל-SAFETY_RULES.md סעיף 3.
