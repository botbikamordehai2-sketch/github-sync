# Course Index — Learning Hub

**עדכון אחרון:** 17.09.2026
**מקרא סטטוס:**

- `NOT_STARTED` — נוסף לאינדקס בלבד, טרם נכתב סיכום.
- `DRAFTED` — נכתב סיכום מקורי (FACT/OBSERVATION/UNSUPPORTED) בקובץ ייעודי, מבוסס מקורות רשמיים; הקורס בפועל טרם בוצע ולא אומת שיעור-אחר-שיעור.
- `VERIFIED` — סיכום אומת מול המקור הרשמי במלואו (טרם קיים סטטוס כזה בתיקייה זו).
- `COMPLETED` — הקורס בוצע בפועל.

---

## GitHub Skills

| קורס | סטטוס | מקור רשמי |
|---|---|---|
| Introduction to GitHub | NOT_STARTED | <https://github.com/skills/introduction-to-github> |
| Communicate Using Markdown | NOT_STARTED | <https://github.com/skills/communicate-using-markdown> |
| Review Pull Requests | NOT_STARTED | <https://github.com/skills/review-pull-requests> |
| Resolve Merge Conflicts | NOT_STARTED | <https://github.com/skills/resolve-merge-conflicts> |
| Hello GitHub Actions | NOT_STARTED | <https://github.com/skills/hello-github-actions> |
| Test with Actions | NOT_STARTED | <https://github.com/skills/test-with-actions> |
| Secure Repository Supply Chain | NOT_STARTED | <https://github.com/skills/secure-repository-supply-chain> |

כל שבעת הקישורים לעיל אומתו (FACT) — לא רק באמצעות חיפוש, אלא בטעינה ישירה (WebFetch) של כל README בפועל (בוצע בשלב 1.1; `github.com` אינו חסום ברשת הסביבה, בניגוד ל-`vercel.com`). משכי הזמן שאומתו ישירות: Introduction to GitHub <1h, Communicate Using Markdown <1h, Review Pull Requests <30min, Resolve Merge Conflicts <30min, Hello GitHub Actions <30min, Test with Actions <60min, Secure Repository Supply Chain <1h. עדיין לא נכתב עבורם קובץ סיכום ב-`github/`.

## GitHub — משאבי אבטחה נוספים (Resources / Courses)

| פריט | סוג | סטטוס | מקור רשמי |
|---|---|---|---|
| CodeQL / Code Scanning | **COURSE** (GitHub Skills רשמי, אומת) | NOT_STARTED | <https://github.com/skills/introduction-to-codeql> |
| Secret Scanning and Push Protection | **COURSE** (GitHub Skills רשמי, אומת) | NOT_STARTED | <https://github.com/skills/introduction-to-secret-scanning> |
| Dependabot | **RESOURCE** (לא אומת כ-GitHub Skills עצמאי) | NOT_STARTED | <https://docs.github.com/en/code-security/dependabot> |
| Branch Protection | **RESOURCE** (לא אומת כ-GitHub Skills עצמאי) | NOT_STARTED | <https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches> |

**FACT (טעינה ישירה, WebFetch):** "CodeQL / Code Scanning" ו-"Secret Scanning and Push Protection" אומתו כתרגילי GitHub Skills רשמיים תחת ארגון `github.com/skills`. CodeQL: <30 דקות, דורש קדם "Introduction to GitHub". Secret Scanning: <15 דקות, ממליץ על אותו קדם. לכן סומנו כ-**COURSE** לפי ההנחיה "לסמן כ-RESOURCE אלא אם אומת כ-GitHub Skills רשמי".
**FACT (טעינה ישירה, WebFetch):** README של [Secure Repository Supply Chain](https://github.com/skills/secure-repository-supply-chain) מאשר במפורש שהתרגיל כבר מכסה "Dependency alerts", "enable Dependabot security and version updates" ו-PRs לתיקון תלויות. "Dependabot" בפני עצמו נמצא רק תחת ארגון legacy נפרד (`githubtraining/exercise-configure-dependabot`), לא ארגון `skills` הנוכחי — לכן סומן **RESOURCE** ולא קורס עצמאי, עם קישור לתיעוד הרשמי `docs.github.com` (שאותו לא הצלחנו לטעון ישירות — `docs.github.com` חסום באותו egress proxy כמו `vercel.com`).
**FACT:** "Branch Protection" לא אותר כתרגיל תחת ארגון `github.com/skills` בחיפוש שבוצע. סומן **RESOURCE** עם קישור לתיעוד הרשמי `docs.github.com`.
**UNSUPPORTED:** ייתכן שקיים תרגיל `skills/*` ל-Branch Protection או ל-Dependabot שלא עלה בחיפוש — לא בוצעה גישה ישירה לרשימת המאגרים המלאה של ארגון `github.com/skills`.

## Vercel Academy

| קורס | סטטוס | מקור רשמי | קובץ סיכום |
|---|---|---|---|
| Vercel Foundations | DRAFTED | <https://vercel.com/academy/vercel-foundations> | [vercel/vercel-foundations.md](./vercel/vercel-foundations.md) |
| Next.js Foundations | NOT_STARTED | <https://vercel.com/academy/nextjs-foundations> | — |
| Optimize Your Vercel Account | DRAFTED | <https://vercel.com/academy/optimize-your-vercel-account> | [vercel/optimize-your-vercel-account.md](./vercel/optimize-your-vercel-account.md) |
| Slack Agents on Vercel with the AI SDK | DRAFTED | <https://vercel.com/academy/slack-agents> | [vercel/slack-agents-on-vercel-ai-sdk.md](./vercel/slack-agents-on-vercel-ai-sdk.md) |
| Builders Guide to the AI SDK | NOT_STARTED | <https://vercel.com/academy/ai-sdk> | — |
| Using AI Gateway in Production | NOT_STARTED | <https://vercel.com/academy/ai-gateway> | — |
| Workflow Foundations | DRAFTED | <https://vercel.com/academy/workflow-foundations> | [vercel/workflow-foundations.md](./vercel/workflow-foundations.md) |
| Agent-Friendly APIs | NOT_STARTED | <https://vercel.com/academy/agent-friendly-apis> | — |
| Creating a Software Factory | NOT_STARTED | <https://vercel.com/academy/creating-a-software-factory> | — |
| Enterprise Apps and Agents | NOT_STARTED | <https://vercel.com/academy/enterprise-apps-agents> | — |
| Vercel Sandbox | NOT_STARTED | <https://vercel.com/academy/vercel-sandbox> | — |

**FACT:** ארבעת הקישורים הנוספים (Agent-Friendly APIs, Creating a Software Factory, Enterprise Apps and Agents, Vercel Sandbox) אותרו באמצעות חיפוש ישיר וכותרתם תואמת את שם הקורס המבוקש.

## הערות (FACT/OBSERVATION)

- **FACT:** שבעת הקישורים הראשונים בטבלת Vercel Academy אותרו באמצעות חיפוש ישיר וכותרתם תואמת את שם הקורס המבוקש. ארבעת הקישורים הנוספים מתועדים בנפרד לעיל.
- **OBSERVATION:** ייתכן שקיימים קורסים נוספים תחת `vercel.com/academy` שלא נכללו כאן — האינדקס הזה מוגבל לפריטים שהוגדרו במפורש בבקשות העבודה עד כה: 7 קורסי GitHub Skills + 4 משאבי אבטחה נוספים (2 קורסים מאומתים + 2 resources) + 11 קורסי Vercel Academy.
- **UNSUPPORTED:** תוכן מפורט (רשימת שיעורים, משכי זמן מדויקים) עבור הקורסים במצב `DRAFTED` לא אומת במלואו מול הדף המקורי, עקב חסימת WebFetch ל-`vercel.com` בסביבת העבודה הנוכחית. פירוט מלא בכל קובץ סיכום בנפרד.
