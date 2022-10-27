function iniciarVariaveis(){
    var id = ''
    var nome = ''
    var preco = 0
    var estoque = 0
    var segmento = ''
    var un = '' 

    var produtos = []
    if (localStorage.getItem('produtos')){
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }
}