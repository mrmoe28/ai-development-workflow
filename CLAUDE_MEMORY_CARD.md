# 🧠 Claude Code Memory Card - AI Development Workflow

**Copy this entire section to your Claude Code user memory:**

---

## PROJECT: [PROJECT_NAME] - Parallel AI Development

**WORKFLOW**: Parallel development with Claude Cursor. Both AIs work on same directory.

**BEFORE ANY WORK**:
1. Check `DEVELOPMENT_STATUS.md` for current status
2. Run `./scripts/check-deployment.sh` to see deployment status
3. Check `git status` for uncommitted changes

**DURING WORK**:
1. Update `DEVELOPMENT_STATUS.md` with your current task
2. Test locally: `npm run build` (or project-specific test command)
3. Commit with descriptive messages

**AFTER WORK**:
1. Update `DEVELOPMENT_STATUS.md` with completion status
2. Push: `git add . && git commit -m "description" && git push`
3. Monitor: `vercel ls` (if using Vercel)

**KEY FILES**:
- `DEVELOPMENT_STATUS.md` - Communication hub with Claude Cursor
- `ERROR_PREVENTION_GUIDE.md` - Common fixes and solutions
- `package.json` - Project dependencies and scripts
- `README.md` - Project documentation

**COMMON FIXES**:
- Build fails? Check `ERROR_PREVENTION_GUIDE.md`
- TypeScript errors? Check type definitions and imports
- Prisma errors? Run `npm run db:generate`
- NextAuth errors? Check environment variables

**DEPLOYMENT**: Auto-deploys on git push to main branch (if configured).

**COMMUNICATION**: Use `DEVELOPMENT_STATUS.md` to coordinate with Claude Cursor.

**COMMIT MESSAGE FORMAT**:
```
fix: resolve [specific error]
feat: add [new feature]
docs: update [documentation]
refactor: improve [code structure]
```

**EMERGENCY**: If stuck, check `ERROR_PREVENTION_GUIDE.md` or update status with issue details.

---

**This ensures both AIs understand the workflow on any device!**
