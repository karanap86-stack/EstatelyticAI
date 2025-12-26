// agentSelfLearningService.js
// Logic for continuous automated self-development and self-learning among agents

const CONVERSATION_LOG_KEY = 'agent_conversation_logs';
const MISTAKE_LOG_KEY = 'agent_mistake_logs';

const agentSelfLearningService = {
  logConversation({ agentId, userId, message, response, success }) {
    const logs = JSON.parse(localStorage.getItem(CONVERSATION_LOG_KEY) || '[]');
    logs.push({ agentId, userId, message, response, success, timestamp: new Date().toISOString() });
    localStorage.setItem(CONVERSATION_LOG_KEY, JSON.stringify(logs));
  },

  logMistake({ agentId, userId, message, error, correction }) {
    const logs = JSON.parse(localStorage.getItem(MISTAKE_LOG_KEY) || '[]');
    logs.push({ agentId, userId, message, error, correction, timestamp: new Date().toISOString() });
    localStorage.setItem(MISTAKE_LOG_KEY, JSON.stringify(logs));
  },

  analyzeAndSuggestImprovements() {
    // Analyze logs for repeated mistakes, missed intents, or user corrections
    const mistakes = JSON.parse(localStorage.getItem(MISTAKE_LOG_KEY) || '[]');
    const suggestions = {};
    mistakes.forEach(m => {
      if (!suggestions[m.message]) suggestions[m.message] = [];
      suggestions[m.message].push(m.correction);
    });
    // Return most common corrections for each mistake
    return Object.entries(suggestions).map(([msg, corrections]) => ({
      message: msg,
      topCorrection: corrections.sort((a,b) => corrections.filter(x=>x===a).length - corrections.filter(x=>x===b).length).pop()
    }));
  },

  shareLearningsWithAgents() {
    // In a real system, sync improvements to all agents (e.g., via backend or shared DB)
    // Here, just return the current suggestions
    return this.analyzeAndSuggestImprovements();
  }
};

export default agentSelfLearningService;
