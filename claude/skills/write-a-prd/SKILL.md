---
name: write-a-prd
description: Collaboratively write a Product Requirements Document through problem exploration, user interviews, and module design. Outputs a PRD as a GitHub issue.
allowed-tools: Bash(gh issue create *)
---

Guide the user through creating a PRD. Skip steps if unnecessary.

## Process

### 1. Gather the problem

Ask the user for a long, detailed description of the problem they want to solve and any potential ideas for solutions.

### 2. Explore the repo

Verify their assertions and understand the current state of the codebase.

### 3. Interview relentlessly

Interview the user about every aspect of this plan until you reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one.

### 4. Sketch modules

Sketch the major modules to build or modify. Actively look for opportunities to extract **deep modules** that can be tested in isolation.

A deep module (as opposed to a shallow module) encapsulates a lot of functionality in a simple, testable interface which rarely changes.

Check with the user that these modules match their expectations. Check which modules they want tests written for.

### 5. Write the PRD

Once you have a complete understanding, write the PRD and submit it as a GitHub issue using the template below.

## PRD Template

```markdown
## Problem Statement

The problem from the user's perspective.

## Solution

The solution from the user's perspective.

## User Stories

A LONG, numbered list. Each story:

1. As an <actor>, I want a <feature>, so that <benefit>

Example:
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending

Cover ALL aspects of the feature extensively.

## Implementation Decisions

- Modules to build/modify
- Module interfaces to modify
- Technical clarifications
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets (they become outdated quickly).

## Testing Decisions

- What makes a good test (test external behavior, not implementation details)
- Which modules will be tested
- Prior art for tests (similar tests in the codebase)

## Out of Scope

Things explicitly excluded from this PRD.

## Further Notes

Any additional context.
```
