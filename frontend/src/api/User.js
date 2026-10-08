import axios from "../utils/request"

export function login(user){ 
    return axios.post("/login",user.value)
}

export function isValidToken(token){
    return axios.get("/token/isValid",{params:{token:token}})
}
