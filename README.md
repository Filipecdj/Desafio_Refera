# Desafio de engenharia de dados da Refera!
O objetivo do desafio na minha visão, foi concluído com sucesso, utilizando um script `Python` e suas respectivas bilbiotecas `Pandas` e `SQLAlchemy`, foram suficientes para realizar a cópia e a carga de dados para o bd de destino `analytics`.

![Infra dos banco de dados](fluxo.png)

# Dificuldades
O desafio proposto, de certa forma, não apresenta um nível de complexidade grande, mas, como todo desafio existem impasses durante seu desenvolvimento. Meu principal empecilho do desafio foi, desenvolver um script em python que fornecesse o o `CREATE TABLE` das tabelas do bd `transactional`, ao longo de muitas pesquisas encontrei prováveis soluções para o tal objetivo. Analisando as possíveis soluções, decidi optar por utilizar um sript `.SQL` que cria as tabelas no bd `analytics`.

# Instruções de como executar o projeto
- Clonar o repositório `https://github.com/Filipecdj/Desafio_Refera.git`
- Executar o docker-compose 

Após isso, os dados serão ingeridos no bd `analytics`.

# Comentário
Gostaria de agradecer a oportunidade para a resolução do desafio proposto, obrigado :D