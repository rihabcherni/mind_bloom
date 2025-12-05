const NotificationService = require('../services/notificationService');
const getNotifications = async (req, res) => {
  try {
    const unreadOnly = req.query.unreadOnly === 'true';
    const notifications = await NotificationService.getUserNotifications(
      req.user._id,
      unreadOnly
    );
    res.json(notifications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
const getUnreadCount = async (req, res) => {
  try {
    const count = await NotificationService.getUnreadCount(req.user._id);
    res.json({ count });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
const markAsRead = async (req, res) => {
  try {
    const notification = await NotificationService.markAsRead(req.params.id);
    if (!notification) {
      return res.status(404).json({ message: 'Notification not found' });
    }
    res.json(notification);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
const markAllAsRead = async (req, res) => {
  try {
    await NotificationService.markAllAsRead(req.user._id);
    res.json({ message: 'All notifications marked as read' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getNotifications,
  getUnreadCount,
  markAsRead,
  markAllAsRead
};