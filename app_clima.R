# Certifique-se de carregar os pacotes necessários
library(httr)
library(jsonlite)

# Função para consultar dados climáticos de uma API pública
obter_dados_meteorologicos <- function(cidade, api_key) {
  # URL da API (OpenWeather como exemplo)
  url <- paste0("http://api.openweathermap.org/data/2.5/weather?q=", cidade, "&appid=", api_key, "&units=metric&lang=pt_br")
  
  # Fazer a requisição HTTP para a API
  resposta <- GET(url)
  
  # Verificar se a requisição foi bem-sucedida (status 200)
  if (status_code(resposta) != 200) {
    stop("Erro ao conectar-se à API meteorológica.")
  }
  
  # Processar o conteúdo JSON da resposta
  dados <- fromJSON(content(resposta, as = "text", encoding = "UTF-8"))
  
  # Extrair informações relevantes
  cidade_nome <- dados$name
  temperatura <- dados$main$temp
  umidade <- dados$main$humidity
  descricao <- dados$weather[[1]]$description
  vento_velocidade <- dados$wind$speed
  
  # Retornar uma lista com os dados processados
  return(list(
    cidade = cidade_nome,
    temperatura = temperatura,
    umidade = umidade,
    descricao = descricao,
    vento_velocidade = vento_velocidade
  ))
}

# Função para exibir os dados meteorológicos no terminal
exibir_dados_meteorologicos <- function(dados) {
  cat("Informações Meteorológicas para a cidade de", dados$cidade, ":\n")
  cat("Temperatura: ", dados$temperatura, "°C\n")
  cat("Umidade: ", dados$umidade, "%\n")
  cat("Condições: ", dados$descricao, "\n")
  cat("Velocidade do vento: ", dados$vento_velocidade, "m/s\n")
}

# Função principal
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  
  if (length(args) == 0) {
    stop("Por favor, forneça o nome da cidade como argumento.")
  }
  
  cidade <- args[1]
  
  # Defina sua chave da API (obtenha do OpenWeather ou outra API meteorológica)
  api_key <- Sys.getenv("OPENWEATHER_API_KEY")  # Certifique-se de configurar essa variável de ambiente
  
  # Verificar se a chave foi obtida corretamente
  if (api_key == "") {
    stop("A chave da API OpenWeather não foi encontrada. Defina a variável de ambiente OPENWEATHER_API_KEY.")
  }
  
  # Obter dados meteorológicos
  dados <- obter_dados_meteorologicos(cidade, api_key)
  
  # Exibir os dados no terminal
  exibir_dados_meteorologicos(dados)
}

# Executar a aplicação
main()
