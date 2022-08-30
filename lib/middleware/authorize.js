const User = require('../models/User');

module.exports = async (req, next) => {
    try {
        const users = await User.getById(req.user.id);
        if (!users || users.id !== req.user.id) {
            throw new Error('Not authorized for this area');
        }
    } catch(error) {
        error.status = 403;
        next(error);
    }
}