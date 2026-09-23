# pip adapter

Worked example for a plain pip-managed Python project (`requirements.txt`,
no Poetry/uv-managed lockfile). If the target repo uses Poetry or uv
instead, use `python-poetry.md` or `python-uv.md` — pick the adapter that
matches the lockfile actually present, don't assume pip just because the
ecosystem is Python.

| Slot | Value |
|---|---|
| `detect` | `requirements.txt` present, with no `poetry.lock` or `uv.lock` alongside it (those indicate `python-poetry`/`python-uv` instead). A repo may also pin via `requirements/*.txt` (split dev/prod files) — treat each as its own manifest. |
| `manifests` | Every `requirements*.txt` file the repo actually installs from — check for a `requirements-dev.txt`/`requirements/dev.txt` split before assuming there's only one. |
| `lockfile` | None in the general case — a bare `requirements.txt` with unpinned or range-pinned entries has no separate lockfile; if the repo instead pins every transitive dependency with `==` (a "compiled" requirements file, e.g. via `pip-compile`), treat that file itself as the lockfile. |
| `outdated_cmd` | `pip list --outdated --format=json`, run inside the project's virtualenv/environment — must run against the environment actually installed from this manifest, not the system Python, or the "current" versions will be wrong. |
| `install_cmd` | `pip install -r <requirements-file>`. |
| `registry_api` | PyPI's JSON API: `GET https://pypi.org/pypi/<name>/json` — returns `info` (latest metadata) and `releases` (full version → file list, each carrying a `yanked`/`yanked_reason` field). |
| `advisory_source` | OSV.dev, ecosystem `PyPI`. |
| `changelog_convention` | Not standardized for PyPI packages — there is no per-package hosted changelog URL the way pub.dev/npm provide one. Check the PyPI JSON API's `info.project_urls` for a `Changelog`/`Release Notes`/`Repository` key first; if only a repo URL is available, look for `CHANGELOG.md`/`HISTORY.rst` at that repo's root, or fall back to its GitHub Releases page. |
| `version_scheme` | PEP 440. Mostly semver-compatible, but tolerate pre-release/dev suffixes (`1.2.0rc1`, `1.2.0.dev0`) and local version identifiers (`1.2.0+cpu`) that don't appear in plain semver. |
| `post_update_hooks` | None by default — plain pip has no codegen step. If the project vendors a compiled/locked requirements file (via `pip-compile` or similar), regenerating it after a manifest edit is the equivalent hook; note that explicitly in this repo's own copy of this adapter if so. |
| `verification_cmd` | Whatever this repo's own test/lint entrypoint is (check for a `Makefile`, `tox.ini`, `noxfile.py`, or a documented `pytest`/`ruff`/`mypy` invocation in its README/CI config before inventing one) — prefer that over a hand-rolled `pytest` call. |
| `never_auto_list` | Empty by default for plain pip — there's no pip-ecosystem equivalent to codegen-driving packages like `freezed`/`build_runner`. A repo's own `.claude/rules/dependencies.md` is still authoritative and can add entries (e.g. anything a `pip-compile` step depends on). |

## Notes for adapter authors

- Unlike pub/npm, pip has no first-class lockfile for a bare
  `requirements.txt` project — `current` in `outdated_cmd`'s output reflects
  what's actually installed in the environment, which is only trustworthy if
  that environment was built from this exact manifest. If in doubt, rebuild
  the environment from the manifest before running `outdated_cmd`.
- A repo with a `pyproject.toml` but no `poetry.lock`/`uv.lock` and no
  `[tool.poetry]`/`[tool.uv]` section (e.g. plain `setuptools`/`hatch` with
  PEP 621 `[project.dependencies]`) is still closer to this adapter than to
  the Poetry/uv ones — the dependency list just lives in `pyproject.toml`
  instead of `requirements.txt`; adjust `manifests`/`manifest_version_pattern`
  accordingly when filling this in for a real repo.
