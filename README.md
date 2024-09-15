# FarmTech Solutions - Agricultura Digital com Análise Climática

## Descrição do Projeto

Este projeto é uma solução desenvolvida pela **FarmTech Solutions** para uma fazenda que investe em inovação e tecnologia para aumentar a produtividade de suas culturas, migrando para a **Agricultura Digital**. A solução consiste em uma aplicação Python para gerenciar os dados de plantio, calcular métricas de produtividade e exportar os dados para análise em R. Além disso, uma aplicação R se conecta a uma API meteorológica pública para coletar dados climáticos, processá-los e exibi-los no terminal.

### Funcionalidades da Aplicação:

1. **Gestão de Dados de Cultivo** (Python):

   - Suporte a dois tipos de culturas: **Milho** e **Café**.
   - Cálculo da área de plantio.
   - Cálculo de manejo de insumos com base na cultura e no tamanho da área plantada.
   - Armazenamento dos dados em estruturas de vetores.
   - Menu interativo para:
     - Inserção de dados.
     - Visualização de dados.
     - Atualização de registros.
     - Deleção de registros.
     - Exportação de dados para arquivo CSV.
2. **Análise de Dados Climáticos** (R):

   - Conexão com a API meteorológica pública [OpenWeather](https://openweathermap.org/api) para coletar dados climáticos de qualquer cidade.
   - Exibição das seguintes informações meteorológicas no terminal:
     - Temperatura atual.
     - Umidade.
     - Descrição das condições climáticas.
     - Velocidade do vento.
   - Cálculo de estatísticas básicas como **média** e **desvio padrão** para os dados de plantio exportados do Python.

## Tecnologias Utilizadas

- **Python** (para a gestão de dados de cultivo)
  - Módulos principais: `csv`, `input/output` e `loops`
- **R** (para a análise climática e estatísticas)
  - Pacotes: `httr` para requisições HTTP, `jsonlite` para processar dados JSON
- **API Meteorológica**: [OpenWeather](https://openweathermap.org/api)

## Como Executar o Projeto

### Pré-requisitos

- **Python 3.x**: Certifique-se de ter o Python instalado. Caso não tenha, baixe [aqui](https://www.python.org/downloads/).
- **R**: Certifique-se de ter o R instalado. Caso não tenha, baixe [aqui](https://cran.r-project.org/mirrors.html).
- **Bibliotecas em Python**:
  - O projeto utiliza apenas bibliotecas padrão do Python.
- **Bibliotecas em R**:
  - Instale os pacotes necessários executando os seguintes comandos no R:
    ```r
    install.packages("httr")
    install.packages("jsonlite")
    ```

### Passo a Passo para Execução

#### 1. Execução da Aplicação Python

O código Python gerencia os dados de plantio e exporta as informações em CSV.

- **Clone o repositório**:

  ```bash
  git clone https://github.com/mstrazzini/farmtech.git
  cd farmtech
  ```
- **Execute o programa em Python**:

  ```bash
  python app_farmtech.py
  ```
- **Menu de opções**:

  - Escolha a opção "1" para inserir dados sobre uma cultura (Milho/Café).
  - Escolha a opção "2" para visualizar os dados inseridos.
  - Escolha a opção "3" para atualizar registros.
  - Escolha a opção "4" para deletar registros.
  - Escolha a opção "5" para exportar os dados para o arquivo CSV.
  - Escolha a opção "6" para sair.

O arquivo CSV será gerado no diretório do projeto com o nome `dados_cultivo.csv`.

#### 2. Execução da Aplicação R

A aplicação em R coleta dados meteorológicos e realiza cálculos estatísticos.

- **Defina sua chave da API OpenWeather**:

  - Obtenha uma chave de API gratuita em [OpenWeather](https://openweathermap.org/api) e substitua o valor `"SUA_API_KEY_AQUI"` no arquivo `app_clima.R` pela sua chave.
- **Execute o código R**:

  ```bash
  Rscript app_clima.R
  ```
- **Escolha uma cidade**:

  - O script solicitará o nome de uma cidade para coletar as informações meteorológicas. Insira o nome da cidade em português ou inglês (por exemplo, "São Paulo").
- **Exibição dos dados**:

  - Após a consulta, os dados climáticos serão exibidos diretamente no terminal.

#### 3. Análise de Dados Estatísticos (opcional)

- **Análise em R**:
  O arquivo CSV gerado pelo Python pode ser consumido em R para cálculos estatísticos, como média e desvio padrão.

  - Abra o R e execute o seguinte script:
    ```r
    # Leitura do arquivo CSV
    dados <- read.csv("dados_cultivo.csv")

    # Cálculo de estatísticas
    media_area <- mean(dados$area)
    desvio_area <- sd(dados$area)

    # Exibir os resultados
    cat("Média da área de plantio: ", media_area, "\n")
    cat("Desvio padrão da área de plantio: ", desvio_area, "\n")
    ```

## Arquitetura do Projeto

```plaintext
farmtech/
│
├── app_farmtech.py        # Código Python para gerenciar dados de plantio e exportar CSV
├── app_clima.R            # Código R para coletar dados climáticos da API
├── dados_cultivo.csv      # Arquivo CSV exportado com os dados de cultivo (gerado dinamicamente)
├── README.md              # Documentação do projeto
└── .gitignore             # Arquivos a serem ignorados no repositório
```

## Melhorias Futuras

1. **Integração de Dados**: Conectar os dados climáticos com os dados de plantio, gerando insights e relatórios mais completos para os produtores.
2. **Interface Gráfica**: Implementar uma interface gráfica (usando Flask para Python ou Shiny para R) para visualização dos dados e geração de relatórios.
3. **Automação de Processos**: Automatizar a coleta de dados climáticos em intervalos regulares para acompanhar o impacto do clima nas safras.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir **Issues** ou enviar **Pull Requests** no repositório [FarmTech Solutions](https://github.com/mstrazzini/farmtech).
