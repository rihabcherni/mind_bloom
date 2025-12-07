const express = require('express');
const router = express.Router();
const axios = require('axios');

router.post('/adhd', async (req, res) => {
  try {
    const { question } = req.body;

    if (!question || question.trim().length === 0) {
      return res.status(400).json({
        error: 'Question cannot be empty'
      });
    }
    const adhdKeywords = [
      'tdah', 'trouble du déficit de l’attention', 'hyperactivité', 'hyperactif', 'inattention',
      'distrait', 'impatience', 'impulsivité', 'impulsif', 'agitation', 'agité',
      'désorganisation', 'oubli', 'procrastination', 'difficulté à se concentrer',
      'attention', 'concentration', 'mémoire', 'planification', 'organisation',
      'gestion du temps', 'symptômes', 'symptome', 'diagnostic', 'diagnostiquer',
      'traitement', 'thérapie', 'médicament', 'ritalin', 'concerta', 'strattera',
      'enfant', 'enfants', 'adolescent', 'adolescents', 'école', 'scolaire',
      'comportement', 'trouble', 'déficit', 'famille', 'parents', 'stress',
      'anxiété', 'motivation', 'fatigue', 'colère', 'irritabilité', 'autocritique',
      'sensibilité', 'relation sociale', 'amis', 'difficulté sociale', 'organisation personnelle',

      'adhd', 'attention deficit hyperactivity disorder', 'hyperactivity', 'hyperactive',
      'inattention', 'distracted', 'impulsivity', 'impulsive', 'restlessness', 'fidgeting',
      'disorganization', 'forgetfulness', 'procrastination', 'difficulty focusing', 'focus',
      'concentration', 'memory', 'planning', 'organization', 'time management', 'symptoms',
      'diagnosis', 'treatment', 'therapy', 'medication', 'ritalin', 'concerta', 'strattera',
      'child', 'children', 'teen', 'teens', 'school', 'academic', 'behavior', 'disorder',
      'deficit', 'family', 'parents', 'stress', 'anxiety', 'motivation', 'fatigue', 'anger',
      'irritability', 'self-criticism', 'sensitivity', 'social interaction', 'friends', 'social difficulties',
      'personal organization', 'focus issues', 'daydreaming', 'restless', 'task management', 'attention span',

      'فرط النشاط', 'اضطراب فرط الحركة وتشتت الانتباه', 'نشاط مفرط', 'انتباه', 'تشتت', 'عدم التركيز',
      'اندفاعية', 'طفل', 'أطفال', 'مراهق', 'مراهقون', 'مدرسة', 'سلوك', 'اضطراب', 'نقص',
      'علاج', 'دواء', 'ريتالين', 'كونسيرتا', 'ستراتيرا', 'أعراض', 'تشخيص', 'تشخيص المرض',
      'قلق', 'توتر', 'إرهاق', 'نقص الدافعية', 'إدارة الوقت', 'تنظيم', 'ذاكرة', 'تخطيط',
      'علاقات اجتماعية', 'أصدقاء', 'صعوبات اجتماعية', 'حساسية', 'إنتقاد الذات', 'تشتت الانتباه',
      'الحركة الزائدة', 'سلوكيات متهورة', 'نسيان', 'تسويف', 'مشاكل التركيز', 'أحلام اليقظة'
    ];
    const questionLower = question.toLowerCase();
    const isADHDRelated = adhdKeywords.some(keyword =>
      questionLower.includes(keyword)
    );

    if (!isADHDRelated) {
      return res.json({
        answer: "I'm sorry, but I specialize only in ADHD-related questions. Could you please ask me a question about ADHD?\n\nExamples:\n• What are the symptoms of ADHD?\n• How is ADHD diagnosed?\n• What treatments are available?"
      });
    }

    console.log(`[Chatbot] Question: ${question}`);
    const aiResponse = await callGroqAPI(question);

    res.json({
      answer: aiResponse,
      timestamp: new Date().toISOString()
    });

  } catch (error) {
    console.error('[Chatbot Error]:', error.message);
    res.status(500).json({
      error: 'Error processing your question.'
    });
  }
});
async function callGroqAPI(question) {
  try {
    const GROQ_API_KEY = process.env.GROQ_API_KEY;

    const response = await axios.post(
      'https://api.groq.com/openai/v1/chat/completions',
      {
        model: 'openai/gpt-oss-20b',
        messages: [
          {
            role: 'system',
            content: `You are a medical expert specialized in ADHD. 
Answer ONLY ADHD-related questions in a clear and simple manner.
Keep your answers short and concise.
You can respond in French, English, or Arabic (Tunisian) depending on the user's question.
Always recommend consulting a professional. Use simple text with line breaks and lists, do NOT use tables.`
          },
          {
            role: 'user',
            content: question
          }
        ],
        temperature: 0.7,
        max_tokens: 800
      },
      {
        headers: {
          'Authorization': `Bearer ${GROQ_API_KEY}`,
          'Content-Type': 'application/json'
        }
      }
    );

    return response.data.choices[0].message.content;

  } catch (error) {
    console.error('Erreur Groq:', error.message);
    throw error;
  }
}


module.exports = router;
