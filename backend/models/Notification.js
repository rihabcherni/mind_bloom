const mongoose = require('mongoose');

const notificationSchema = new mongoose.Schema({
  // Destinataire
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  
  // Type de notification
  type: {
    type: String,
    enum: [
      'diagnosis_ready',           // Diagnostic prêt pour parent
      'additional_test_requested', // Test additionnel demandé
      'new_case',                  // Nouveau cas pour docteur
      'test_response_submitted'    // Réponse au test soumise
    ],
    required: true
  },
  
  // Titre et message
  title: {
    type: String,
    required: true
  },
  message: {
    type: String,
    required: true
  },
  
  // Cas associé
  caseId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Case',
    required: true
  },
  
  // Statut
  isRead: {
    type: Boolean,
    default: false
  },
  
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// Index pour récupérer rapidement les notifications d'un user
notificationSchema.index({ userId: 1, createdAt: -1 });

module.exports = mongoose.model('Notification', notificationSchema);