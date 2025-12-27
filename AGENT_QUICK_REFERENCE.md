# 🎯 Agent Duties & Workflows - Quick Reference

## 📊 Complete Agent Structure at a Glance

### 15 Total Agents Across 3 Departments

```
┌─────────────────────────────────────────────────────────────────┐
│                        INDIA (11 Agents)                        │
├─────────────────────────────────────────────────────────────────┤
│  👑 Priya (Mumbai) - Country Manager                           │
│     ✓ Oversees all India operations                            │
│     ✓ Handles VIP clients & escalations                        │
│     ✓ Marathi, Hindi, English                                  │
├─────────────────────────────────────────────────────────────────┤
│  👔 Anil (Delhi) - Backup Country Manager                      │
│     ✓ Supports Priya, shares load >5 tasks                     │
│     ✓ Hindi, English                                           │
├─────────────────────────────────────────────────────────────────┤
│  LOCAL AGENTS (9):                                             │
│  • Amit (Delhi) - Hindi, English, Punjabi                      │
│  • Ravi (Bangalore) - Kannada, English, Hindi                  │
│  • Lakshmi (Chennai) - Tamil, English                          │
│  • Sourav (Kolkata) - Bengali, Hindi, English                  │
│  • Harpreet (Chandigarh) - Punjabi, Hindi, English             │
│  • Meera (Ahmedabad) - Gujarati, Hindi, English                │
│  • Anjali (Lucknow) - Hindi, Urdu, English                     │
│  • Ayesha (Hyderabad) - Telugu, Urdu, English                  │
│  • Nisha (Thiruvananthapuram) - Malayalam, English, Hindi      │
│     ✓ Handle client interactions                               │
│     ✓ Property tours & negotiations                            │
│     ✗ Cannot post content                                      │
│     ✗ Cannot approve major deals                               │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                         UAE (3 Agents)                          │
├─────────────────────────────────────────────────────────────────┤
│  👑 Sara (Dubai) - Country Manager                             │
│     ✓ Oversees all UAE operations                              │
│     ✓ Arabic, English                                          │
├─────────────────────────────────────────────────────────────────┤
│  👔 Omar - Backup Country Manager                              │
│     ✓ Supports Sara                                            │
│     ✓ Arabic, English                                          │
├─────────────────────────────────────────────────────────────────┤
│  🌍 Olga (Russia Desk) - International Agent                   │
│     ✓ Handles Russian investors                                │
│     ✓ Russian, English                                         │
│     ✗ Limited to Russian clients only                          │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      GLOBAL (1 AI Agent)                        │
├─────────────────────────────────────────────────────────────────┤
│  🤖 LinkedIn Insights Bot - Analytics                          │
│     ✓ Market research & trend analysis                         │
│     ✓ Content suggestions                                      │
│     ✓ Can post global market insights                          │
│     ✗ Cannot interact with clients directly                    │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔑 Quick Permission Matrix

| What? | Agent | Country Manager | Dept Admin | Master Admin |
|-------|-------|-----------------|------------|--------------|
| **Chat with Clients** | ✅ | ✅ | ✅ | ✅ |
| **Post Content** | ❌ | ✅ | ✅ | ✅ |
| **Approve Deals** | ❌ | ✅ | ✅ | ✅ |
| **Assign Tasks** | ❌ | ✅ | ✅ | ✅ |
| **View Other Countries** | ❌ | ❌ | ✅ | ✅ |
| **Modify Settings** | ❌ | ❌ | Limited | ✅ |
| **Access Tech Backend** | ❌ | ❌ | ❌ | ✅ |
| **Share Internal Logic** | ❌ | ❌ | ❌ | ❌ |

---

## 🚦 Key Workflows

### 1️⃣ New Lead Assignment
```
Lead Received → Check Location → Assign Local Agent → Contact Client
```
**Example**: Mumbai lead → Priya (Marathi speaker)

### 2️⃣ High Load Management
```
>5 Tasks → Split 50/50 → Main Manager + Backup Manager
```
**Example**: 10 tasks → 5 to Priya, 5 to Anil

### 3️⃣ Complex Escalation
```
Agent Can't Resolve → Escalate to Country Manager → Manager Handles
```

### 4️⃣ Content Posting
```
Create Content → Check Permission → Country Manager/Admin Only → Publish
```

### 5️⃣ Security Block
```
Client Asks for Algorithm → Detect Confidential Query → Block → Polite Refusal
```

---

## ⚡ Quick Facts

- **Total Departments**: 15 (Sales, Marketing, Support, Analytics, etc.)
- **Agent Roles**: 11 types (master_admin to agent)
- **Languages**: 85+ countries, 22 Indian languages
- **Load Threshold**: 5 tasks (triggers backup manager)
- **Security**: Auto-blocks confidential queries
- **Coverage**: India ✅ | UAE ✅ | Russia Desk ✅

---

## 🎯 Agent Limitations Summary

**ALL Agents Cannot**:
- ❌ Share system algorithms or internal logic
- ❌ Reveal API keys, passwords, or credentials
- ❌ Disclose database structure
- ❌ Explain backend implementation

**Regular Agents (non-managers) Cannot**:
- ❌ Post or update marketing content
- ❌ Approve deals above their limit
- ❌ Access other agents' client data
- ❌ Modify system settings
- ❌ View admin dashboards

**International Agents Cannot**:
- ❌ Access countries outside their assignment
- ❌ Approve deals without local manager

**AI Agents Cannot**:
- ❌ Interact directly with clients (except assigned tasks)
- ❌ Access personal client data
- ❌ Make final decisions without human approval

---

## 📞 Contact Hierarchy

```
Client Issue Level 1 → Local Sales Agent
         ↓ (Can't Resolve)
Client Issue Level 2 → Country Manager
         ↓ (Major Decision)
Client Issue Level 3 → Department Admin
         ↓ (Cross-Department)
Client Issue Level 4 → Master Admin
```

---

## 🔄 Weekly Operations

**Monday**: Load check, redistribute tasks if needed
**Wednesday**: Mid-week calibration review
**Friday**: Agent performance reports
**Monthly**: Full calibration with feedback analysis
**Quarterly**: Health checks (`checkCountryManagerHealth()`)

---

## ✅ System Status

- ✅ All countries have managers
- ✅ All countries have backup managers
- ✅ Load balancing active
- ✅ Language support enabled
- ✅ Security policies enforced
- ✅ Calibration system running

---

**For Complete Documentation**: See [AGENT_DUTIES_AND_WORKFLOWS.md](AGENT_DUTIES_AND_WORKFLOWS.md)
