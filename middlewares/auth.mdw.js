import jwt from 'jsonwebtoken';
export default function (req,res,next){
  const accessToken = req.headers['x-access-token'];
  if(accessToken){
    try {
      const decode = jwt.verify(accessToken,'SECRET_KEY');
      const accessTokenPayload = decode;
      next();
    } catch (error) {
      console.log(error);
      return res.status(401).json({
        message: 'Invalid accessToken'
      });
    }
  }else{
    return res.status(401).json({
      message: 'AccessToken not found'
    })
  }
}