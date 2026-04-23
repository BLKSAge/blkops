# BlkOps 🎯

**A systematic, AI-powered job search operations framework.**

Built for the job seeker who approaches their career transition like a mission — with intel, precision, and a clear objective.

> Evaluate postings with brutal honesty. Generate ATS-optimized resumes. Scan company career pages. Track your pipeline. Execute outreach. All from a single conversational interface.

---

## Origin & Attribution

BlkOps is adapted from [andrew-shwetzer/career-ops-plugin](https://github.com/andrew-shwetzer/career-ops-plugin), itself adapted from [santifer/career-ops](https://github.com/santifer/career-ops).

The original framework provided the complete skill architecture, evaluation logic, ATS resume generation, and workflow design. Full credit to Andrew Shwetzer for that foundation.

**What BlkOps adds:**
- Pre-built target company and staffing agency database (Atlanta, Austin, national)
- Automatic career page scan protocol with priority tiers
- Veteran/DoD-specific evaluation lens
- Critic level 8 scoring by default — honest, not inflated
- Session handoff document system for continuity across conversations
- Branded resume output pipeline (`#1A1A2E` / `#C47B2B`, Arial, PDF)
- CLAUDE.md context bridge for Claude Code integration

---

## Quick Start

1. Create a Project in Claude.ai and upload your resume to project knowledge
2. Say **"set up my profile"**
3. Paste a job posting and say **"evaluate this"**
4. Say **"tailor my resume"** for strong matches
5. Say **"help"** anytime

### With Claude Code
```bash
git clone https://github.com/BLKSAge/blkops.git
cd blkops
# Claude Code reads CLAUDE.md automatically
```

---

## Skills

| Skill | What It Does |
|---|---|
| **evaluate** | Score a job posting 1.0-5.0, full A-F block analysis |
| **tailor-resume** | ATS-optimized resume tailored to a specific JD |
| **scan** | Search company career portals for openings |
| **triage** | Quick-score a pipeline of scan results |
| **track** | Application tracker with status and stats |
| **apply** | Help fill out application forms |
| **research** | Company intelligence brief |
| **outreach** | Draft LinkedIn/email messages to contacts |
| **compare** | Side-by-side comparison of opportunities |

---

## Target Lists

`/targets/` contains pre-built scan lists for Atlanta GA, Austin TX, and national firms. Start with `priority-15.md` every session.

---

## Privacy

`data/` is gitignored. Your profile, resumes, and applications stay local.

---

## License

MIT. See [ATTRIBUTION.md](ATTRIBUTION.md) for full credits.

---

## Roadmap

- [ ] Automated career page scanner (Playwright-based)
- [ ] Application tracker Notion sync
- [ ] LinkedIn outreach templates library
- [ ] Multi-user profile support
