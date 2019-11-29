# Selecionar o nome e o CPF dos clientes que fizeram a sugestão que possui ids 222, 223 e 224.
SELECT c.nome, c.cpf
FROM Sugestao s JOIN Cliente c ON s.id_cliente = c.id_cliente 
WHERE s.id_protocolo IN (222, 223, 224);

# Selecionar o nome dos produtos que saíram em uma quantidade igual ou maior que 30 em um só pedido.
SELECT DISTINCT p1.nome
FROM Produto p1 JOIN Pedido p2 ON p2.id_item = p1.id_item
WHERE p2.quantidade >= 30;

# Selecionar o id e o nome dos clientes que gastaram mais de 200 reais em um só pedido e o preço do pedido feito.
SELECT c.id_cliente, c.nome, p.preco
FROM Cliente c JOIN Pedido p ON p.id_cliente = c.id_cliente
WHERE p.preco > 200;

# Selecionar os ids dos estoques que pertençam às lojas que terminam seu nome com North, Center e South.
SELECT e.id
FROM Estoque e JOIN Loja l ON l.cnpj = e.cnpj
WHERE l.nome LIKE 'Waypoint Moda System%' AND (l.nome LIKE '%North' OR l.nome LIKE '%Center' OR l.nome LIKE '%South');

# Selecionar os ids dos clientes com status de pedido 'Finalizado' e o preço dos respectivos pedidos.
SELECT p.id_cliente, p.preco
FROM ListaDeVendas l JOIN Pedido p ON l.id_pedido = p.id_pedido
WHERE l.status = 'Finalizado';

# Selecionar o nome e o CNPJ dos fornecedores dos produtos de preços menores que 23.
SELECT DISTINCT f.nome, f.cnpj
FROM Fornecedor f JOIN Produto p ON p.cnpj_fornecedor = f.cnpj
WHERE p.cnpj_fornecedor = f.cnpj AND p.preco < 23;

# Selecionar o CNPJ de todas as lojas com estoque em Caicó
SELECT DISTINCT l.cnpj
FROM Loja l JOIN Estoque e ON e.cnpj = l.cnpj
WHERE e.local LIKE '%Caicó%';

# Selecionar os nomes de funcionários que constam como vendedores de 50 produtos em apenas uma nota fiscal.
SELECT DISTINCT f.nome
FROM Funcionario f JOIN Notafiscal nf ON nf.id_Funcionario = f.id_Funcionario
WHERE nf.quantidade = 50;

# Selecionar as quantidades de produtos vendidos nas notas fiscais 1, 6 e 7.
SELECT DISTINCT nf.id, nf.quantidade
FROM Notafiscal nf
WHERE nf.id IN (1, 6, 7);

# Selecionar o id do cliente responsável pela sugestão cujo id de protocolo é menor que 230.
SELECT DISTINCT s.id_protocolo,s.id_cliente
FROM Sugestao s
WHERE s.id_protocolo < 230;