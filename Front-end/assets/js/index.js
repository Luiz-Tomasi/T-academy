if (localStorage.length > 0) { } else {

    var carrinho = [{ id: 1, idProduto: 1, quantidade: 1 }]
    carrinho = JSON.stringify(carrinho)
    localStorage.setItem("carrinho", carrinho)

    var filtro = [{ atual: "Aleatorio" }]
    filtro = JSON.stringify(filtro)
    localStorage.setItem("filtros", filtro)

    var produtos = [
        { id: 0, nome: "Bolacha", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 1, nome: "Biscoito", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 2, nome: "Fruta", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 3, nome: "Lanche", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 4, nome: "Chocolate", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 5, nome: "Pizza", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 6, nome: "Legume", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 7, nome: "Carne", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 8, nome: "Assado", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },
        { id: 9, nome: "Salgado", preco: 5.1, estoque: 10, segmento: "Alimentar", un: 'SC' },

        { id: 10, nome: "Desinfetante", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 11, nome: "Esponja", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 12, nome: "Detergente", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 13, nome: "Sabão", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 14, nome: "Sabonete", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 15, nome: "Escova", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 16, nome: "Sabão em pó", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 17, nome: "Bombril", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 18, nome: "Água Sanitaria", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },
        { id: 19, nome: "Pano", preco: 5.1, estoque: 10, segmento: "Limpeza", un: 'SC' },

        { id: 20, nome: "Calça", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 21, nome: "Sapato", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 22, nome: "Camiseta", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 23, nome: "Camisa", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 24, nome: "Vestido", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 25, nome: "Saia", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 26, nome: "Tenis", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 27, nome: "Casaco", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 28, nome: "Moletom", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
        { id: 29, nome: "Shorts", preco: 5.1, estoque: 10, segmento: "Vestuario", un: 'SC' },
    ]

    produtos = JSON.stringify(produtos)
    localStorage.setItem("produtos", produtos)
}

var idUsados = []


function salvarFiltro(element) {
    if (localStorage.getItem('filtro') != null) {
        var filtro = JSON.parse(localStorage.getItem('filtro'))
    }

    let filtroAtual = element.value

    filtroAtual = JSON.stringify(filtroAtual)
    localStorage.setItem("filtros", filtroAtual)
}

function mostrarCarrinho() {
    if (localStorage.getItem('carrinho') != null) {
        carrinho = JSON.parse(localStorage.getItem('carrinho'))
    }

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let total = 0
    var txtCarrinho = ''
    for (let i = 0; i < carrinho.length; i++) {
        txtCarrinho += `<tr id="${carrinho[i].idProduto}">
            <td onclick="addCarrinho(this)" id="${carrinho[i].idProduto}"> ${produtos[carrinho[i].idProduto].nome}</td>
            <td onclick="addCarrinho(this)" id="${carrinho[i].idProduto}">${produtos[carrinho[i].idProduto].preco}</td>
            <td><input onchange="manipularQuantidadeCarrinho(this)" id="${carrinho[i].idProduto}" type="number" value="${carrinho[i].quantidade}"></td>
            <td>${produtos[carrinho[i].idProduto].segmento}</td>
            <td onclick="delProdutoFromCarrinho(this)" id="${carrinho[i].idProduto}">Deletar</td>
        </tr>`

        total += parseFloat(produtos[carrinho[i].idProduto].preco) * parseFloat(carrinho[i].quantidade)
    }


    document.getElementById("total").innerHTML = total.toFixed(2)
    document.getElementsByTagName('tbody')[1].innerHTML = txtCarrinho;
}


function manipularQuantidadeCarrinho(produto) {
    let valor = parseFloat(produto.value)

    if (localStorage.getItem('carrinho') != null) {
        carrinho = JSON.parse(localStorage.getItem('carrinho'))
    }

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtoEncontrado = 0
    let antigoEstoque = 0
    let antigaQuantidade = 0
    for (let i = 0; i < carrinho.length; i++) {
        if (produto.id == carrinho[i].idProduto) {
            produtoEncontrado = 1

            if (produtoEncontrado == 1) {

                antigaQuantidade = carrinho[i].quantidade;
                antigoEstoque = produtos[produto.id].estoque;

                if (carrinho[i].quantidade < valor) {
                    produtos[produto.id].estoque = produtos[produto.id].estoque - parseInt(valor - carrinho[i].quantidade)
                } else {
                    produtos[produto.id].estoque = produtos[produto.id].estoque + parseInt(carrinho[i].quantidade) - parseInt(valor)
                }
                carrinho[i].quantidade = valor
            }

            if (produtoEncontrado == 1 && produtos[produto.id].estoque < 0) {
                produtos[produto.id].estoque = antigoEstoque
                carrinho[i].quantidade = antigaQuantidade

                Toastify({

                    text: "Não tem estoque o suficiente para essa operação",

                    duration: 3000

                }).showToast();
            } else if (produtoEncontrado == 1 && carrinho[i].quantidade < 0) {
                produtos[produto.id].estoque = antigoEstoque
                carrinho[i].quantidade = antigaQuantidade

                Toastify({

                    text: "Não tem quantidade o suficiente para essa operação",

                    duration: 3000

                }).showToast();
            }
        }
    }



    carrinho = JSON.stringify(carrinho)
    localStorage.setItem("carrinho", carrinho)
    produtos = JSON.stringify(produtos)
    localStorage.setItem("produtos", produtos)

    mostrarCarrinho()
    atualizarTabelaAleatoria()
}

function delProdutoFromCarrinho(produto) {
    if (localStorage.getItem('carrinho') != null) {
        carrinho = JSON.parse(localStorage.getItem('carrinho'))
    }

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let deletado = 0
    for (let i = 0; i < carrinho.length; i++) {
        if (carrinho[i].idProduto == produto.id) {
            produtos[produto.id].estoque += carrinho[i].quantidade
            carrinho.splice(i, 1)
            deletado = 1
        }
    }

    if (deletado == 0) {
        Toastify({

            text: "Produto não encontrado no carrinho",

            duration: 3000

        }).showToast();
    }

    carrinho = JSON.stringify(carrinho)
    localStorage.setItem("carrinho", carrinho)
    produtos = JSON.stringify(produtos)
    localStorage.setItem("produtos", produtos)

    mostrarCarrinho()
}

function addCarrinho(produto) {

    if (localStorage.getItem('carrinho') != null) {
        carrinho = JSON.parse(localStorage.getItem('carrinho'))
    }

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtoNoCarrinho = 0
    let lastIdPlusOne = 0
    for (let i = 0; i < carrinho.length; i++) {
        if (produto.id == carrinho[i].idProduto) {
            if (produtos[produto.id].estoque >= 1) {
                carrinho[i].quantidade += 1;
                produtos[produto.id].estoque -= 1;
                produtoNoCarrinho += 1
            } else {
                Toastify({

                    text: "Estoque insuficiente",

                    duration: 3000

                }).showToast();
                produtoNoCarrinho += 1
            }
            lastIdPlusOne = i + 1
        }
    }

    if (produtoNoCarrinho == 0) {
        if (parseInt(produtos[produto.id].estoque) > parseInt(0)) {
            let newProdutoCarrinho = { id: lastIdPlusOne, idProduto: produto.id, quantidade: 1 }
            carrinho.push(newProdutoCarrinho)
        } else {
            Toastify({

                text: "Estoque insuficiente",

                duration: 3000

            }).showToast();
        }

    }

    carrinho = JSON.stringify(carrinho)
    localStorage.setItem("carrinho", carrinho)
    produtos = JSON.stringify(produtos)
    localStorage.setItem("produtos", produtos)

    mostrarCarrinho()
}

function atualizarTabelaAleatoria() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    var txt = ''
    for (let i = 0; i < 12; i++) {
        txt += `<tr onclick="addCarrinho(this)" id="${produtos[idUsados[i]].id}">
                <td>${produtos[idUsados[i]].id}</td>
                <td>${produtos[idUsados[i]].nome}</td>
                <td>${produtos[idUsados[i]].preco}</td>
                <td>${produtos[idUsados[i]].estoque}</td>
                <td>${produtos[idUsados[i]].segmento}</td>
                <td>${produtos[idUsados[i]].un}</td>
                <td>Deletar</td>
            </tr>`
    }

    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function mostrarTabela() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    idUsados = []

    var txt = ''
    for (let i = 0; i < 12; i++) {
        let idAleatorio = getRandomNumber()
        if (idEmUso(idAleatorio, idUsados) == false) {
            idUsados.push(idAleatorio)

            txt += `<tr onclick="addCarrinho(this)" id="${produtos[idAleatorio].id}">
                <td>${produtos[idAleatorio].id}</td>
                <td>${produtos[idAleatorio].nome}</td>
                <td>${produtos[idAleatorio].preco}</td>
                <td>${produtos[idAleatorio].estoque}</td>
                <td>${produtos[idAleatorio].segmento}</td>
                <td>${produtos[idAleatorio].un}</td>
                <td>Deletar</td>
            </tr>`
        } else {
            i--
        }

    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function mostrarTabelaPorTermo() {

    let termo = document.getElementById("busca").value

    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtosPorTermo = []

    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].nome.indexOf(termo) != -1) {
            produtosPorTermo.push(produtos[i])
        }
    }


    var txt = ''
    for (let i = 0; i < produtosPorTermo.length; i++) {
        txt += `<tr onclick="addCarrinho(this)" id="${produtosPorTermo[i].id}">
            <td>${produtosPorTermo[i].id}</td>
            <td>${produtosPorTermo[i].nome}</td>
            <td>${produtosPorTermo[i].preco}</td>
            <td>${produtosPorTermo[i].estoque}</td>
            <td>${produtosPorTermo[i].segmento}</td>
            <td>${produtosPorTermo[i].un}</td>
            <td>Deletar</td>
        </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;

}

function mostrarPorAlimentar() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtosPorAlimentar = []

    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].segmento.indexOf("Alimentar") != -1) {
            produtosPorAlimentar.push(produtos[i])
        }
    }

    var txt = ''
    for (let i = 0; i < produtosPorAlimentar.length; i++) {
        txt += `<tr onclick="addCarrinho(this)" id="${produtosPorAlimentar[i].id}">
            <td>${produtosPorAlimentar[i].id}</td>
            <td>${produtosPorAlimentar[i].nome}</td>
            <td>${produtosPorAlimentar[i].preco}</td>
            <td>${produtosPorAlimentar[i].estoque}</td>
            <td>${produtosPorAlimentar[i].segmento}</td>
            <td>${produtosPorAlimentar[i].un}</td>
            <td>Deletar</td>
        </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function mostrarPorLimpeza() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtosPorLimpeza = []

    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].segmento.indexOf("Limpeza") != -1) {
            produtosPorLimpeza.push(produtos[i])
        }
    }

    var txt = ''
    for (let i = 0; i < produtosPorLimpeza.length; i++) {
        txt += `<tr onclick="addCarrinho(this)" id="${produtosPorLimpeza[i].id}">
            <td>${produtosPorLimpeza[i].id}</td>
            <td>${produtosPorLimpeza[i].nome}</td>
            <td>${produtosPorLimpeza[i].preco}</td>
            <td>${produtosPorLimpeza[i].estoque}</td>
            <td>${produtosPorLimpeza[i].segmento}</td>
            <td>${produtosPorLimpeza[i].un}</td>
            <td>Deletar</td>
        </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function mostrarPorVestuario() {
    if (localStorage.getItem('produtos') != null) {
        produtos = JSON.parse(localStorage.getItem('produtos'))
    }

    let produtosPorVestuario = []

    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].segmento.indexOf("Vestuario") != -1) {
            produtosPorVestuario.push(produtos[i])
        }
    }

    var txt = ''
    for (let i = 0; i < produtosPorVestuario.length; i++) {
        txt += `<tr onclick="addCarrinho(this)" id="${produtosPorVestuario[i].id}">
            <td>${produtosPorVestuario[i].id}</td>
            <td>${produtosPorVestuario[i].nome}</td>
            <td>${produtosPorVestuario[i].preco}</td>
            <td>${produtosPorVestuario[i].estoque}</td>
            <td>${produtosPorVestuario[i].segmento}</td>
            <td>${produtosPorVestuario[i].un}</td>
            <td>Deletar</td>
        </tr>`
    }
    document.getElementsByTagName('tbody')[0].innerHTML = txt;
}

function idEmUso(idAleatorio, idUsados) {
    for (let i = 0; i < 12; i++) {
        if (idAleatorio == idUsados[i]) {
            return true
        }
    }
    return false
}
function getRandomNumber() {
    return Math.floor(Math.random() * (parseInt(produtos.length - 1) - parseInt(0) + 1)) + parseInt(0);
}