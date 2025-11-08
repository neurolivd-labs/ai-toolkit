# AI Toolkit

A centralized repository for managing configurations and resources across all AI tools (Claude Code, Cursor, Copilot, and more).

## Overview

This repository uses **git submodules** to manage Claude Code skills from upstream repositories while maintaining easy update paths. Everything is organized by AI tool for clear separation and easy navigation.

## Repository Structure

```
ai-toolkit/
├── claude-code/
│   ├── skills/
│   │   ├── superpowers/          # Core skills library (obra/superpowers)
│   │   ├── anthropic-official/   # Official Anthropic skills
│   │   └── custom/               # Your custom skills
│   ├── commands/                 # Slash commands
│   └── hooks/                    # Event hooks
├── cursor-config/                # Cursor IDE configurations
├── copilot-config/              # GitHub Copilot extensions
├── ai-prompts/
│   └── shared/                   # Prompts usable across tools
├── sync-updates.sh              # Script to update all submodules
└── README.md
```

## Quick Start

### 1. Clone this repository

```bash
git clone https://github.com/neurolivd-labs/ai-toolkit.git ~/.ai-toolkit
cd ~/.ai-toolkit
```

### 2. Initialize submodules

```bash
git submodule update --init --recursive
```

### 3. Link to Claude Code

```bash
ln -s ~/.ai-toolkit/claude-code/skills ~/.claude/skills
```

### 4. Restart Claude Code

The skills will be automatically loaded on next launch.

## Usage

### Updating Skills

To pull the latest updates from all skill repositories:

```bash
./sync-updates.sh
```

Or manually:

```bash
git submodule update --remote --merge
```

### Adding New Skills

#### From a Repository (as submodule)

```bash
git submodule add <repository-url> claude-code/skills/<skill-name>
git commit -m "Add <skill-name> skill"
git push
```

#### Creating Custom Skills

1. Create a new directory in `claude-code/skills/custom/`:
   ```bash
   mkdir -p claude-code/skills/custom/my-skill
   ```

2. Create a `SKILL.md` file with YAML frontmatter:
   ```markdown
   ---
   name: my-skill
   description: What this skill does and when Claude should use it
   ---

   # Skill instructions here
   ```

3. Commit and push:
   ```bash
   git add claude-code/skills/custom/my-skill
   git commit -m "Add my-skill"
   git push
   ```

## Included Skills

### Superpowers (obra/superpowers)
Battle-tested core skills for professional development workflows. These enforce rigorous engineering practices to prevent common pitfalls.

#### Testing Skills

**`test-driven-development`**
- **What it does:** Enforces strict TDD red-green-refactor cycle - write failing test first, watch it fail, then write minimal code to pass
- **Core principle:** NO production code without a failing test first. If you didn't watch the test fail, you don't know it tests the right thing
- **When to use:** Always - for any feature, bugfix, or refactoring. Violations of "just this once" lead to unverified code
- **Why it matters:** Tests-after verify "what does this do?"; tests-first answer "what should this do?" - prevents implementation bias

**`condition-based-waiting`**
- **What it does:** Replace arbitrary timeouts with event-based waiting strategies that check actual conditions
- **When to use:** Async operations, UI testing, network requests - anywhere you're tempted to add `sleep(1000)`
- **Why it matters:** Arbitrary timeouts are either too short (flaky tests) or too long (slow tests). Condition-based waiting is both reliable and fast

**`testing-anti-patterns`**
- **What it does:** Identifies and prevents common testing mistakes that reduce test value
- **Covers:** Mocking over-use, testing implementation vs behavior, brittle selectors, god tests
- **Why it matters:** Bad tests give false confidence and break on valid refactoring

#### Debugging Skills

**`systematic-debugging`**
- **What it does:** Four-phase framework (root cause investigation → pattern analysis → hypothesis testing → implementation) that ensures understanding before attempting fixes
- **Core principle:** NO fixes without root cause investigation first. Random fixes waste time and create new bugs
- **When to use:** ANY bug, test failure, unexpected behavior, build error - especially when under pressure or "quick fix" seems obvious
- **Process:** Read errors carefully, reproduce consistently, gather evidence at component boundaries, trace data flow, then fix root cause not symptom
- **Why it matters:** Systematic approach = 15-30 min to fix; random fixes = 2-3 hours thrashing. First-time fix rate: 95% vs 40%

**`root-cause-tracing`**
- **What it does:** Backward tracing technique to find where bad values originate in deep call stacks
- **How it works:** Start at error point, trace upward through callers until finding the source, fix at source not symptom
- **Integration:** Required sub-skill for systematic-debugging Phase 1 Step 5

**`verification-before-completion`**
- **What it does:** Gate function that requires running verification commands and seeing evidence before making ANY completion claims
- **Core principle:** Evidence before claims, always. No completion claims without fresh verification evidence
- **When to use:** Before ANY success/completion claim, commit, PR, or task completion
- **Why it matters:** Prevents shipping broken code, builds trust. "I don't believe you" = trust broken
- **The gate:** Identify verification command → Run it → Read full output → Verify result → Only then claim status

**`defense-in-depth`**
- **What it does:** Adds validation and error handling at multiple system layers to prevent cascading failures
- **When to use:** After finding root cause, implement safeguards so similar issues can't occur elsewhere
- **Complements:** systematic-debugging - use after fixing to prevent recurrence

#### Collaboration Skills

**`brainstorming`**
- **What it does:** Refines rough ideas into fully-formed designs through collaborative questioning, alternative exploration, and incremental validation
- **Process:** Understand project context → Ask questions one at a time → Explore 2-3 approaches with trade-offs → Present design in 200-300 word sections, validating each
- **When to use:** Before writing code or implementation plans - when creating or developing ideas
- **Don't use:** During clear "mechanical" implementation processes
- **Outputs:** Design document in `docs/plans/YYYY-MM-DD-<topic>-design.md`

**`writing-plans`**
- **What it does:** Creates detailed, actionable implementation plans that break down complex features into manageable steps
- **When to use:** After design is validated, before starting implementation
- **Works with:** brainstorming (for design) → writing-plans (for implementation roadmap) → executing-plans (for doing the work)

**`executing-plans`**
- **What it does:** Systematic approach to implementing planned features, maintaining focus and tracking progress
- **When to use:** During implementation phase after plan is written
- **Ensures:** Each step completed before moving to next, plan updated as discoveries made

**`dispatching-parallel-agents`**
- **What it does:** Dispatches multiple Claude agents to investigate and fix independent problems concurrently
- **When to use:** 3+ independent failures that can be fixed without shared state (different test files, different subsystems)
- **Process:** Identify independent domains → Create focused agent tasks → Dispatch in parallel → Review and integrate
- **Don't use when:** Failures are related, need full system context, or agents would interfere
- **Real impact:** From debugging session: 6 failures across 3 files, 3 agents in parallel, zero conflicts, massive time savings

**`requesting-code-review`** & **`receiving-code-review`**
- **What they do:** Patterns for effective code review collaboration
- **Requesting:** How to prepare PRs, write descriptions, highlight decision points
- **Receiving:** How to process feedback, ask clarifying questions, incorporate changes

**`using-git-worktrees`**
- **What it does:** Advanced git workflow using worktrees for isolated workspaces per feature/bugfix
- **Benefits:** Work on multiple branches simultaneously without stashing, clean separation, easy context switching

**`finishing-a-development-branch`**
- **What it does:** Complete checklist for properly finishing features - tests pass, docs updated, clean commits, ready to merge
- **Prevents:** Premature "done" claims, forgotten cleanup, incomplete features

**`subagent-driven-development`**
- **What it does:** Pattern for breaking work into focused sub-tasks handled by specialized agents
- **When to use:** Large features that can be divided into independent components

#### Meta Skills

**`writing-skills`**
- **What it does:** Guide for creating new effective skills - structure, YAML frontmatter, clear triggers, focused scope
- **When to use:** Creating custom skills for your workflow

**`sharing-skills`**
- **What it does:** Best practices for distributing skills across teams via git, plugins, or repositories
- **Covers:** Documentation, versioning, team adoption

**`testing-skills-with-subagents`**
- **What it does:** Framework for validating that skills work as intended using subagents
- **Ensures:** Skills trigger correctly, provide value, don't conflict

**`using-superpowers`**
- **What it does:** Meta-guide to understanding and effectively leveraging the entire superpowers skill library
- **Start here:** If new to superpowers, read this first

### Anthropic Official (anthropics/skills)
Official skills from Anthropic covering creative tools, development utilities, and enterprise workflows.

#### Creative & Design Skills

**`algorithmic-art`**
- **What it does:** Creates generative art using p5.js with seeded randomness, flow fields, and particle systems
- **Outputs:** Interactive canvas artwork with controllable parameters
- **Use cases:** Data visualization, creative coding, procedural graphics

**`canvas-design`**
- **What it does:** Visual art generation in PNG and PDF formats
- **Features:** Custom dimensions, color palettes, composition tools
- **Use cases:** Diagrams, illustrations, design mockups

**`slack-gif-creator`**
- **What it does:** Animated GIF creation optimized for Slack's size/format requirements
- **Features:** Frame control, timing, compression optimization
- **Use cases:** Team communication, visual explanations, reaction GIFs

#### Development Skills

**`artifacts-builder`**
- **What it does:** Complex HTML artifact creation using React and Tailwind CSS
- **Features:** Interactive components, modern styling, self-contained artifacts
- **Use cases:** Prototypes, demos, interactive documentation

**`mcp-builder`**
- **What it does:** Comprehensive guide for creating high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services
- **Process:** Deep research & planning → Implementation → Review & refine → Create evaluations
- **Covers:** Agent-centric design, tool optimization for limited context, input validation (Pydantic/Zod), error handling, pagination, evaluation creation
- **Supports:** Python (FastMCP) and Node/TypeScript implementations
- **Why it matters:** Quality MCP servers enable LLMs to accomplish real-world tasks through well-designed external tool access

**`webapp-testing`**
- **What it does:** Toolkit for testing local web applications using Playwright - verify frontend functionality, debug UI behavior, capture screenshots
- **Features:** Server lifecycle management, reconnaissance-then-action pattern, DOM inspection, screenshot capture
- **Supports:** Static HTML and dynamic webapps with multiple servers
- **Key pattern:** Navigate → wait for networkidle → inspect → identify selectors → execute actions
- **Helper scripts:** `with_server.py` manages single or multiple servers automatically

#### Enterprise & Communication Skills

**`brand-guidelines`**
- **What it does:** Applies Anthropic's official brand styling guidelines to documents and communications
- **Covers:** Colors, typography, voice, formatting standards
- **Use cases:** Official communications, presentations, marketing materials

**`internal-comms`**
- **What it does:** Templates and best practices for status reports, newsletters, FAQs, and team documentation
- **Features:** Structured formats, clarity guidelines, distribution patterns
- **Use cases:** Team updates, project documentation, knowledge sharing

**`theme-factory`**
- **What it does:** Professional theme generation for presentations, documents, and visual materials
- **Features:** 10 pre-set themes plus custom theme builder
- **Use cases:** Presentations, reports, consistent visual identity

#### Document Processing Skills

**`document-skills`**
- **What it does:** Advanced manipulation of DOCX, PDF, PPTX, and XLSX files
- **Features:**
  - **DOCX:** Tracked changes, comments, styles, tables
  - **PDF:** Form handling, text extraction, annotations
  - **PPTX:** Slide creation, layouts, charts
  - **XLSX:** Data analysis, formulas, charts, formatting
- **Use cases:** Report generation, data processing, document automation, business intelligence

## Syncing Across Machines

To use this setup on multiple machines:

1. Clone the repository
2. Initialize submodules
3. Create the symlink to `~/.claude/skills`
4. You're done!

All your AI configurations sync via git.

## Adding Other AI Tools

### Cursor

Place Cursor configurations in `cursor-config/`:
```bash
cp ~/.cursor/config.json cursor-config/
```

### Copilot

Place Copilot extensions and configs in `copilot-config/`:
```bash
cp -r ~/.github/copilot copilot-config/
```

### Shared Prompts

Store reusable prompts in `ai-prompts/shared/` for use across all AI tools.

## Best Practices

1. **Keep submodules updated** - Run `./sync-updates.sh` weekly
2. **Document custom skills** - Add clear descriptions to SKILL.md files
3. **Test before committing** - Verify skills work before pushing
4. **Use version control** - Commit changes regularly
5. **Separate concerns** - Keep tool configs in their respective directories

## Troubleshooting

### Skills not loading in Claude Code

1. Verify symlink exists:
   ```bash
   ls -la ~/.claude/skills
   ```

2. Should show:
   ```
   ~/.claude/skills -> /Users/yourusername/.ai-toolkit/claude-code/skills
   ```

3. If not, recreate it:
   ```bash
   ln -s ~/.ai-toolkit/claude-code/skills ~/.claude/skills
   ```

4. Restart Claude Code

### Submodule update fails

```bash
git submodule foreach 'git reset --hard'
git submodule update --remote --merge
```

## Resources

- [Claude Code Documentation](https://code.claude.com/docs)
- [obra/superpowers](https://github.com/obra/superpowers)
- [anthropics/skills](https://github.com/anthropics/skills)
- [Awesome Claude Skills](https://github.com/travisvn/awesome-claude-skills)

## License

This repository configuration is provided as-is. Individual skills maintain their original licenses.
