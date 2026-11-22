---
name: academic-renewal-calendar
description: Use for scholarship renewal reminders, academic-year periods, renewal checklists and calendar events.
---

# Academic Renewal Calendar

## Purpose
Help students avoid missing recurring scholarship renewal steps without inventing universal academic dates.

## Data needed
For each renewal event, store scheme ID/version, academic year, renewal window/date, timezone, source URL, date checked, required renewal documents, institution/course applicability and status.

## Workflow
1. Confirm that the scheme actually has a renewal process.
2. Extract the renewal period and requirements from an official source.
3. Record date precision: exact date, date window, month/season or unknown.
4. Associate the renewal with a specific academic year and applicable student cohort.
5. Create calendar/reminder records only from verified dates/windows.
6. Display the source and last-verified date beside the event.
7. If dates are missing, show "Renewal date not verified" and no fabricated reminder.
8. Allow a user to mark a task complete or snoozed without implying official renewal submission.

## Calendar states
`upcoming`, `due_soon`, `due`, `overdue`, `completed`, `date_unverified`, `not_applicable`.

## Rules
Use Asia/Kolkata for local display unless the app's configured locale requires otherwise. Do not assume every institution shares the same academic calendar. Scheme-specific dates override generic calendar assumptions.

## Acceptance
Every reminder can be traced to a scheme version and source; synthetic demo events are clearly marked as sample data.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
