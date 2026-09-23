#!/usr/bin/env python3
"""Precisely bump a version string in a toolchain file of any format.

Unlike bump_manifest.py (which understands pubspec.yaml's dependency-line
syntax specifically), toolchain files a single component touches span wildly
different formats -- `.fvmrc` (JSON), `android/settings.gradle` (Groovy DSL),
gradle-wrapper.properties (a version embedded in a URL). Rather than writing
a parser per format, this does a literal old-version -> new-version
substring replacement, refusing (not guessing) unless the old version string
appears on exactly one line -- optionally narrowed with --line-contains when
a file has multiple unrelated version numbers (e.g. AGP and Kotlin both live
in android/settings.gradle).

Usage:
    bump_toolchain_file.py --file <path> --old-version <v> --new-version <v>
                            [--line-contains <substring>]

Exit codes:
    0  success -- prints "OLD LINE -> NEW LINE" to stdout as evidence
    1  zero or multiple matching lines -- no edit made
    2  bad arguments / file not found
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


def eprint(*args) -> None:
    print(*args, file=sys.stderr)


def bump(file_path: Path, old_version: str, new_version: str, line_contains: str | None) -> int:
    try:
        text = file_path.read_text()
    except OSError as e:
        eprint(f"bump_toolchain_file: cannot read {file_path}: {e}")
        return 2

    lines = text.splitlines(keepends=True)
    version_re = re.compile(re.escape(old_version))

    candidates = [
        i
        for i, line in enumerate(lines)
        if version_re.search(line) and (line_contains is None or line_contains in line)
    ]

    if not candidates:
        extra = f" containing '{line_contains}'" if line_contains else ""
        eprint(
            f"bump_toolchain_file: version '{old_version}' not found on any "
            f"line{extra} in {file_path}. No edit made."
        )
        return 1
    if len(candidates) > 1:
        eprint(
            f"bump_toolchain_file: version '{old_version}' found on "
            f"{len(candidates)} lines in {file_path} -- ambiguous, refusing "
            "to guess which one. Narrow with --line-contains. No edit made."
        )
        return 1

    idx = candidates[0]
    old_line = lines[idx].rstrip("\n")
    new_line_content = version_re.sub(new_version, old_line)
    newline = "\n" if lines[idx].endswith("\n") else ""
    lines[idx] = new_line_content + newline

    file_path.write_text("".join(lines))
    print(f"{file_path}: {old_line.strip()} -> {new_line_content.strip()}")
    return 0


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--file", required=True, type=Path)
    parser.add_argument("--old-version", required=True)
    parser.add_argument("--new-version", required=True)
    parser.add_argument("--line-contains", default=None)
    args = parser.parse_args()

    if not args.file.is_file():
        eprint(f"bump_toolchain_file: file not found: {args.file}")
        sys.exit(2)

    sys.exit(bump(args.file, args.old_version, args.new_version, args.line_contains))


if __name__ == "__main__":
    main()
