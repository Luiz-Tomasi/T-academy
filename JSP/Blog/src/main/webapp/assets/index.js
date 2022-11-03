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

function trocarPag(){
    document.location.href = "http://localhost:8080";
}

function verificaUsuario(){
    if(sessionStorage.getItem('email') != null && sessionStorage.getItem('senha') != null){
        document.getElementById("enviarComentario").submit();
        console.log("ta indo?")
    } else{
        document.location.href = "http://localhost:8080/LoginCadastro.jsp";
        console.log("era para ir")
    }
    console.log("oi")
}
