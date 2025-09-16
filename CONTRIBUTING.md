# Contributing to Balatro Multiplayer

Thank you for your interest in contributing to Balatro Multiplayer! We're building the definitive multiplayer experience for Balatro. Ready to make poker roguelikes even more unhinged? You've found the right repo.

This little guide will help ensure consistency and quality across the codebase. Follow it and your PRs will merge. Ignore it and maintainers will reject your PR with the enthusiasm of a Neptune card.

Let's build something that would make Jimbo proud.

## Quick Start

**Prerequisites**: Install [Steamodded 1.0.0~BETA-0711a](https://github.com/Steamodded/smods/releases/tag/1.0.0-beta-0711a) and [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector) (>=0.8)

```bash
# 1. Fork on GitHub, then clone
git clone https://github.com/YOUR_USERNAME/BalatroMultiplayer.git
cd BalatroMultiplayer

# 2. Set up remotes and install stylua
git remote add upstream https://github.com/Balatro-Multiplayer/BalatroMultiplayer.git
# Install stylua from: https://github.com/JohnnyMorganz/StyLua

# 3. Ready to develop!
git checkout -b feature/your-feature
# Make changes, then:
stylua .
git commit -m "your changes"
```

## Development Workflow

```bash
# Sync and create branch
git checkout main && git pull upstream main && git push origin main
git checkout -b feature/your-feature

# Develop → Format → Commit → Push → PR
stylua . && git add . && git commit -m "feat: your change"
git push origin feature/your-feature
# Then create PR on GitHub
```

**Verify Setup**: Test that stylua works (`stylua --version`) before starting development.

### Code Formatting

We use [stylua](https://github.com/JohnnyMorganz/StyLua) for consistent code formatting.

**Before submitting a PR**:
```bash
stylua --check .
stylua .  # to format all files
```

**IDE/Editor Setup**: Most editors have Lua language support plugins that can format code on save using stylua:
- **VS Code**: [Lua Language Server extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) + StyLua
- **JetBrains**: [SumnekoLua](https://plugins.jetbrains.com/plugin/22315-sumnekolua) + StyLua

**File Structure**:
- Keep related functionality in logical directories (`objects/`, `ui/`, `networking/`)
- Use descriptive filenames that indicate purpose
- Group similar objects together (jokers, consumables, etc.)

### Balatro-Specific Patterns

**Mod Integration Pattern**:
* Use standard SMODS patterns
* Refer to existing implementation in objects/ directories for working examples

**Networking Actions**:
```lua
-- Follow the established action pattern
MP.ACTIONS.example_action = function(data)
	-- Validate input
	if not data or not data.required_field then
		return
	end

	-- Perform action
	-- Update game state
	-- Send response if needed
end
```

**UI Components**:
- Follow the existing component pattern in `ui/components/`
- Use consistent naming: `lobby_*`, `game_*`, etc.

## Contribution Guidelines

1. **Commits**: Write clear, descriptive commit messages
2. **Testing**: Test your changes thoroughly across different scenarios

## Testing Guidelines

- Test in both single-player and multiplayer environments
- Verify compatibility with supported Balatro / SMods / Lovely versions
- Test with different rulesets and gamemodes
- Include example seeds in PR description when relevant

## Code Review Process

All contributions go through code review. Reviewers will check for:

- Code style compliance
- Functionality correctness
- Performance considerations
- Compatibility with existing features
- Security implications (networking code)

## Questions?

- Check existing [GitHub Issues](https://github.com/Balatro-Multiplayer/BalatroMultiplayer/issues)
- Join the [Discord server](https://discord.gg/balatromp) for discussion
