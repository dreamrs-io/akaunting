import axios from "axios";
import { apiUrl } from "./variables";

 function isCookieSet(cookieName) {
    const cookies = document.cookie.split(';').map(cookie => cookie.trim());
  
    for (const cookie of cookies) {
      const [name, value] = cookie.split('=');
      if (name === cookieName) {
        return true;
      }
    }
  
    return false;
  }


 async function verifyPassword(email,password){

    console.log(email,password)
    const base64EncodedEmaiPassword = btoa(email+':'+password);


    // const authToken= 'Basic YWRtaW5AY29tcGFueS5jb206MTIzNDU2'
    const authToken= base64EncodedEmaiPassword
    console.log(authToken)
                            

    try {
        const res = await axios.get(apiUrl+'/ping',{
            headers:{
                Authorization: authToken,
            }
        })
        if (res.data.status=='ok'){
            return { status:true , token:authToken }
        }
    } catch (error) {
        
        return { status:false  }
    }

  }






export {
    isCookieSet,verifyPassword
}