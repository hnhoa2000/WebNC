import db from '../utils/db.js'
import generate from './generic.model.js';
let userModel = generate('user', 'userId');

userModel.findByUsername = async function (username) {
    const rows = await db('user').where('username', username);
    if (rows.length === 0) {
        return null;
    }

    return rows[0];
}

userModel.isValidRefreshToken = async function (userId, refreshToken) {
    const rows = await db('user').where('id', userId).andWhere('rfToken', refreshToken);
    if (rows.length === 0) {
        return false;
    }

    return true;
}

export default userModel;