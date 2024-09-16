
# FarmTech Solutions - Projeto de Agricultura Digital

## Visão Geral

A FarmTech Solutions está colaborando com uma fazenda focada em inovação e tecnologia para melhorar a produtividade, migrando para a Agricultura Digital. Este projeto consiste em um conjunto de aplicações para gerenciamento de dados agrícolas, análise estatística e integração com serviços meteorológicos, auxiliando na tomada de decisões e na gestão da fazenda.

### Componentes do Projeto

- **Aplicação Python (`app_farmtech.py`)**: Gerencia dados de cultivo, realiza cálculos básicos de manejo agrícola e permite operações CRUD (Criar, Ler, Atualizar, Deletar) sobre os dados de plantio.
- **Aplicação de Análise Estatística em R (`app_estatisticas.R`)**: Analisa os dados de cultivo e gera estatísticas básicas (ex: média, desvio padrão) a partir do arquivo CSV gerado pela aplicação Python.
- **Aplicação de Integração Meteorológica em R (`app_clima.R`)**: Busca dados meteorológicos em tempo real para uma cidade específica usando a API do OpenWeather e exibe as informações relevantes no terminal.

---

## Requisitos

### Aplicação Python (`app_farmtech.py`)

- Python 3.x
- Bibliotecas necessárias: `csv`, `os`, `sys`

### Aplicações em R (`app_estatisticas.R`, `app_clima.R`)

- R versão 4.x ou superior
- Pacotes R necessários:
  - `httr`
  - `jsonlite`

---

## Como Usar

### 1. Aplicação Python: `app_farmtech.py`

Essa aplicação Python gerencia a entrada, saída e gestão de dados de cultivo para dois tipos de culturas: **milho** e **café**. Ela permite:

- Inserir dados de plantio (tamanho da área, tipo de cultura, requisitos de insumos, etc.)
- Visualizar ou atualizar registros de plantio existentes
- Deletar registros
- Salvar os dados em um arquivo CSV

#### Como Executar:
```bash
python3 app_farmtech.py
```

### 2. Aplicação de Análise Estatística em R: `app_estatisticas.R`

Este script R lê o arquivo `dados_cultivo.csv` gerado pela aplicação Python e calcula estatísticas básicas como:

- Média
- Desvio padrão
- Mediana

#### Como Executar:
```bash
Rscript app_estatisticas.R
```

### 3. Aplicação de Integração Meteorológica em R: `app_clima.R`

Este script conecta-se à API do OpenWeather para obter dados meteorológicos em tempo real para qualquer cidade e exibe informações como:

- Temperatura atual
- Umidade
- Velocidade do vento
- Descrição das condições climáticas (ex: nublado, céu claro)

#### Como Executar:

Primeiro, defina sua chave de API do OpenWeather como uma variável de ambiente:
```bash
export OPENWEATHER_API_KEY="sua_chave_api_openweather"
```

Em seguida, execute o script passando o nome da cidade como argumento:
```bash
Rscript app_clima.R "São Paulo"
```

---

## Arquivos do Projeto

- **`app_farmtech.py`**: A principal aplicação Python para gerenciamento de dados de cultivo.
- **`dados_cultivo.csv`**: O arquivo CSV onde os dados de cultivo são armazenados.
- **`app_estatisticas.R`**: Script R para realizar análise estatística dos dados de cultivo.
- **`app_clima.R`**: Script R para obter e exibir dados meteorológicos usando a API OpenWeather.

---

## Instruções de Instalação

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/mstrazzini/farmtech.git
   cd farmtech
   ```

2. **Configurar dependências Python**:
   Certifique-se de que o Python 3 está instalado e execute o script Python diretamente.

3. **Configurar dependências R**:
   Instale os pacotes R necessários executando o seguinte no seu ambiente R:
   ```r
   install.packages("httr")
   install.packages("jsonlite")
   ```

4. **Definir a Chave de API do OpenWeather**:
   Defina a variável de ambiente `OPENWEATHER_API_KEY` para usar o script de clima:
   ```bash
   export OPENWEATHER_API_KEY="sua_chave_api_openweather"
   ```

---

## Exemplos de Uso

### Cenário 1: Gerenciamento de Dados de Cultivo
1. Execute a aplicação Python para gerenciar dados de cultivo (inserção, atualização, exclusão, etc.).
2. Os dados de cultivo serão salvos no arquivo `dados_cultivo.csv`.

### Cenário 2: Analisando Dados de Cultivo
1. Após inserir os dados de cultivo, execute o script `app_estatisticas.R` para analisar os dados e calcular métricas estatísticas.

### Cenário 3: Verificando Dados Meteorológicos
1. Use o script `app_clima.R` para buscar os dados meteorológicos de uma cidade específica, útil para tomar decisões em tempo real na fazenda.

---

## Licença

Este projeto é de **licença privada**. A reprodução, redistribuição ou modificação dos materiais contidos neste repositório só são permitidas mediante autorização prévia e expressa dos proprietários do projeto.

---

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests ou abrir issues. Certifique-se de que qualquer nova funcionalidade ou alteração venha acompanhada de documentação e testes apropriados.

---

## Contato

Em caso de dúvidas ou para mais informações, entre em contato com os mantenedores do projeto através do repositório no GitHub.
