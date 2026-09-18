# Worked example

A real `dependency-audit` run against this repo's root `pubspec.yaml`
(captured during development — exact versions will drift over time, the
*shape* of the output is what matters here). Two outdated direct
dependencies were found; `design_system` and
`design_system/design_system_gallery` had none this run.

## `candidates.json` (written to the scratchpad)

```json
[
  {
    "ecosystem": "dart-flutter",
    "kind": "package",
    "package": "flutter_secure_storage",
    "manifest": "pubspec.yaml",
    "current": "10.3.1",
    "current_source": "lockfile",
    "upgradable": "10.3.4",
    "latest_compatible": "11.1.1",
    "latest": "11.1.1",
    "bump": "major",
    "urgency": "maintenance",
    "advisories": [],
    "risk": "medium",
    "changelog_url": "https://pub.dev/packages/flutter_secure_storage/changelog",
    "breaking_changes": [
      "11.0.0: items deprecated in v10 were removed; data saved with a deprecated algorithm/feature becomes unusable unless the app was already upgraded through v10 to migrate it.",
      "Android: removed KeyCipherAlgorithm.RSA_ECB_PKCS1Padding -- must pass through v10 first so data migrates to RSA_ECB_OAEPwithSHA_256andMGF1Padding.",
      "Android: removed StorageCipherAlgorithm.AES_CBC_PKCS7Padding -- must pass through v10 first so data migrates to AES_GCM_NoPadding.",
      "Android: removed the encryptedSharedPreferences parameter from AndroidOptions/AndroidOptions.biometric.",
      "Android: removed sharedPreferencesName from AndroidOptions -- use storageNamespace instead.",
      "Android: raised minSdk to 24 and compileSdk to 37."
    ],
    "affected_call_sites": [],
    "verdict": null,
    "evidence": null,
    "tier": "review"
  },
  {
    "ecosystem": "dart-flutter",
    "kind": "package",
    "package": "sqflite",
    "manifest": "pubspec.yaml",
    "current": "2.4.3",
    "current_source": "lockfile",
    "upgradable": null,
    "latest_compatible": "2.4.4",
    "latest": "2.4.4",
    "bump": "patch",
    "urgency": "maintenance",
    "advisories": [],
    "risk": "none",
    "changelog_url": "https://pub.dev/packages/sqflite/changelog",
    "breaking_changes": [],
    "affected_call_sites": [],
    "verdict": null,
    "evidence": null,
    "tier": "safe"
  }
]
```

## The printed human-readable summary (SKILL.md step 6)

> ## Dependency audit — root `pubspec.yaml`
>
> ### tier: safe
> | package | current → target | urgency | risk | verdict |
> |---|---|---|---|---|
> | sqflite | 2.4.3 → 2.4.4 | maintenance | none | null (not yet audited) |
>
> Patch only; changelog is docs/tooling, no code-facing change.
>
> ### tier: review
> | package | current → target | urgency | risk | verdict |
> |---|---|---|---|---|
> | flutter_secure_storage | 10.3.1 → 11.1.1 | maintenance | medium | null (not yet audited) |
>
> **10.3.4 is available with no manifest edit at all.** 11.1.1 is available
> if you're willing to take the breaking changes below — going from v10 to
> v11 removes several deprecated Android cipher/options APIs, and the
> changelog explicitly warns that skipping v10 on the way to v11 can make
> previously-saved secure-storage data unreadable.
>
> ### tier: breaking
> None found this run.
>
> ### Standing findings
> - **Never-auto-update-list packages with an available update:** none this
>   run (checked `freezed`/`build_runner`/`json_serializable`/`auto_route`
>   family + `flutter_gen_runner` against the outdated set for all three
>   manifests).
> - **`dependency_overrides` TODO** (`.claude/rules/dependencies.md`): not
>   present in the current `pubspec.yaml` — flagged as a discrepancy against
>   the documented policy rather than silently dropped; likely needs a
>   `dependency-doc-sync` pass to retire the note if it's genuinely resolved.
>
> ### Waiting on
> Both candidates are graded but unaudited (`verdict: null`). Next step is
> `dependency-update-audit` against these two, then a tier-by-tier human
> go-ahead before anything is applied or a PR opens.

Note how `upgradable` only appears (and gets called out in prose) for
`flutter_secure_storage`, where it adds real information — `sqflite` omits
it entirely since `upgradable` would just equal `latest_compatible`.
