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
Battle-tested core skills for development workflows:

**Testing:**
- `test-driven-development` - TDD workflows
- `condition-based-waiting` - Smart waiting strategies
- `testing-anti-patterns` - Avoid common testing mistakes

**Debugging:**
- `systematic-debugging` - Methodical debugging approach
- `root-cause-tracing` - Find the real issue
- `verification-before-completion` - Ensure fixes work
- `defense-in-depth` - Robust error handling

**Collaboration:**
- `brainstorming` - Ideation workflows
- `writing-plans` - Planning features
- `executing-plans` - Implementation workflows
- `dispatching-parallel-agents` - Concurrent task management
- `requesting-code-review` - Request reviews
- `receiving-code-review` - Handle review feedback
- `using-git-worktrees` - Advanced git workflows
- `finishing-a-development-branch` - Complete features cleanly
- `subagent-driven-development` - Agent-based development

**Meta:**
- `writing-skills` - Create new skills
- `sharing-skills` - Distribute skills
- `testing-skills-with-subagents` - Test skills
- `using-superpowers` - Guide to using these skills

### Anthropic Official (anthropics/skills)
Official skills from Anthropic:

**Creative & Design:**
- `algorithmic-art` - Generative art with p5.js
- `canvas-design` - Visual art in PNG/PDF
- `slack-gif-creator` - Animated GIFs for Slack

**Development:**
- `artifacts-builder` - Complex HTML artifacts
- `mcp-builder` - Create MCP servers
- `webapp-testing` - Playwright testing

**Enterprise:**
- `brand-guidelines` - Anthropic brand styling
- `internal-comms` - Status reports, newsletters, FAQs
- `theme-factory` - Professional themes

**Document Processing:**
- DOCX, PDF, PPTX, XLSX manipulation with advanced features

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
