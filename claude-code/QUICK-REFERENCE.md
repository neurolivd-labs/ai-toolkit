# Claude Code Quick Reference

## Discovery Commands

Type these to explore what's available:

- **`/help`** - Shows ALL available slash commands (including plugin commands)
- **`/skills`** - Lists all available Skills
- **`/hooks`** - Shows configured hooks
- **`/plugin`** - Plugin management interface

## Superpowers Commands

From the **superpowers** plugin:

### `/brainstorm`
Interactive design refinement using Socratic method
- Asks questions one at a time to refine ideas
- Explores 2-3 approaches with trade-offs
- Presents design in small sections with validation
- Outputs design doc to `docs/plans/YYYY-MM-DD-<topic>-design.md`

**Use when:** Starting a new feature or exploring design options

---

### `/write-plan`
Create detailed implementation plan
- Breaks down complex features into steps
- Creates actionable roadmap
- Documents approach before coding

**Use when:** After design is validated, before implementation

---

### `/execute-plan`
Execute implementation plan in systematic batches
- Works through plan step-by-step
- Maintains focus on current step
- Updates plan as discoveries are made

**Use when:** Implementing a planned feature

---

## Auto-Activating Skills

These skills activate automatically based on context (no slash command needed):

### Testing & Quality
- **test-driven-development** - Enforces TDD red-green-refactor cycle
- **verification-before-completion** - Requires evidence before claiming completion
- **testing-anti-patterns** - Prevents common testing mistakes

### Debugging
- **systematic-debugging** - Four-phase framework (root cause → pattern → hypothesis → implementation)
- **root-cause-tracing** - Backward tracing for deep call stacks
- **defense-in-depth** - Multi-layer validation and error handling

### Collaboration
- **dispatching-parallel-agents** - Concurrent investigation of independent failures
- **using-git-worktrees** - Isolated workspaces per feature
- **requesting-code-review** / **receiving-code-review** - Code review patterns
- **finishing-a-development-branch** - Complete feature checklist
- **subagent-driven-development** - Break work into focused sub-tasks

### Meta
- **writing-skills** - Create new skills
- **sharing-skills** - Distribute skills
- **using-superpowers** - Guide to using the skill library

---

## Skills Powerkit Features

Auto-invokes for plugin management tasks:
- Plugin creation and validation
- Marketplace management
- Plugin auditing
- Version control

---

## Agent Context Manager Features

Automatically loads AGENTS.md files for persistent context.

**Command:** `/sync-agent-context`

---

## File Locations

- **Plugin commands:** `~/.claude/plugins/cache/*/commands/`
- **Skills:** `~/.claude/skills/` (symlinked to `~/.ai-toolkit/claude-code/skills/`)
- **Custom commands:** `~/.claude/commands/` (global) or `.claude/commands/` (project)
- **Settings:** `~/.claude/settings.json`

---

## Tips

1. **Start with `/help`** - Always your first stop for discovery
2. **Skills are invisible** - They activate automatically when relevant (no command needed)
3. **Commands are explicit** - Use `/command-name` to invoke
4. **Read the docs** - Each skill has detailed SKILL.md with examples
5. **Check `~/.ai-toolkit/claude-code/PLUGINS.md`** - Your plugin inventory

---

## Workflow Patterns

### Design → Plan → Execute
1. `/brainstorm` - Explore design options
2. `/write-plan` - Create implementation roadmap
3. `/execute-plan` - Build it systematically

### Debug Systematically
Let **systematic-debugging** skill auto-activate:
1. Root cause investigation
2. Pattern analysis
3. Hypothesis testing
4. Implementation with verification

### TDD Always
Let **test-driven-development** skill enforce:
1. Write failing test (RED)
2. Watch it fail
3. Write minimal code (GREEN)
4. Refactor
5. Repeat

---

## When Stuck

- Type `/help` to see all available commands
- Check `~/.ai-toolkit/claude-code/PLUGINS.md` for plugin info
- Read skill details: `cat ~/.claude/skills/superpowers/skills/<skill-name>/SKILL.md`
- Ask Claude: "What superpowers skills are available for [your task]?"

---

Last updated: 2025-11-07
