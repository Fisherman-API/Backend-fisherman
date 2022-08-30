const jwt = require('jsonwebtoken');

module.exports = async (req, res, next) => {
    try {

        const cookie = req.cookie[process.env.COOKIE_NAME];
        if (!cookie) throw new Error('Access denied, you must be signed in to continue');
        const user = jwt.verify(cookie, process.env.JWT_SECRET);
        req.user = user;
        next();
    } catch (error) {
        error.status = 401;
    next(error);
}; 
};