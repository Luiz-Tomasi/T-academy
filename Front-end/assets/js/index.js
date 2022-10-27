var produtos = [
    { id: 1, nome: "Bolacha", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 2, nome: "Biscoito", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 3, nome: "Fruta", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 4, nome: "Lanche", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 5, nome: "Chocolate", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 6, nome: "Pizza", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 7, nome: "Legume", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 8, nome: "Carne", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 9, nome: "Assado", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },
    { id: 10, nome: "Salgado", preco: 5.1, estoque: 10, segmento: "Alimentar" , un: 'SC' },

    { id: 11, nome: "Desinfetante", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 12, nome: "Esponja", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 13, nome: "Detergente", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 14, nome: "Sabão", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 15, nome: "Sabonete", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 16, nome: "Escova", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 17, nome: "Sabão em pó", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 18, nome: "Bombril", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 19, nome: "Água Sanitaria", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },
    { id: 20, nome: "Pano", preco: 5.1, estoque: 10, segmento: "Limpeza" , un: 'SC' },

    { id: 21, nome: "Calça", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 22, nome: "Sapato", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 23, nome: "Camiseta", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 24, nome: "Camisa", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 25, nome: "Vestido", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 26, nome: "Saia", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 27, nome: "Tenis", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 28, nome: "Casaco", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 29, nome: "Moletom", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
    { id: 30, nome: "Shorts", preco: 5.1, estoque: 10, segmento: "Vestuario" , un: 'SC' },
]

produtos = JSON.stringify(produtos)
localStorage.setItem("produtos", produtos)



function mostrarTabelaPorTermo(){
    
    let termo = document.getElementById("busca").value

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtosPorTermo = []

    for(let i = 0; i < produtos.length; i++){
        if(produtos[i].nome.indexOf(termo) != -1){
            produtosPorTermo.push(produtos[i])
            console.log(produtos[i].nome)
        }
    }


    var txt = ''
    for (let i = 0; i < produtosPorTermo.length; i++) {
            txt += `<tr>
            <td>${produtosPorTermo[i].id}</td>
            <td>${produtosPorTermo[i].nome}</td>
            <td>${produtosPorTermo[i].preco}</td>
            <td>${produtosPorTermo[i].estoque}</td>
            <td>${produtosPorTermo[i].segmento}</td>
            <td>${produtosPorTermo[i].un}</td>
            <td>Editar</td>
            <td>Deletar</td>
        </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;

}


function mostrarTabela() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let idUsados = []

    var txt = ''
    for (let i = 0; i < 12; i++) {
        let idAleatorio = getRandomNumber()
        if(idEmUso(idAleatorio, idUsados) == false){
            idUsados.push(idAleatorio)

            txt += `<tr>
                <td>${produtos[idAleatorio].id}</td>
                <td>${produtos[idAleatorio].nome}</td>
                <td>${produtos[idAleatorio].preco}</td>
                <td>${produtos[idAleatorio].estoque}</td>
                <td>${produtos[idAleatorio].segmento}</td>
                <td>${produtos[idAleatorio].un}</td>
                <td>Editar</td>
                <td>Deletar</td>
            </tr>`
        } else {
            i--
        }
        
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function idEmUso(idAleatorio, idUsados){
    for(let i = 0; i < 12; i++){
        if(idAleatorio == idUsados){
            return true
        }
    }
    return false
}
function getRandomNumber(){
    return Math.floor(Math.random() * (parseInt(produtos.length-1) - parseInt(0) + 1)) + parseInt(0);
}