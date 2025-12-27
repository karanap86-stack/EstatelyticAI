// adminApi.js - Secure admin backend API (scaffold)
const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();
const ADMIN_SECRET = process.env.ADMIN_SECRET || 'changeme';

// In-memory users/roles for scaffold (replace with DB in production)
const users = [
  { id: 'admin1', username: 'admin', password: 'admin123', role: 'admin' },
  // Add more users/roles as needed
];

// Middleware: authenticate admin
function authenticate(req, res, next) {
  const token = req.headers['authorization']?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token' });
  try {
    const decoded = jwt.verify(token, ADMIN_SECRET);
    req.user = decoded;
    next();
  } catch (e) {
    res.status(401).json({ error: 'Invalid token' });
  }
}

// Login endpoint
router.post('/login', (req, res) => {
  const { username, password } = req.body;
  const user = users.find(u => u.username === username && u.password === password);
  if (!user) return res.status(401).json({ error: 'Invalid credentials' });
  const token = jwt.sign({ id: user.id, role: user.role }, ADMIN_SECRET, { expiresIn: '2h' });
  res.json({ token, user: { id: user.id, username: user.username, role: user.role } });
});

// Example: get all users (admin only)
router.get('/users', authenticate, (req, res) => {
  if (req.user.role !== 'admin') return res.status(403).json({ error: 'Forbidden' });
  res.json(users.map(u => ({ id: u.id, username: u.username, role: u.role })));
});

// Example: audit log (in-memory for scaffold)
const auditLog = [];
function logAction(user, action, details) {
  auditLog.push({ user, action, details, timestamp: new Date().toISOString() });
}
router.get('/audit', authenticate, (req, res) => {
  if (req.user.role !== 'admin') return res.status(403).json({ error: 'Forbidden' });
  res.json(auditLog);
});

// Export router
module.exports = router;
