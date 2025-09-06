# 🔧 Troubleshooting Guide - AI Development Workflow

## 🚨 **Common Issues and Solutions**

### **1. Claude Code Memory Issues**

#### **Problem**: Claude Code doesn't remember the workflow
**Symptoms**:
- Claude Code asks about the project setup repeatedly
- No reference to `DEVELOPMENT_STATUS.md`
- Doesn't follow the parallel development protocol

**Solutions**:
1. **Re-copy Memory Card**:
   ```bash
   # Open CLAUDE_MEMORY_CARD.md
   # Copy the entire section between --- markers
   # Paste into Claude Code user memory
   ```

2. **Verify Memory Location**:
   - Ensure it's saved in **user memory**, not session memory
   - Check that it's persistent across sessions
   - Test on a different device

3. **Memory Format**:
   - Make sure the memory is properly formatted
   - Include all workflow steps
   - Test with: "What's the current workflow for parallel AI development?"

#### **Problem**: Memory gets corrupted or lost
**Solutions**:
1. **Backup Memory**:
   - Save the memory content in a text file
   - Keep it in your project repository
   - Re-apply when needed

2. **Regular Updates**:
   - Update memory when workflow changes
   - Test memory on different devices
   - Keep memory concise but complete

### **2. Deployment Issues**

#### **Problem**: Vercel deployment fails
**Symptoms**:
- Build errors in Vercel dashboard
- Deployment stuck in "Building" state
- Environment variable errors

**Solutions**:
1. **Check Build Logs**:
   ```bash
   vercel logs --limit=50
   ```

2. **Verify Environment Variables**:
   ```bash
   vercel env ls
   ```

3. **Test Locally First**:
   ```bash
   npm run build
   ```

4. **Common Fixes**:
   - Check for TypeScript errors
   - Verify all dependencies are installed
   - Ensure environment variables are set
   - Check for missing files

#### **Problem**: Auto-deployment not working
**Solutions**:
1. **Check Vercel Integration**:
   - Go to Vercel dashboard
   - Check Git integration settings
   - Verify repository connection

2. **Verify Webhook**:
   - Check GitHub webhook settings
   - Ensure Vercel has repository access
   - Test with manual deployment

### **3. Git and Repository Issues**

#### **Problem**: Merge conflicts between AIs
**Symptoms**:
- Git merge conflicts
- Conflicting changes in same files
- Lost work from one AI

**Solutions**:
1. **Prevention**:
   - Always check `DEVELOPMENT_STATUS.md` before starting
   - Update status when beginning work
   - Use descriptive commit messages

2. **Resolution**:
   ```bash
   # Check status
   git status
   
   # Resolve conflicts
   git add .
   git commit -m "resolve: merge conflicts"
   
   # Update status file
   # Continue development
   ```

3. **Communication**:
   - Update `DEVELOPMENT_STATUS.md` with conflict resolution
   - Note what was changed
   - Coordinate next steps

#### **Problem**: Scripts not working
**Solutions**:
1. **Check Permissions**:
   ```bash
   chmod +x scripts/*.sh
   ```

2. **Verify Paths**:
   - Ensure scripts are in correct location
   - Check relative paths in scripts
   - Test script execution

3. **Debug Scripts**:
   ```bash
   # Run with debug output
   bash -x scripts/check-deployment.sh
   ```

### **4. Project-Specific Issues**

#### **Problem**: Next.js build failures
**Solutions**:
1. **TypeScript Errors**:
   ```bash
   # Check for TypeScript errors
   npx tsc --noEmit
   ```

2. **Prisma Issues**:
   ```bash
   # Generate Prisma client
   npm run db:generate
   ```

3. **Environment Variables**:
   ```bash
   # Check .env.local
   cat .env.local
   ```

#### **Problem**: React build failures
**Solutions**:
1. **Dependency Issues**:
   ```bash
   # Clear cache and reinstall
   rm -rf node_modules package-lock.json
   npm install
   ```

2. **Build Configuration**:
   - Check `package.json` scripts
   - Verify build configuration
   - Check for missing dependencies

### **5. Communication Issues**

#### **Problem**: AIs not coordinating properly
**Symptoms**:
- Both AIs working on same feature
- Conflicting changes
- Lost work

**Solutions**:
1. **Improve Status Updates**:
   - Update `DEVELOPMENT_STATUS.md` more frequently
   - Include specific task details
   - Note completion status

2. **Better Commit Messages**:
   ```bash
   # Use descriptive messages
   git commit -m "feat: add user authentication system"
   git commit -m "fix: resolve login form validation error"
   ```

3. **Regular Check-ins**:
   - Check status file every 30 minutes
   - Update progress regularly
   - Note any blockers

## 🛠️ **Emergency Procedures**

### **When Everything Breaks**
1. **Stop All Work**:
   - Don't make any more changes
   - Document current state

2. **Assess Situation**:
   ```bash
   # Check current status
   git status
   ./scripts/check-deployment.sh
   ```

3. **Create Backup**:
   ```bash
   # Create backup branch
   git checkout -b emergency-backup
   git add .
   git commit -m "emergency: backup current state"
   ```

4. **Reset and Restart**:
   ```bash
   # Go back to last working state
   git checkout main
   git reset --hard [last-working-commit]
   ```

### **Recovery Steps**
1. **Update Status File**:
   - Document what went wrong
   - Note recovery steps taken
   - Plan next actions

2. **Test Everything**:
   ```bash
   npm run build
   ./scripts/check-deployment.sh
   ```

3. **Resume Development**:
   - Start with small changes
   - Test frequently
   - Update status regularly

## 📞 **Getting Help**

### **When to Ask for Help**
- Multiple failed deployments
- Persistent memory issues
- Complex merge conflicts
- Unresolved build errors

### **Information to Provide**
1. **Error Messages**: Exact error text
2. **Steps Taken**: What you tried
3. **Current Status**: From `DEVELOPMENT_STATUS.md`
4. **Environment**: OS, Node version, etc.
5. **Logs**: Build logs, deployment logs

### **Self-Help Resources**
1. **Error Prevention Guide**: `ERROR_PREVENTION_GUIDE.md`
2. **Project Documentation**: README.md
3. **Vercel Documentation**: vercel.com/docs
4. **Git Documentation**: git-scm.com/docs

## ✅ **Prevention Checklist**

### **Daily Checks**
- [ ] Check `DEVELOPMENT_STATUS.md` before starting
- [ ] Run `./scripts/check-deployment.sh`
- [ ] Test build locally before pushing
- [ ] Update status file regularly
- [ ] Use descriptive commit messages

### **Weekly Checks**
- [ ] Verify Claude Code memory is working
- [ ] Test workflow on different device
- [ ] Update error prevention guide
- [ ] Review and improve communication
- [ ] Backup important configurations

### **Monthly Checks**
- [ ] Update workflow documentation
- [ ] Review and optimize scripts
- [ ] Check for new best practices
- [ ] Update memory card if needed
- [ ] Test complete workflow end-to-end

---

**Remember**: Most issues can be prevented with good communication and regular status updates. When in doubt, check the status file and coordinate with the other AI! 🤖
