# Pre-Deployment Learning Report

**מטרת המסמך:** לרכז את מה שכבר נלמד (בשלב סיכום/DRAFTED) לפני כל פריסה בפועל של פרויקט על Vercel, ולסמן מפורשות אילו פערי ידע עדיין פתוחים — כדי שאף פריסה לא תתבצע על בסיס הנחות לא מאומתות.
**היקף:** מבוסס אך ורק על 4 קורסי Vercel שנכתב עבורם סיכום מקורי עד כה (ראו [COURSE_INDEX.md](./COURSE_INDEX.md)). אינו מכסה את קורסי GitHub או את יתר קורסי Vercel שעדיין `NOT_STARTED`.
**עדכון אחרון:** 17.09.2026
**סטטוס המסמך:** DRAFT — טרם מאומת מול הרצת קורס בפועל.

---

## 1. תקציר מנהלים

נאספו סיכומים ראשוניים (DRAFTED) לארבעה קורסים רשמיים ב-Vercel Academy: **Vercel Foundations**, **Optimize Your Vercel Account**, **Workflow Foundations**, ו-**Slack Agents on Vercel with the AI SDK**. כל הסיכומים מבוססים על תוצאות חיפוש שמצטטות את דפי הקורס הרשמיים — **לא** על טעינה ישירה ומאומתת של הדפים, מכיוון ש-WebFetch לדומיין `vercel.com` (וגם `examples.vercel.com`) חסום ברשת הסביבה הנוכחית. משמעות מעשית: המידע כאן מספיק לתכנון ולסדר עדיפויות, **אך אינו מספיק כדי להסתמך עליו כתיעוד טכני מלא לפני פריסה בפועל**. ראו סעיף 4 לפערים שחייבים סגירה.

## 2. מה כן ידוע (FACT, מרוכז מארבעת הקבצים)

| תחום | ידע רלוונטי | מקור |
|---|---|---|
| יסודות חשבון ו-deployments | 9 שיעורי וידאו קצרים; אין starter repo; תרגול ישיר בדשבורד האמיתי | [vercel-foundations.md](./vercel/vercel-foundations.md) |
| עלות ואבטחת חשבון | Deployment Protection, sensitive env vars, custom firewall rules, Bot Protection, Activity Log; Fluid Compute, Runtime Cache, on-demand ISR לצמצום עלות | [optimize-your-vercel-account.md](./vercel/optimize-your-vercel-account.md) |
| תהליכים עמידים | Workflow SDK — קוד ששורד פריסות מחדש, retry אוטומטי, המתנה ארוכה בלי צריכת compute; ארבע חטיבות מ-workflow חד-שלבי ועד אירועים חיצוניים וטיפול בשגיאות | [workflow-foundations.md](./vercel/workflow-foundations.md) |
| תפעול סוכן AI חי | Bolt + Nitro + AI SDK; structured logs, correlation IDs, OAuth scopes מינימליים, runbook + SLOs | [slack-agents-on-vercel-ai-sdk.md](./vercel/slack-agents-on-vercel-ai-sdk.md) |

## 3. חיבור לכללי הבטיחות של המאגר (OBSERVATION)

- **Deployment Protection + sensitive env vars** (מ-"Optimize Your Vercel Account") הם המימוש הטכני הישיר של הכלל "אין חשיפת מידע רגיש" ו"No secrets, tokens, keys" מ-`SAFETY_RULES.md` ו-`README.md` של המאגר — יש להחיל אותם *לפני* כל פריסה ראשונה, לא אחריה.
- **Structured logs + correlation IDs** (מ-"Slack Agents") תואמים ישירות את הדרישה הקיימת ב-README.md של המאגר: "Add logs, correlation IDs, and timestamps for traceability" — כלומר אלו לא "נחמד שיהיה" אלא דרישת סף לפי הממשל הקיים של הריפו.
- **Workflow SDK / retries אוטומטיים** תומכים בעקרון "Keep operations idempotent where possible; avoid sync loops" מה-README — אך טרם נבדק אם יש התאמה ישירה בין ה-SDK הזה לבין לוגיקת הסנכרון הספציפית של `github-sync`.

## 4. פערים פתוחים (UNSUPPORTED) — חובה לסגור לפני פריסה

1. **אין אימות ישיר של דפי המקור.** כל ארבעת הסיכומים מבוססים על snippets של מנוע חיפוש, לא על טעינת הדף המלא. יש לגשת ידנית (מחוץ לסביבת ה-agent החסומה) לארבעת הכתובות ולאמת רשימת שיעורים מדויקת ומשכי זמן.
2. **אין עדיין קורס "Next.js Foundations" מסוכם** — ה-Workflow SDK וה-AI SDK כנראה מניחים היכרות עם Next.js; זהו פער תוכן, לא רק פער אימות.
3. **לא בוצע אף קורס בפועל** (`COMPLETED` אינו קיים עדיין באף שורה ב-[PROGRESS.md](./PROGRESS.md)) — כל מה שיש הוא סיכום תיאורטי, לא תרגול מול חשבון Vercel אמיתי.
4. **לא הוגדר עדיין** אילו הגדרות אבטחה/עלות מ-"Optimize Your Vercel Account" (Deployment Protection, firewall rules, Bot Protection) ייושמו בפועל בפרויקט הספציפי שיפרוס — זו החלטה מאוחרת יותר, לא כאן.
5. **פרויקט `Trinity Gateway Labs`** (שהוזכר כתיקיית יעד עתידית ב-`projects/`) **אינו מאומת** באף מקור-על של האקוסיסטם (`PROJECT_INDEX.md`, `REPOSITORIES.md`) — אסור לתכנן פריסה אליו עד שיאושר ויתועד כראוי.

## 5. המלצה (OBSERVATION, לא החלטה)

לפני כל פריסה בפועל על Vercel במסגרת האקוסיסטם הזה, מומלץ:

1. לסגור את פער האימות הידני (סעיף 4.1) — לפחות לקורסים DRAFTED שרלוונטיים ישירות לפרויקט המדובר.
2. להשלים "Next.js Foundations" אם הפרויקט מבוסס Next.js.
3. לבצע בפועל לפחות את "Vercel Foundations" ו-"Optimize Your Vercel Account" (לא רק לקרוא סיכום) לפני חיבור חשבון Vercel אמיתי לפרויקט ייצור.
4. כל הגדרת אבטחה/סוד (env vars, OAuth scopes) תיושם רק אחרי אישור אנושי מפורש, בהתאם ל-SAFETY_RULES.md סעיפים 1–2.

זהו דוח לימוד בלבד — **אינו** מהווה אישור לביצוע פריסה, יצירת אוטומציה, או חיבור חשבון Vercel אמיתי.

---

## 6. טבלת Evidence (רמת-טענה)

נוספה בשלב 1.1 (17.09.2026). מרכזת כל טענה מהותית שהופיעה בדוח זה ובקובצי הסיכום, עם מקור, שיטת אימות, והאם בוצעה טעינה ישירה של הדף (WebFetch) או רק אחזור דרך תוצאת חיפוש (WebSearch snippet).

| Claim | FACT/OBSERVATION/UNSUPPORTED | Official URL | Directly fetched? | Notes |
|---|---|---|---|---|
| Vercel Foundations: 9 סרטוני וידאו קצרים, ללא starter repo, תרגול בדשבורד אמיתי | FACT | <https://vercel.com/academy/vercel-foundations> | **No** | vercel.com חסום ב-egress proxy; מבוסס WebSearch snippet שמצטט את הדף |
| Vercel Foundations: קהל יעד = לקוחות Vercel חדשים | FACT | <https://vercel.com/academy/vercel-foundations> | No | אותה מגבלה |
| Optimize Your Vercel Account: תרחיש "Saturday" + נושאי אבטחה/עלות (Deployment Protection, firewall, Bot Protection, Fluid Compute, Runtime Cache, ISR) | FACT | <https://vercel.com/academy/optimize-your-vercel-account> | No | אותה מגבלה |
| Optimize Your Vercel Account: agent skill `vercel-optimize` | FACT | <https://vercel.com/academy/optimize-your-vercel-account> | No | אותה מגבלה; פרטי ההתקנה עצמם **UNSUPPORTED** |
| Workflow Foundations: 4 חטיבות (First Workflow / Multi-Step / Waiting for Real World / When Things Go Wrong) | FACT | <https://vercel.com/academy/workflow-foundations> | No | אותה מגבלה |
| Slack Agents on Vercel: 3 חטיבות, 6–10 שעות, Bolt+Nitro+AI SDK | FACT | <https://vercel.com/academy/slack-agents> | No | אותה מגבלה |
| Agent-Friendly APIs: קיים ככתובת רשמית, 3 חטיבות (Build API / Agent-Friendly Docs / Build the Skill) | FACT | <https://vercel.com/academy/agent-friendly-apis> | No | טרם נכתב קובץ סיכום ייעודי |
| Creating a Software Factory: ~5 שעות, דורש היכרות בסיסית עם Git/GitHub/CLI | FACT | <https://vercel.com/academy/creating-a-software-factory> | No | טרם נכתב קובץ סיכום ייעודי |
| Enterprise Apps and Agents: תרחיש "Vendor Review", דורש Node 24+, pnpm, חשבון GitHub+Vercel | FACT | <https://vercel.com/academy/enterprise-apps-agents> | No | טרם נכתב קובץ סיכום ייעודי |
| Vercel Sandbox: 5 חטיבות, בניית CLI agent שמריץ קוד ב-microVM מבודד | FACT | <https://vercel.com/academy/vercel-sandbox> | No | טרם נכתב קובץ סיכום ייעודי |
| Introduction to GitHub: לומדים repos/branches/commits/PRs, <1 שעה, ללא קדם | FACT | <https://github.com/skills/introduction-to-github> | **Yes** | טעינה ישירה בוצעה בשלב 1.1; `github.com` אינו חסום |
| Communicate Using Markdown: <1 שעה, קדם מומלץ Introduction to GitHub | FACT | <https://github.com/skills/communicate-using-markdown> | **Yes** | טעינה ישירה |
| Review Pull Requests: <30 דקות, קדם Introduction to GitHub | FACT | <https://github.com/skills/review-pull-requests> | **Yes** | טעינה ישירה |
| Resolve Merge Conflicts: <30 דקות, קדם Introduction to GitHub | FACT | <https://github.com/skills/resolve-merge-conflicts> | **Yes** | טעינה ישירה |
| Hello GitHub Actions: <30 דקות, קדם Introduction to GitHub | FACT | <https://github.com/skills/hello-github-actions> | **Yes** | טעינה ישירה |
| Test with Actions: <60 דקות, קדם Hello GitHub Actions | FACT | <https://github.com/skills/test-with-actions> | **Yes** | טעינה ישירה |
| Secure Repository Supply Chain: <1 שעה, ללא קדם, מכסה Dependency graph/alerts/Dependabot updates | FACT | <https://github.com/skills/secure-repository-supply-chain> | **Yes** | טעינה ישירה; מאשר במפורש כיסוי Dependabot |
| CodeQL / Code Scanning: <30 דקות, קדם Introduction to GitHub | FACT | <https://github.com/skills/introduction-to-codeql> | **Yes** | טעינה ישירה בוצעה בשלב 1.1 |
| Secret Scanning and Push Protection: <15 דקות, קדם מומלץ Introduction to GitHub | FACT | <https://github.com/skills/introduction-to-secret-scanning> | **Yes** | טעינה ישירה בוצעה בשלב 1.1 |
| Dependabot כתרגיל GitHub Skills עצמאי (לא כחלק מ-Secure Repository Supply Chain) | UNSUPPORTED | <https://docs.github.com/en/code-security/dependabot> | No | `docs.github.com` חסום ב-egress proxy; לא אותר repo נפרד תחת ארגון `skills` |
| Branch Protection כתרגיל GitHub Skills עצמאי | UNSUPPORTED | <https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches> | No | `docs.github.com` חסום; לא אותר repo תחת ארגון `skills` בחיפוש שבוצע |
| הסדר המומלץ בין קורסי Vercel/GitHub המתקדמים (LEARNING_PLAN.md) | OBSERVATION | — | לא רלוונטי | הערכה פנימית, אינה מבוססת המלצת סדר רשמית מהמקורות |
| `Trinity Gateway Labs` כפרויקט קיים/מאושר | UNSUPPORTED | — | לא רלוונטי | לא מופיע ב-PROJECT_INDEX.md או REPOSITORIES.md של המאגר |

**FACT מסכם על מגבלת הרשת עצמה:** `vercel.com` (כולל `examples.vercel.com`) וגם `docs.github.com` חסומים ב-egress proxy של סביבת העבודה הנוכחית; `github.com` (כולל `github.com/skills/*`) **אינו** חסום ונבדק בטעינה ישירה מוצלחת עבור 9 מתוך 9 קישורי GitHub Skills הרלוונטיים.
