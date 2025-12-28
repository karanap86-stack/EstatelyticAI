# 🤝 Partner Portal - Quick Reference

## 📋 Partner Types at a Glance

| Type | Access Level | Commission | Typical Use |
|------|-------------|------------|-------------|
| **Channel Partner** | Limited (no contact by default) | 10-30% | Lead generation, referrals |
| **Developer** | Full access | 5-15% (to platform) | Inventory provider |
| **Broker** | Full with consent | 15-25% | Client representation |
| **RERA Agent** (India) | Full with consent | 10-20% | Compliant transactions |
| **Service Provider** | Limited | 5-15% | Ancillary services |

---

## 🔑 Default Consent Settings

### Channel Partner
```
shareContact: ❌ FALSE (no direct client contact)
shareBudget: ✅ TRUE
shareRequirements: ✅ TRUE
```

### Developer
```
shareContact: ✅ TRUE (full access)
shareBudget: ✅ TRUE
shareRequirements: ✅ TRUE
```

---

## 🔄 Lead Sharing Process (Quick)

```
1. Agent selects partner
2. Configure consent (contact/budget/requirements)
3. System filters data based on consent
4. POST /api/share-lead → Partner webhook
5. Partner works lead
6. Partner reports closure → POST /api/partner-update
7. Commission recorded automatically
```

---

## 🚫 Partner Limitations

### Cannot Access:
- ❌ Other partners' leads
- ❌ Internal agent notes
- ❌ Lead scoring/temperature
- ❌ Client contact without consent
- ❌ Platform admin settings
- ❌ Competitor data

### Can Access:
- ✅ Shared leads (with consent)
- ✅ Property listings
- ✅ Own commission data
- ✅ Own performance metrics

---

## 💰 Commission Quick Reference

| Partner Type | Commission Direction | Typical % |
|--------------|---------------------|-----------|
| Channel Partner | Platform → Partner | 10-30% |
| Developer | Developer → Platform | 5-15% |
| Broker | Split (60/40) | 15-25% |
| RERA Agent | Platform → Partner | 10-20% |
| Service Provider | Flat or % | 5-15% |

**Commission Calculation**:
```javascript
commissionAmount = agreementValue * (commissionPercent / 100)
```

---

## 📡 API Endpoints

### Share Lead
```http
POST /api/share-lead
{
  partnerId, partnerName, callbackUrl,
  lead: { /* filtered */ },
  consent: { shareContact, shareBudget, shareRequirements }
}
```

### Update Status / Record Commission
```http
POST /api/partner-update
{
  leadId, partnerId, status,
  agreementValue, commissionPercent, notes
}
```

### Share Appointment
```http
POST /api/share-appointment
{
  partner: { partnerId, status },
  payload: { partnerId, leadId, appointment, lead }
}
```

---

## 📊 Key Metrics

**Per Partner**:
- Leads received
- Acceptance rate = (accepted / received) * 100
- Conversion rate = (closed / accepted) * 100
- Total revenue generated
- Total commission earned
- Average deal size
- Average time to close

---

## ⚙️ Partner Profile Fields

```javascript
{
  id: 'partner_123',
  name: 'ABC Realty',
  type: 'channel|developer|broker|rera_agent|service_provider',
  defaultCommission: 15,  // %
  capacity: 10,  // max concurrent leads
  revenue: [
    {
      id, leadId, agreementValue,
      commissionPercent, commissionAmount, timestamp
    }
  ],
  callbackUrl: 'https://partner.com/webhook',  // optional
  contactEmail, contactPhone, status, createdAt, updatedAt
}
```

---

## 🎯 Common Workflows

### Channel Partner Workflow
```
1. Receives lead (no contact info)
2. Finds matching properties
3. Contacts internal agent (not client)
4. Agent coordinates viewing
5. Deal closes → Reports to platform
6. Commission paid
```

### Developer Workflow
```
1. Receives full lead details
2. Contacts client directly
3. Schedules site visit
4. Sends proposal
5. Closes booking
6. Reports booking → Platform gets 5% commission
```

### RERA Agent Workflow (India)
```
1. Receives lead
2. Verifies RERA compliance
3. Shares only RERA-approved properties
4. Facilitates compliant transaction
5. Issues RERA-compliant invoice
6. Tax-compliant commission payment
```

---

## 🔐 Security Checklist

- ✅ Consent-based sharing
- ✅ Client-safe data filtering
- ✅ No partner-to-partner visibility
- ✅ Audit trail logging
- ⚠️ Add webhook signature verification (recommended)
- ⚠️ Implement partner authentication (recommended)

---

## 🚀 Quick Setup (Admin)

1. **Add Partner**:
   - Navigate to Partners Dashboard
   - Click "Add Partner"
   - Fill: Name, Type, Commission %, Capacity
   - Optional: Callback URL
   - Save

2. **Share Lead with Partner**:
   - Open lead in Leads Dashboard
   - Select partner from dropdown
   - Configure consent checkboxes
   - Click "Share"
   - Partner receives webhook notification

3. **Record Commission**:
   - Partner reports closure via API
   - System auto-calculates commission
   - Recorded in partner.revenue[]
   - Visible in partner dashboard

---

## 📱 Current Status

**Working**: ✅ CRUD, Sharing, Consent, Commission Tracking, Webhooks
**Limitations**: localStorage (migrate to DB), No partner login, No webhook security
**Recommended**: Add authentication, webhook signatures, backend DB migration

---

**Version**: 1.0  
**Last Updated**: December 27, 2025
