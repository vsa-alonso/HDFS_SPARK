# HDFS_SPARK

Neste trabalho foi feita uma analise exploratória de dados e desenhada uma pipeline que faça a extração dos dados, suas transformações e carregue em arquivos finais. A base escolhida foi a Steam Games Dataset, contendo o numero de jogos vendidos, com as classificações de empresa, plataforma, geração, etc. A base esta disponivel em:
 - https://data.world/mhoangvslev/steam-games-dataset

Como o download dos dados necessitava de autenticação por email, para obter a base através de bashscript, foi feito um upload dos datasets em:
- https://drive.google.com/drive/u/0/folders/1LZIi7ViTizsI_7cGGtAh1AIV6xL0-59t

A base contem uma tabela fato chamada "vgsales" que traz os volumes de venda por jogo, e 3 tabelas dimensões: publisher, platform e developer.

O fluxo de trabalho envolveu primeiro rodar o script file_download.sh, que fez o download dos datasets:

```
#! /bin/bash

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ws8ICcRZdsPg5RFvUayjq2wQE0ptqUGw' -O 'developper.csv'
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aL-RQddaDXjAoJEtr1I3supUZ3ong97z' -O 'publisher.csv'
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1B_4PKpVjonxRLOmu1TZB2sSHk4bbOLff' -O 'plateform.csv'
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=197yIvmlvbZ_Uvxp4FJvCn2pQYVfHdNCh' -O 'vgsales.csv'
```

Na sequencia acionamos o script hdfs_transfer.sh, que criou a estrutura de pastas dentro do hadoop e fez a transferencia dos datasets para cada pasta corretamente:

```
#! /bin/bash/

hadoop fs -mkdir /proj_spark/
hadoop fs -mkdir /proj_spark/developper/
hadoop fs -mkdir /proj_spark/publisher/
hadoop fs -mkdir /proj_spark/plateform/
hadoop fs -mkdir /proj_spark/vgsales/

hadoop fs -put -f /proj_spark/developper.csv /proj_spark/developper
hadoop fs -put -f /proj_spark/publisher.csv /proj_spark/publisher
hadoop fs -put -f /proj_spark/plateform.csv /proj_spark/plateform
hadoop fs -put -f /proj_spark/vgsales.csv /proj_spark/vgsales
```

Tendo os datasets preparados, acionamos a imagem jupyter-spark com o comando

```
docker exec -it jupyter-spark bash
```

E então realizamos as analises existentes no arquivo .ipynb.

Com uma compreensão da base, foram estabelecidas as seguintes perguntas.
  

3 Perguntas feitas:

- Qual o genero de jogo mais vendido por ano?
- Quais os 3 jogos mais vendidos por ano por região?
- Quais os 5 jogos mais vendidos por plataforma?

Por fim, foi desenvolvido um arquivo .py que gerou tabelas que sejam capazes de responder às perguntas.

