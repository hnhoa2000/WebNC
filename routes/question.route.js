import express from 'express';
//import { readFile } from 'fs/promises';
//import validate from '../middlewares/validate.mdw.js';
import questionModel from '../models/question.model.js';
import userModel from '../models/user.model.js';
import auth from '../middlewares/auth.mdw.js';

//const schema = JSON.parse(await readFile(new URL('../schemas/quiz.json', import.meta.url)));
const router = express.Router();

router.get('/:quizId', auth, async function (req, res) {
    const ret = await questionModel.findByQuizid(req.params.quizId);
    const user = await userModel.findById(req.payloadToken.userId);
    if (!user.isTeacher) {
        res.status(401).json({
            message: "invalid access"
        });
    } else {
        res.status(201).json({
            questions: ret
        });
    }
});

export default router;