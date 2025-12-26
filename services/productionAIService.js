// productionAIService.js
// Production AI/Voice integration using OpenAI and Dialogflow

const OPENAI_API_URL = 'https://api.openai.com/v1/chat/completions';
const DIALOGFLOW_API_URL = 'https://api.dialogflow.com/v1/query?v=20150910';

const productionAIService = {
  async getAIResponse({ message, userId, lang = 'en' }) {
    // Call OpenAI API (replace with your API key and model)
    const apiKey = process.env.OPENAI_API_KEY || '';
    const payload = {
      model: 'gpt-4',
      messages: [
        { role: 'system', content: 'You are a helpful real estate assistant.' },
        { role: 'user', content: message }
      ],
      user: userId,
      temperature: 0.7,
      max_tokens: 256,
      n: 1,
      stop: null,
      language: lang
    };
    const res = await fetch(OPENAI_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`
      },
      body: JSON.stringify(payload)
    });
    const data = await res.json();
    return data.choices?.[0]?.message?.content || 'Sorry, I could not answer that.';
  },

  async getVoiceResponse({ message, sessionId, lang = 'en' }) {
    // Call Dialogflow API (replace with your token)
    const token = process.env.DIALOGFLOW_TOKEN || '';
    const payload = {
      query: message,
      lang,
      sessionId
    };
    const res = await fetch(DIALOGFLOW_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(payload)
    });
    const data = await res.json();
    return data.result?.fulfillment?.speech || 'Sorry, I could not answer that.';
  }
};

export default productionAIService;
