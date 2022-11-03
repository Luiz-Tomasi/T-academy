var logado = 0;
function estaLogado(email, senha){
    if(sessionStorage.getItem('email') == email && sessionStorage.getItem('senha') == senha){
        console.log("logado")
        logado = 1
        document.location.href = "http://localhost:8080";
    } else {
        console.log("Não ta logado")
        logado = 0
    }

}
