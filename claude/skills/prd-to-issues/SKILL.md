---
name: prd-to-issues
description: Break a PRD GitHub issue into independently-grabbable GitHub issues using vertical slices (tracer bullets).
allowed-tools: Bash(gh issue create *), Bash(gh issue view *)
---

Break a PRD into independently-grabbable GitHub issues using vertical slices (tracer bullets).

## Process

### 1. Locate the PRD

Ask the user for the PRD GitHub issue number (or URL). Fetch it with `gh issue view <number>`. Read and internalize the full PRD content (with all comments).

### 2. Explore the codebase

Read key modules and integration layers referenced in the PRD. Identify:

- Distinct integration layers the feature touches (DB/schema, API/backend, UI, tests, config)
- Existing patterns for similar features
- Natural seams where work can be parallelized

### 3. Draft vertical slices

Break the PRD into **tracer bullet** issues. Each issue is a thin vertical slice cutting through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

Rules:
- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
- First slice = simplest possible end-to-end path (the "hello world" tracer bullet)
- Later slices add breadth: edge cases, additional user stories, polish

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each slice show:

- **Title**: short descriptive name
- **Layers touched**: which integration layers this slice cuts through
- **Blocked by**: which other slices (if any) must complete first
- **User stories covered**: which user stories from the PRD this addresses

Ask the user:
- Does the granularity feel right? (too coarse / too fine)
- Are the dependency relationships correct?
- Should any slices be merged or split further?
- Is the ordering right for the first tracer bullet?
- Are there any slices missing?

Iterate until the user approves.

### 5. Create the GitHub issues

Create issues in dependency order (blockers first) so you can reference real issue numbers in "Blocked by".

Use this template for each issue:

```markdown
## Parent PRD

#<prd-issue-number>

## What to build

Concise description of this vertical slice. Describe end-to-end behavior, not layer-by-layer implementation. Reference specific sections of the parent PRD rather than duplicating content.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Blocked by

- Blocked by #<issue-number> (if any)

Or "None - can start immediately" if no blockers.

## User stories addressed

Reference by number from the parent PRD:

- User story 3
- User story 7
```

After creating all issues, print a summary table:

```
| # | Title | Blocked by | Status |
|---|-------|-----------|--------|
| 42 | Basic widget creation | None | Ready |
| 43 | Widget listing | #42 | Blocked |
```

Do NOT close or modify the parent PRD issue.
