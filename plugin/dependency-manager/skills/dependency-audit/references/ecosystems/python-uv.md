# uv adapter

Worked example for a uv-managed Python project (`pyproject.toml` plus
`uv.lock`).

| Slot | Value |
|---|---|
| `detect` | `pyproject.toml` with `uv.lock` present alongside it. |
| `manifests` | `pyproject.toml`. In a uv workspace, every member package's own `pyproject.toml`. |
| `lockfile` | `uv.lock`. |
| `outdated_cmd` | `uv pip list --format json --outdated`, run against the project's uv-managed environment (`uv sync` first if the environment isn't already in sync with `uv.lock`). |
| `install_cmd` | `uv sync`. |
| `registry_api` | PyPI's JSON API: `GET https://pypi.org/pypi/<name>/json`. |
| `advisory_source` | OSV.dev, ecosystem `PyPI`. uv also has a native `uv pip audit` in newer releases — prefer OSV.dev here for consistency with `fetch_updates.py`'s existing batch-query flow, but cross-check with `uv pip audit` if available. |
| `changelog_convention` | Same as pip/Poetry: no standardized hosted changelog. Check `info.project_urls` in the PyPI JSON response. |
| `version_scheme` | PEP 440, same tolerances as `python-pip.md`. `pyproject.toml` dependency specifiers under uv follow PEP 508 (`>=`, `==`, `~=`, etc.) — preserve whichever operator is already on the line when bumping. |
| `post_update_hooks` | None by default. |
| `verification_cmd` | Check for a `uv run pytest`/documented CI test invocation before inventing one. |
| `never_auto_list` | Empty by default. A repo's own `.claude/rules/dependencies.md` is authoritative and can add entries. |

## Notes for adapter authors

- `uv pip list --outdated` operates on the resolved environment, not
  `pyproject.toml`'s declared ranges directly — run `uv sync` first so
  "current" reflects what `uv.lock` actually pins, the same caution as plain
  pip's `outdated_cmd`.
- uv is under active development; re-verify `uv pip list --format json
  --outdated`'s exact flag combination and output shape against the
  installed `uv --version` before trusting this adapter in a real repo —
  the CLI has changed flag names across releases.
