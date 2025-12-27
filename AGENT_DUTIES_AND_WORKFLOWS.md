# 👥 Complete Agent & Department Structure Documentation

## 📋 Table of Contents
1. [Department Hierarchy](#department-hierarchy)
2. [Agent Roles & Designations](#agent-roles--designations)
3. [Agent Duties by Role](#agent-duties-by-role)
4. [Agent Limitations & Permissions](#agent-limitations--permissions)
5. [Agent Assignment Workflows](#agent-assignment-workflows)
6. [Load Balancing & Task Distribution](#load-balancing--task-distribution)
7. [Multi-Language Support](#multi-language-support)
8. [Security Policies](#security-policies)
9. [Health Checks & Compliance](#health-checks--compliance)

---

## 🏢 Department Hierarchy

### All Departments
```javascript
[
  'HR',           // Human Resources
  'Sales',        // Primary client-facing agents
  'Accounts',     // Financial operations
  'Marketing',    // Campaign & content management
  'Support',      // Customer support & issue resolution
  'Tech',         // Technical operations & maintenance
  'Legal',        // Compliance & legal matters
  'Operations',   // Day-to-day operations
  'Product',      // Product development
  'Admin',        // Administrative tasks
  'Procurement',  // Vendor & supplier management
  'R&D',          // Research & Development
  'Compliance',   // Regulatory compliance
  'Analytics',    // Data analytics & insights (LinkedIn Bot)
  'Training'      // Agent training & development
]
```

### Department Functions

| Department | Primary Function | Key Responsibilities |
|------------|------------------|---------------------|
| **Sales** | Client acquisition & conversion | Lead handling, property tours, negotiations, closures |
| **Marketing** | Brand & campaigns | Content creation, campaign execution, social media |
| **Support** | Customer service | Issue resolution, feedback handling, escalations |
| **Analytics** | Data insights | Market trends, LinkedIn insights, reporting |
| **Operations** | Process management | Workflow optimization, SOP enforcement |
| **Tech** | System maintenance | Platform upkeep, bug fixes, API integrations |
| **Compliance** | Regulatory adherence | RERA compliance, legal documentation |
| **Training** | Agent development | Onboarding, skill enhancement, calibration |

---

## 🎭 Agent Roles & Designations

### Role Hierarchy

```
┌─────────────────────────────────────────────────────────┐
│                   MASTER LEVEL                          │
│  master_admin, backup_master_admin, ai_master_admin     │
│  - Full system access                                   │
│  - All departments & countries                          │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│                 DEPARTMENT LEVEL                        │
│  department_admin, ai_admin                             │
│  - Department-wide access                               │
│  - Manage department agents                             │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│                   MANAGER LEVEL                         │
│  manager, country_manager, country_manager_backup,      │
│  ai_manager                                             │
│  - Team/country access                                  │
│  - Task assignment & supervision                        │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│                    AGENT LEVEL                          │
│  agent, ai_agent                                        │
│  - Individual client interactions                       │
│  - Limited to assigned tasks                            │
└─────────────────────────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│                  SPECIALIZED ROLES                      │
│  tech_admin, tech_user, international,                  │
│  linkedin_insights                                      │
│  - Specific functional access                           │
└─────────────────────────────────────────────────────────┘
```

### Complete Role List

```javascript
roles: [
  // Human Admins
  'master_admin',         // Full system admin
  'backup_master_admin',  // Backup full admin
  'department_admin',     // Department head
  'manager',              // Team manager
  'agent',                // Frontline agent
  
  // AI Agents
  'ai_master_admin',      // AI system admin
  'ai_admin',             // AI department head
  'ai_manager',           // AI team manager
  'ai_agent',             // AI frontline agent
  
  // Technical
  'tech_admin',           // Tech operations admin
  'tech_user'             // Tech support user
]
```

### Access Matrix

| Role | Scope | Can Modify | Can View | Can Assign Tasks |
|------|-------|------------|----------|------------------|
| **master_admin** | All | All data | All data | All agents |
| **backup_master_admin** | All | All data | All data | All agents |
| **ai_master_admin** | All | AI configs | All data | AI agents |
| **department_admin** | Department | Department data | Department data | Department agents |
| **ai_admin** | Department | AI dept data | Department data | AI dept agents |
| **manager** | Team | Team data | Team data | Team agents |
| **country_manager** | Country | Country data | Country data | Country agents |
| **country_manager_backup** | Country | Country data | Country data | Country agents |
| **ai_manager** | Team | AI team data | Team data | AI team agents |
| **agent** | Self | Own tasks | Own tasks | None |
| **ai_agent** | Self | Own tasks | Own tasks | None |
| **tech_admin** | Core systems | Tech configs | System logs | Tech users |
| **tech_user** | Core systems | Limited tech | System logs | None |
| **international** | Assigned countries | Assigned data | Assigned data | None |
| **linkedin_insights** | Global market data | Market insights | Public data | None |

---

## 👔 Agent Duties by Role

### 1. Country Manager (`country_manager`)

**Current Agents**:
- Priya (Mumbai) - India
- Sara (Dubai) - UAE

**Responsibilities**:
- ✅ Oversee all agents in their country
- ✅ Handle escalated client issues
- ✅ Approve major deals and negotiations
- ✅ Post and update content for their country
- ✅ Monitor team performance
- ✅ Assign tasks to local agents
- ✅ Handle VIP clients personally
- ✅ Coordinate with developers and partners
- ✅ Manage load distribution with backup manager

**Limitations**:
- ❌ Cannot access other countries' data
- ❌ Cannot modify master admin settings
- ❌ Cannot access technical backend
- ❌ Cannot assign tasks outside their country

**Workflows**:
```
Client Escalation → Country Manager Review → Resolution/Approval
VIP Lead → Auto-assign to Country Manager → Personal Handling
High Load → Share tasks with Backup Manager
```

---

### 2. Country Manager Backup (`country_manager_backup`)

**Current Agents**:
- Anil (Deputy India) - India
- Omar (Deputy UAE) - UAE

**Responsibilities**:
- ✅ Support main country manager
- ✅ Handle tasks when main manager is unavailable
- ✅ Share load when task volume > threshold (default: 5 tasks)
- ✅ Approve deals in main manager's absence
- ✅ Post and update content for their country
- ✅ Monitor team performance
- ✅ Escalate critical issues to master admin

**Limitations**:
- ❌ Same as country manager
- ❌ Lower priority than main manager for VIP clients
- ❌ Cannot override main manager's decisions

**Workflows**:
```
High Load (>5 tasks) → Auto-split tasks 50/50 between Main & Backup
Main Manager Unavailable → Backup takes full responsibility
```

---

### 3. Sales Agent (`agent` in Sales Department)

**Current Agents (India)**:
- Amit (Delhi)
- Ravi (Bangalore)
- Lakshmi (Chennai)
- Sourav (Kolkata)
- Harpreet (Chandigarh)
- Meera (Ahmedabad)
- Anjali (Lucknow)
- Ayesha (Hyderabad)
- Nisha (Thiruvananthapuram)

**Responsibilities**:
- ✅ Interact with clients (calls, WhatsApp, email, chat)
- ✅ Handle property inquiries
- ✅ Schedule and conduct property tours
- ✅ Provide property comparisons
- ✅ Handle basic negotiations
- ✅ Collect KYC documents
- ✅ Follow up on leads
- ✅ Maintain client relationship
- ✅ Interact with developers and channel partners

**Limitations**:
- ❌ Cannot post or update content (marketing)
- ❌ Cannot approve deals above threshold
- ❌ Cannot access other agents' clients
- ❌ Cannot modify system settings
- ❌ Cannot access admin dashboards
- ❌ Cannot share internal logic or confidential information
- ❌ Must escalate complex issues to manager

**Workflows**:
```
New Lead → Auto-assign by Location → Agent Handles → Convert/Escalate
Client Query → Agent Responds → [Complex] → Escalate to Manager
Property Tour → Agent Schedules → Conducts → Follow Up
Negotiation → Agent Initiates → [Above Limit] → Manager Approval
```

---

### 4. International Agent (`international` role)

**Current Agents**:
- Olga (Russia Desk) - Handles Russian investors in UAE

**Responsibilities**:
- ✅ Handle clients from assigned countries
- ✅ Provide language-specific support
- ✅ Bridge cultural gaps
- ✅ Handle international investor queries
- ✅ Coordinate with local agents for property tours
- ✅ Manage timezone-appropriate communications

**Limitations**:
- ❌ Cannot access countries outside assignment
- ❌ Cannot approve deals without local manager approval
- ❌ Cannot post content
- ❌ Limited to assigned country investors only

**Workflows**:
```
Russian Investor → Auto-assign to Olga → Handle in Russian → Coordinate with UAE agents
```

---

### 5. AI Agent (`ai_agent`)

**Current Agents**:
- LinkedIn Insights Bot - Market intelligence & trend analysis

**Responsibilities**:
- ✅ Automated market research
- ✅ LinkedIn data scraping and analysis
- ✅ Trend detection
- ✅ Content suggestions
- ✅ Post and update market insights
- ✅ Generate analytics reports
- ✅ Monitor competitor activity

**Limitations**:
- ❌ Cannot interact directly with clients
- ❌ Cannot make final decisions on content
- ❌ Cannot access personal client data
- ❌ Limited to public data sources
- ❌ Requires human approval for critical insights

**Workflows**:
```
Weekly Schedule → Scrape LinkedIn → Analyze Trends → Generate Report → Send to Marketing
New Market Trend Detected → Alert Country Managers → Suggest Content
```

---

### 6. Department Admin (`department_admin`)

**Responsibilities**:
- ✅ Manage all agents within their department
- ✅ Approve department-level decisions
- ✅ Access department analytics
- ✅ Assign/reassign agents
- ✅ Monitor department KPIs
- ✅ Escalate cross-department issues to master admin

**Limitations**:
- ❌ Cannot access other departments
- ❌ Cannot modify master settings
- ❌ Cannot access tech backend
- ❌ Limited to department scope

---

### 7. Manager (`manager`)

**Responsibilities**:
- ✅ Manage team of agents
- ✅ Assign daily tasks
- ✅ Monitor team performance
- ✅ Approve mid-level decisions
- ✅ Handle team escalations
- ✅ Post and update content

**Limitations**:
- ❌ Cannot access other teams
- ❌ Cannot modify department settings
- ❌ Must escalate major decisions to department admin

---

### 8. Tech Admin (`tech_admin`)

**Responsibilities**:
- ✅ Maintain system infrastructure
- ✅ Manage API integrations
- ✅ Handle technical escalations
- ✅ Monitor system health
- ✅ Deploy updates
- ✅ Access system logs

**Limitations**:
- ❌ Cannot access client data directly
- ❌ Cannot modify business logic without approval
- ❌ Limited to technical scope

---

## 🔐 Agent Limitations & Permissions

### Permission Check Functions

#### 1. Can Interact with Clients?
```javascript
canAgentInteractWithClientsOnly(agent)
```

**Returns `true` if**:
- ✅ Designation = `'agent'`
- ✅ Department is valid (not Tech/Admin)
- ✅ NOT in restricted roles (admin/manager/AI/tech roles)

**Usage**: Check before allowing client communication

---

#### 2. Can Post or Update Content?
```javascript
canAgentPostOrUpdate(agent, country)
```

**Returns `true` if**:
- ✅ Designation = `country_manager`, `country_manager_backup`, `department_admin`, `manager`, `ai_admin`, `ai_manager`, or `ai_agent`
- ✅ Department is valid
- ✅ Agent's country matches target country
- **OR** Role = `linkedin_insights` (global posting)

**Usage**: Check before allowing content creation/editing

---

### Security Policy: Confidential Information

**Agents MUST NEVER share**:
- ❌ Internal system logic
- ❌ Recommendation algorithms
- ❌ Source code or implementation details
- ❌ API keys or credentials
- ❌ Database structure
- ❌ Admin interfaces or backend access
- ❌ Proprietary business rules

**Blocked Query Patterns**:
```javascript
/how does (your|the) (system|logic|ai|bot|recommendation|algorithm|code|backend)/i
/show.*code/i
/share.*logic/i
/internal|confidential|secret|proprietary/i
/api key|password|admin|database|security/i
```

**Response to Blocked Queries**:
```
"I'm sorry, but I cannot share internal logic or confidential information. 
My purpose is to assist you with your property needs and answer general questions."
```

---

## 🔄 Agent Assignment Workflows

### 1. Location-Based Assignment

```javascript
assignAgentByLocation({ country, state, city, isNRI })
```

#### For India (Domestic/NRI Clients)
```
Client Location Detection
         ↓
State & City Identified
         ↓
Find Agent: country='India' AND state=clientState AND role='local'
         ↓
Assign Local Agent with State Language Support
         ↓
[Not Found] → Fallback to Default India Agent
```

**Example**:
- Client from Mumbai → Assign Priya (Maharashtra, Marathi)
- Client from Delhi → Assign Amit (Delhi, Hindi/Punjabi)
- Client from Chennai → Assign Lakshmi (Tamil Nadu, Tamil)

#### For International Investors
```
Client Country Detection
         ↓
Find Agent: country=clientCountry AND role='international'
         ↓
Check assignedCountries[] if specified
         ↓
Assign International Agent
         ↓
[Not Found] → Fallback to Default Global Agent
```

**Example**:
- Russian investor → Assign Olga (Russia Desk)
- UAE local → Assign Sara (Country Manager)

---

### 2. Load-Based Task Distribution

```javascript
assignTasksToManagers(country, tasks, loadThreshold = 5)
```

**Logic**:
```
Get Country Managers (Main + Backup)
         ↓
Check Task Volume
         ↓
    [≤5 tasks] → Assign ALL to Main Manager
         ↓
    [>5 tasks] → Split 50/50 between Main & Backup
         ↓
Task Assignment Complete
```

**Example**:
- 3 tasks in India → All to Priya
- 10 tasks in India → 5 to Priya, 5 to Anil (backup)
- 1 task in UAE → All to Sara
- 12 tasks in UAE → 6 to Sara, 6 to Omar (backup)

---

### 3. Language-Based Assignment

```javascript
getLanguageOptionsForLocation({ country, state, city })
```

**India State-Language Mapping**:
| State | Primary Languages | Assigned Agents |
|-------|-------------------|-----------------|
| Maharashtra | Marathi, Hindi, English | Priya (Mumbai) |
| West Bengal | Bengali, Hindi, English | Sourav (Kolkata) |
| Tamil Nadu | Tamil, English | Lakshmi (Chennai) |
| Karnataka | Kannada, English, Hindi | Ravi (Bangalore) |
| Gujarat | Gujarati, Hindi, English | Meera (Ahmedabad) |
| Punjab | Punjabi, Hindi, English | Harpreet (Chandigarh) |
| Kerala | Malayalam, English, Hindi | Nisha (Thiruvananthapuram) |
| Uttar Pradesh | Hindi, Urdu, English | Anjali (Lucknow) |
| Telangana | Telugu, Urdu, English | Ayesha (Hyderabad) |
| Delhi | Hindi, English, Punjabi | Amit (Delhi) |

**Workflow**:
```
Detect Client Location (State/City)
         ↓
Map to Regional Languages
         ↓
Find Agent with Matching Language Skills
         ↓
Assign Agent + Set Communication Language
```

---

## 📊 Load Balancing & Task Distribution

### Dynamic Load Sharing

**Trigger**: Task volume exceeds threshold (default: 5)

**Process**:
1. Count active tasks for country
2. Get main manager + backup manager
3. If tasks > threshold:
   - Split tasks evenly (Math.ceil(tasks/2))
   - Assign first half to main manager
   - Assign second half to backup manager
4. If tasks ≤ threshold:
   - Assign all to main manager

**Benefits**:
- ✅ Prevents manager burnout
- ✅ Faster response times during peak loads
- ✅ Better client satisfaction
- ✅ Redundancy if main manager unavailable

---

## 🌍 Multi-Language Support

### Supported Languages by Country

**India** (22 official languages supported):
- Hindi, English, Bengali, Telugu, Marathi, Tamil, Gujarati, Urdu, Kannada, Odia, Punjabi, Malayalam, Assamese, Maithili, Santali, Kashmiri, Nepali, Konkani, Sindhi, Dogri, Manipuri, Bodo

**UAE**:
- Arabic, English

**Russia**:
- Russian, English

**85+ Countries Supported** - See [agentService.js](services/agentService.js) for complete list

### Language Detection Flow

```
Browser Locale Detection
         ↓
Geo-IP API (ipapi.co) for Country
         ↓
[India] → State-Based Language Options
         ↓
[Other] → Country-Default Languages
         ↓
Present Language Selector to Client
         ↓
Agent Uses Selected Language
```

---

## 🛡️ Security Policies

### 1. Information Disclosure Policy

**Prohibited Disclosures**:
- Internal algorithms
- Recommendation logic
- Source code
- API credentials
- Database schema
- Admin access methods
- Proprietary business rules

**Enforcement**:
```javascript
agentResponsePolicy(message)
```
- Scans for confidential query patterns
- Blocks response if match found
- Returns polite refusal message

---

### 2. Data Access Policy

| Role | Client Data | Lead Data | Analytics | System Logs | Tech Backend |
|------|-------------|-----------|-----------|-------------|--------------|
| master_admin | ✅ All | ✅ All | ✅ All | ✅ All | ✅ Full |
| country_manager | ✅ Country | ✅ Country | ✅ Country | ❌ No | ❌ No |
| agent | ✅ Assigned | ✅ Assigned | ❌ No | ❌ No | ❌ No |
| ai_agent | ❌ No Personal | ✅ Aggregated | ✅ Yes | ❌ No | ❌ No |
| tech_admin | ❌ Limited | ❌ Limited | ❌ No | ✅ All | ✅ Full |

---

### 3. Content Posting Policy

**Who Can Post**:
- ✅ Country Managers (for their country)
- ✅ Department Admins (for their department)
- ✅ Managers (for their team)
- ✅ AI Admin/Manager/Agent (with approval)
- ✅ LinkedIn Insights Bot (global market content)

**Who Cannot Post**:
- ❌ Regular agents
- ❌ Tech users
- ❌ International agents (unless approved)

---

## 🏥 Health Checks & Compliance

### 1. Country Manager Health Check

```javascript
checkCountryManagerHealth()
```

**Validates**:
- ✅ Exactly 1 main manager per country
- ✅ Exactly 1 backup manager per country
- ✅ No orphan countries without managers

**Returns**:
```javascript
[
  "Country India has 2 main managers (should be 1)",  // ❌ Error
  "Country UAE has 0 backups (should be 1)",          // ❌ Error
  "All countries have exactly one main and one backup manager." // ✅ Healthy
]
```

**Usage**: Run weekly to ensure proper coverage

---

### 2. Agent Calibration System

```javascript
calibrateAgents(feedbacks = [], callFeedbacks = [])
```

**Purpose**: Share best practices across agents

**Process**:
1. Collect feedback from chat interactions
2. Collect feedback from call interactions (weighted 2x)
3. Analyze top personality traits (Empathetic, Accountable, Friendly, etc.)
4. Distribute top 3 traits to all agents
5. Agents adopt calibrated traits for continuous improvement

**Personality Traits**:
- Empathetic - Understands emotions
- Accountable - Takes responsibility
- Friendly - Warm and positive
- Client-Centric - Focuses on needs
- Proactive - Anticipates needs
- Detail-Oriented - Pays attention
- Resourceful - Finds solutions
- Calm - Handles stress well
- Optimistic - Encourages clients
- Professional - High standards

**Workflow**:
```
Weekly/Monthly Feedback Analysis
         ↓
Identify Top 3 Performing Traits
         ↓
Apply to All Agents' Personality Profiles
         ↓
Agents Use Enhanced Traits in Next Interactions
         ↓
Measure Improvement → Repeat
```

---

## 📈 Agent Performance Metrics

### Key Performance Indicators (KPIs)

**Sales Agents**:
- Lead conversion rate
- Response time (avg)
- Client satisfaction score
- Tours conducted
- Deals closed
- Follow-up consistency

**Country Managers**:
- Team performance (aggregate)
- Escalation resolution time
- VIP client satisfaction
- Market penetration
- Revenue by country

**AI Agents**:
- Trend prediction accuracy
- Content engagement rate
- Report timeliness
- Data quality score

---

## 🔄 Agent Workflows by Scenario

### Scenario 1: New Lead Captured

```
Website Form Submitted
         ↓
Lead Saved with Location (country, state, city)
         ↓
assignAgentByLocation() → Determine Best Agent
         ↓
[India] → Local Agent by State
[International] → International Agent by Country
         ↓
Agent Notified (WhatsApp/Email/Dashboard)
         ↓
Agent Contacts Client in Preferred Language
         ↓
[Simple Query] → Agent Resolves
[Complex Query] → Escalate to Manager
         ↓
Follow-Up Scheduled
```

---

### Scenario 2: High Load Period

```
10 New Leads in India within 1 Hour
         ↓
System Detects High Load
         ↓
assignTasksToManagers('India', tasks, threshold=5)
         ↓
10 tasks > 5 threshold → Split
         ↓
5 tasks → Priya (Main Manager)
5 tasks → Anil (Backup Manager)
         ↓
Both Managers Handle Tasks in Parallel
         ↓
Faster Response Times, Happy Clients
```

---

### Scenario 3: Content Posting

```
Marketing Team Creates Blog Post
         ↓
System Checks: canAgentPostOrUpdate(user, 'India')
         ↓
[Country Manager/Admin/AI Agent] → ✅ Allowed
[Regular Agent] → ❌ Blocked
         ↓
Post Published to India Market
         ↓
LinkedIn Insights Bot Analyzes Engagement
         ↓
Suggests Improvements to Marketing
```

---

### Scenario 4: Confidential Query

```
Client Asks: "How does your recommendation algorithm work?"
         ↓
agentResponsePolicy(message) → Scans for Keywords
         ↓
Match Found: "algorithm", "work"
         ↓
Block Response, Return Polite Refusal:
"I'm sorry, but I cannot share internal logic or confidential information..."
         ↓
Agent Redirects to Property Questions
```

---

### Scenario 5: Agent Calibration

```
End of Month → Trigger Calibration
         ↓
Collect All Chat Feedback (100 interactions)
Collect All Call Feedback (50 calls)
         ↓
Analyze Trait Scores:
- Empathetic: 80 mentions
- Accountable: 65 mentions
- Friendly: 90 mentions
- Proactive: 45 mentions
         ↓
Top 3: Friendly, Empathetic, Accountable
         ↓
Apply to All Agents:
agent.personality = {
  style: "Friendly & Empathetic & Accountable",
  description: "Calibrated: Friendly, Empathetic, Accountable"
}
         ↓
Next Month → Agents Use Enhanced Traits
         ↓
Monitor Improvement
```

---

## 📝 Summary

### Total Agents: 15

**By Country**:
- India: 11 agents (1 main manager, 1 backup, 9 local agents)
- UAE: 3 agents (1 main manager, 1 backup, 1 international)
- Global: 1 AI agent (LinkedIn Insights)

**By Role**:
- Country Managers: 2
- Backup Managers: 2
- Local Sales Agents: 9
- International Agents: 1
- AI Agents: 1

**By Department**:
- Sales: 13
- International: 1
- Analytics: 1

---

## ✅ System Health Status

**Agent Coverage**: ✅ All countries have managers
**Load Balancing**: ✅ Automatic distribution at >5 tasks
**Language Support**: ✅ 85+ countries, 22 Indian languages
**Security**: ✅ Confidential info protection enabled
**Calibration**: ✅ Continuous improvement system active
**Permissions**: ✅ Role-based access control enforced

---

## 🚀 Next Steps & Recommendations

### Immediate
1. ✅ Run `checkCountryManagerHealth()` to verify coverage
2. ✅ Ensure all agents have valid departments
3. ✅ Test `canAgentInteractWithClientsOnly()` for security

### Short-Term
1. Add more local agents for high-demand states (e.g., 2nd agent for Mumbai, Delhi)
2. Create dedicated Support Department agents
3. Add Marketing Department agents for content creation
4. Implement agent performance dashboards

### Long-Term
1. AI Agent expansion (Support Bot, Negotiation Bot)
2. Automated agent assignment based on AI predictions
3. Real-time load monitoring and dynamic scaling
4. Multi-channel agent availability (WhatsApp, calls, chat simultaneously)

---

**Last Updated**: December 27, 2025
**Documentation Version**: 1.0
**Status**: Complete & Production-Ready ✅
