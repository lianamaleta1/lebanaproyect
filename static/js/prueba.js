const alph="abcdefghijklmnopqrstuvwxyz0123456789"
function Gneratepass(lenght=10){
    let result="";
    for ( let i = 0; i<= lenght; i++ ){
        result += alph.charAt(Math.floor(Math.random() * alph.length))

    }

    return result;
}
const pass =Gneratepass(20);
console.log(pass);