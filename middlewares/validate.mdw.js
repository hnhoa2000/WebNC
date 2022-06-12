import Ajv from 'ajv';

export default function (schema) {
  return function validate(req, res, next) {
    console.log(req.body);
    const ajv = new Ajv();
    const valid = ajv.validate(schema, req.body);
    if (!valid) {
      return res.status(400).json(ajv.errors);
    }

    next();
  }
}