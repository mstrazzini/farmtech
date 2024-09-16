# Certifique-se de carregar os pacotes necessários
library(httr)
library(jsonlite)

# Função para obter as coordenadas de uma cidade usando a API de Geocoding do OpenWeather
obter_coordenadas <- function(cidade, api_key) {
  # Codificar o nome da cidade para URL
  cidade_codificada <- URLencode(cidade, reserved = TRUE)
  
  # URL para a API de geocoding
  url_geo <- paste0("https://api.openweathermap.org/geo/1.0/direct?q=", cidade_codificada, "&limit=1&appid=", api_key)
  
  resposta_geo <- GET(url_geo)
  
  if (status_code(resposta_geo) != 200) {
    stop("Erro ao obter as coordenadas da cidade. Verifique se a API Key está correta.")
  }
  
  # Processar o conteúdo JSON da resposta
  dados_geo <- fromJSON(content(resposta_geo, as = "text", encoding = "UTF-8"))
  
  # Verificar se os dados retornados são válidos
  if (nrow(dados_geo) == 0) {
    stop("Cidade não encontrada ou erro na resposta da API. Verifique o nome da cidade.")
  }
  
  # Retornar latitude e longitude diretamente das colunas da data frame
  return(list(lat = dados_geo$lat[1], lon = dados_geo$lon[1]))
}

# Função para consultar dados climáticos da One Call API 3.0
obter_dados_meteorologicos <- function(lat, lon, api_key) {
  # URL da One Call API 3.0 (com latitude e longitude)
  url <- paste0("https://api.openweathermap.org/data/3.0/onecall?lat=", lat, "&lon=", lon, "&units=metric&lang=pt_br&appid=", api_key)
  
  resposta <- GET(url)
  
  # Verificar se a requisição foi bem-sucedida (status 200)
  if (status_code(resposta) != 200) {
    stop("Erro ao conectar-se à API meteorológica.")
  }
  
  # Processar o conteúdo JSON da resposta
  dados <- fromJSON(content(resposta, as = "text", encoding = "UTF-8"))

  # Verificar se o campo "current" existe
  if (is.null(dados$current)) {
    stop("Dados meteorológicos não disponíveis. Verifique se a API está configurada corretamente.")
  }

  # Verificar se "weather" está presente e é uma data frame
  if (is.null(dados$current$weather) || !is.data.frame(dados$current$weather)) {
    stop("Dados de clima (weather) não disponíveis. Verifique a estrutura da resposta da API.")
  }
  
  # Extrair informações relevantes
  temperatura <- dados$current$temp
  umidade <- dados$current$humidity
  descricao <- dados$current$weather$description[1]  # Acessar como data frame
  vento_velocidade <- dados$current$wind_speed
  
  return(list(
    temperatura = temperatura,
    umidade = umidade,
    descricao = descricao,
    vento_velocidade = vento_velocidade
  ))
}

# Função para exibir os dados meteorológicos no terminal
exibir_dados_meteorologicos <- function(cidade, dados) {
  cat("Informações Meteorológicas para a cidade de", cidade, ":\n")
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
  
  # Obter latitude e longitude da cidade
  coordenadas <- obter_coordenadas(cidade, api_key)
  
  # Somente seguir se as coordenadas forem válidas
  if (!is.null(coordenadas$lat) && !is.null(coordenadas$lon)) {
    dados <- obter_dados_meteorologicos(coordenadas$lat, coordenadas$lon, api_key)
  } else {
    stop("As coordenadas não foram obtidas corretamente.")
  }
  
  # Exibir os dados no terminal
  exibir_dados_meteorologicos(cidade, dados)
}

# Executar a aplicação
main()
