-- 1. Valor total das vendas e dos fretes por produto e ordem de venda:
SELECT Dimensoes_DadosModelagem.ProdutoID, 
       SUM(FatoDetalhes.Valor) AS total_vendas, 
       SUM(Dimensoes_DadosModelagem.ValorFrete) AS total_fretes
FROM FatoDetalhes
JOIN Dimensoes_DadosModelagem ON FatoDetalhes.CupomID = Dimensoes_DadosModelagem.CupomID
GROUP BY Dimensoes_DadosModelagem.ProdutoID;

-- 2. Valor de venda por tipo de produto:
SELECT tipo_produto, SUM(valor_venda) AS total_vendas
FROM Dimensoes_DadosModelagem
JOIN FatoDetalhes ON Dimensoes_DadosModelagem.produto = FatoDetalhes.produto
GROUP BY tipo_produto;

-- 3. Quantidade e valor das vendas por dia, mês, ano:
SELECT YEAR(data_venda) AS ano, MONTH(data_venda) AS mes, DAY(data_venda) AS dia,
       COUNT(*) AS quantidade_vendas, SUM(valor_venda) AS total_vendas
FROM FatoDetalhes
GROUP BY YEAR(data_venda), MONTH(data_venda), DAY(data_venda);

-- 4. Lucro dos meses:
SELECT YEAR(data_venda) AS ano, MONTH(data_venda) AS mes,
       SUM(valor_venda - custo_produto - valor_frete) AS lucro
FROM FatoDetalhes
GROUP BY YEAR(data_venda), MONTH(data_venda);

-- 5. Venda por produto:
SELECT produto, COUNT(*) AS quantidade_vendas, SUM(valor_venda) AS total_vendas
FROM FatoDetalhes
GROUP BY produto;

-- 6. Venda por cliente, cidade do cliente e estado:
SELECT cliente, cidade_cliente, estado_cliente, COUNT(*) AS quantidade_vendas, SUM(valor_venda) AS total_vendas
FROM FatoDetalhes
GROUP BY cliente, cidade_cliente, estado_cliente;

-- 7. Média de produtos vendidos:
SELECT AVG(quantidade_produtos) AS media_produtos_vendidos
FROM FatoDetalhes;

-- 8. Média de compras que um cliente faz:
SELECT AVG(numero_compras) AS media_compras_por_cliente
FROM Dimensoes_DadosModelagem;


