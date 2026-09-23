# Poetry adapter

Worked example for a Poetry-managed Python project (`pyproject.toml` with a
`[tool.poetry]` section, plus `poetry.lock`).

| Slot | Value |
|---|---|
| `detect` | `pyproject.toml` with a `[tool.poetry]` (or, on Poetry 2.x using PEP 621 mode, a `[project]` table alongside a `poetry.lock`) section, and `poetry.lock` present. |
| `manifests` | `pyproject.toml`. In a Poetry monorepo/workspace, every member package's own `pyproject.toml`. |
| `lockfile` | `poetry.lock`. |
| `outdated_cmd` | `poetry show --outdated --format json` (requires a modern Poetry — this flag combination needs a recent 2.x release; check `poetry --version` first, since older Poetry only supports the text table). |
| `install_cmd` | `poetry install`. |
| `registry_api` | PyPI's JSON API: `GET https://pypi.org/pypi/<name>/json`. |
| `advisory_source` | OSV.dev, ecosystem `PyPI`. |
| `changelog_convention` | Same as pip: no standardized hosted changelog. Check `info.project_urls` in the PyPI JSON response for a `Changelog`/`Repository` key, then look for `CHANGELOG.md`/GitHub Releases at that repo. |
| `version_scheme` | PEP 440, same tolerances as `python-pip.md` (pre-release/dev suffixes, local version identifiers). Poetry also allows caret (`^`) and tilde (`~`) constraint operators in `pyproject.toml`, analogous to npm's — preserve whichever operator (or none) is already on the line when bumping, same discipline as `bump_manifest.py`'s `--pin-style preserve` for pub. |
| `post_update_hooks` | None by default. If the project generates anything from its dependency set (rare for pure-Python), note it in this repo's own copy of this adapter. |
| `verification_cmd` | Check for a `poetry run pytest`/`tox`/`nox` invocation this repo's CI actually uses (look at `.github/workflows/` or equivalent) before inventing one; many Poetry projects also run `poetry check` to validate `pyproject.toml`/lockfile consistency after a manifest edit — include that as part of verification if the repo's CI does. |
| `never_auto_list` | Empty by default. A repo's own `.claude/rules/dependencies.md` is authoritative and can add entries. |

## Notes for adapter authors

- `poetry show --outdated --format json`'s exact JSON shape has changed
  across Poetry releases (the `--format json` flag itself is a relatively
  recent addition) — confirm the installed Poetry version's actual output
  shape against this adapter before trusting `fetch_updates.py`'s parsing of
  it, and update this note with the confirmed version once verified in a
  real repo.
- `pyproject.toml` can carry dependency groups beyond the default (`[tool.poetry.group.dev.dependencies]`, etc.) — `manifests`/the audit must cover all groups the repo actually installs, not just the main dependency list.
