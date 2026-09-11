---
paths:
  - "pubspec.yaml"
  - "**/pubspec.yaml"
  - "pubspec.lock"
  - ".fvmrc"
  - "android/settings.gradle"
  - "android/gradle/wrapper/gradle-wrapper.properties"
---

# Dependency & toolchain maintenance policy

This project's dependency and toolchain updates are managed by the
`dependency-manager` agent (`.claude/agents/dependency-manager.md`) via the
`dependency-audit`, `toolchain-audit`, `dependency-update-audit`,
`dependency-update-apply`, and `dependency-update-pr` skills. This file is the
policy those skills must honor, and the reference for anyone editing these
files by hand.

## Manifest layout

Three pub packages, each with its own `pubspec.yaml` that must be audited and
updated together: the root app (`pubspec.yaml`), `design_system/pubspec.yaml`,
and `design_system/design_system_gallery/pubspec.yaml`. `design_system` is
consumed by the root app; keep shared dependency versions in sync across all
three unless a reason is documented in the PR.

## Pin style

Dependencies are pinned to **exact versions** (e.g. `dio: 5.4.3+1`, not
`^5.4.3`), not ranges. Proposed updates must preserve this — bump the exact
pin, don't loosen it to a caret range.

## Never-auto-update list

These packages drive code generation (`build_runner`), so a version bump can
silently change generated output even when `pub outdated` calls it a minor
release. They require a human-reviewed regeneration diff before merging, and
`dependency-update-apply` must never bundle them into the `safe` tier:

- `freezed` / `freezed_annotation`
- `build_runner`
- `json_serializable` / `json_annotation`
- `auto_route` / `auto_route_generator`
- `flutter_gen_runner`

The Flutter SDK itself (`.fvmrc`) and Android build tooling (AGP, Kotlin,
Gradle wrapper in `android/settings.gradle` / `gradle-wrapper.properties`) are
handled by `toolchain-audit`, never by the package-update pipeline, and always
land as their own `review`-or-higher tier PR.

## Update cadence & security SLA

- Routine (`maintenance`/`low` urgency): reviewed at the audit's normal cadence
  (weekly, once scheduling is wired — see the agent's checkpoint protocol).
- `medium` urgency: patch within the week.
- `high` urgency: patch within 72 hours.
- `critical` urgency (actively exploited, or CVSS ≥ 9.0): patch immediately —
  the agent should raise this ahead of its normal schedule rather than batch
  it into the next audit.

## Known standing issue

`pubspec.yaml` carries a `dependency_overrides` block (`file: 7.0.0`,
`pub_updater: 0.4.0`) under the comment `## TODO remove this when
dart_code_linter updates the dependencies`. `dependency-audit` must always
surface this as an open finding (not silently ignore it) until
`dart_code_linter`'s own constraints make the override unnecessary.

## Verification gate

No dependency or toolchain change is proposed without passing
`./scripts/checks.sh` and, when generated code is affected, without a clean
`git status` after regenerating (mirroring fastlane's
`ensure_no_change_in_generated_code` lane). See
`dependency-update-audit/SKILL.md` for how this evidence is captured.
