# Installed Claude Code Plugins

This file tracks all installed Claude Code plugins for the neurolivd-labs AI toolkit.

## Active Plugins

### Superpowers (obra/superpowers)
**Marketplace:** `superpowers-marketplace`
**Installation:** `claude plugin install superpowers@superpowers-marketplace`

**Description:** Core skills library with battle-tested development patterns including TDD, debugging, and collaboration workflows.

**Features:**
- `/superpowers:brainstorm` - Interactive design refinement through collaborative questioning
- `/superpowers:write-plan` - Create detailed implementation plans
- `/superpowers:execute-plan` - Execute plans in systematic batches
- Auto-activating skills: test-driven-development, systematic-debugging, verification-before-completion, and more

**Why installed:** Foundation plugin that wraps proven engineering practices and workflows

---

### Skills Powerkit (jeremylongshore)
**Marketplace:** `claude-code-plugins-plus`
**Installation:** `claude plugin install skills-powerkit@claude-code-plugins-plus`

**Description:** First Agent Skills plugin enabling automated plugin management and skill creation.

**Features:**
- Plugin creator and validator
- Marketplace manager
- Plugin auditor
- Version control capabilities
- Auto-invokes based on context

**Why installed:** Essential for managing and creating custom plugins/skills efficiently

---

### Agent Context Manager (jeremylongshore)
**Marketplace:** `claude-code-plugins-plus`
**Installation:** `claude plugin install agent-context-manager@claude-code-plugins-plus`

**Description:** Automatically detects and loads AGENTS.md files for improved agent context persistence.

**Features:**
- Three-layer redundancy for agent context
- Automatic AGENTS.md detection alongside CLAUDE.md
- `/sync-agent-context` command
- Persistent context across sessions

**Why installed:** Better context management for complex, multi-session development work

---

## Installed Marketplaces

1. **superpowers-marketplace** (`obra/superpowers-marketplace`)
   - Official superpowers plugins and extensions
   - Add with: `claude plugin marketplace add obra/superpowers-marketplace`

2. **claude-code-plugins-plus** (`jeremylongshore/claude-code-plugins-plus`)
   - 227+ community plugins across 14 categories
   - Includes Skills Powerkit, Agent Context Manager, and specialized packs
   - Add with: `claude plugin marketplace add jeremylongshore/claude-code-plugins-plus`

## Plugin Management Commands

```bash
# List marketplaces
claude plugin marketplace list

# Install a plugin
claude plugin install <plugin-name>@<marketplace-name>

# Disable a plugin (without uninstalling)
claude plugin disable <plugin-name>@<marketplace-name>

# Enable a disabled plugin
claude plugin enable <plugin-name>@<marketplace-name>

# Uninstall a plugin
claude plugin uninstall <plugin-name>@<marketplace-name>
```

## Recommended Plugins to Consider

Based on use case, consider adding:

**For AI/ML Work:**
- `ai-ml-engineering-pack` - Prompt optimization, LLM integration, RAG architectures

**For DevOps:**
- `devops-automation-pack` - Git workflows, CI/CD, Docker, Kubernetes templates

**For Security:**
- `security-pro-pack` - OWASP auditing, compliance checklists, threat modeling

**For API Development:**
- `conversational-api-debugger` - Debug REST APIs using OpenAPI specs

**For Full-Stack:**
- `fullstack-starter-pack` - React patterns, API scaffolding, database schemas

## Last Updated

2025-11-07 - Initial plugin setup with superpowers, skills-powerkit, and agent-context-manager
