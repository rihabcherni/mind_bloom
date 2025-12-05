const Notification = require('../models/Notification');
class NotificationService {
  static async create(userId, type, title, message, caseId) {
    try {
      const notification = await Notification.create({
        userId,
        type,
        title,
        message,
        caseId
      });
      return notification;
    } catch (error) {
      console.error('Error creating notification:', error);
      throw error;
    }
  }
  static async notifyDiagnosisReady(parentId, caseId, childName) {
    return await this.create(
      parentId,
      'diagnosis_ready',
      'Diagnosis Ready',
      `The diagnosis for ${childName} is ready. Please check your cases.`,
      caseId
    );
  }
  static async notifyAdditionalTestRequested(parentId, caseId, childName, testType) {
    return await this.create(
      parentId,
      'additional_test_requested',
      'Additional Test Requested',
      `The doctor has requested an additional test (${testType}) for ${childName}.`,
      caseId
    );
  }  
  static async notifyNewCase(caseId, childName, gravityScore) {
    const User = require('../models/User');
    const doctors = await User.find({ userType: 'doctor' });
    const notifications = doctors.map(doctor => 
      this.create(
        doctor._id,
        'new_case',
        'New Case Available',
        `A new ${gravityScore} severity case for ${childName} is available.`,
        caseId
      )
    );
    return await Promise.all(notifications);
  }  
  static async notifyTestResponseSubmitted(doctorId, caseId, childName) {
    return await this.create(
      doctorId,
      'test_response_submitted',
      'Test Response Received',
      `${childName}'s parent has submitted the additional test response.`,
      caseId
    );
  }  
  static async getUserNotifications(userId, unreadOnly = false) {
    const query = { userId };
    if (unreadOnly) {
      query.isRead = false;
    }   
    return await Notification.find(query)
      .populate('caseId', 'childFirstName childLastName')
      .sort({ createdAt: -1 })
      .limit(50);
  }  
  static async markAsRead(notificationId) {
    return await Notification.findByIdAndUpdate(
      notificationId,
      { isRead: true },
      { new: true }
    );
  }  
  static async markAllAsRead(userId) {
    return await Notification.updateMany(
      { userId, isRead: false },
      { isRead: true }
    );
  }
  static async getUnreadCount(userId) {
    return await Notification.countDocuments({ userId, isRead: false });
  }
}
module.exports = NotificationService;