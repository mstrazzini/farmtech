# Carregar os dados do arquivo CSV
carregar_dados <- function(arquivo_csv) {
  if (!file.exists(arquivo_csv)) {
    stop(paste("O arquivo", arquivo_csv, "não foi encontrado."))
  }
  
  dados <- read.csv(arquivo_csv)
  return(dados)
}

# Função para calcular estatísticas básicas (média, desvio padrão, variância)
calcular_estatisticas <- function(dados) {
  estatisticas <- list(
    media_area = mean(dados$area),
    desvio_padrao_area = sd(dados$area),
    variancia_area = var(dados$area),
    media_manejo = mean(dados$manejo),
    desvio_padrao_manejo = sd(dados$manejo),
    variancia_manejo = var(dados$manejo)
  )
  
  return(estatisticas)
}

# Função para exibir as estatísticas calculadas
exibir_estatisticas <- function(estatisticas) {
  cat("Estatísticas para a área de plantio:\n")
  cat("Média: ", estatisticas$media_area, " metros quadrados\n")
  cat("Desvio Padrão: ", estatisticas$desvio_padrao_area, " metros quadrados\n")
  cat("Variância: ", estatisticas$variancia_area, " metros quadrados\n\n")
  
  cat("Estatísticas para o manejo de insumos:\n")
  cat("Média: ", estatisticas$media_manejo, " litros\n")
  cat("Desvio Padrão: ", estatisticas$desvio_padrao_manejo, " litros\n")
  cat("Variância: ", estatisticas$variancia_manejo, " litros\n")
}

# Função principal para execução
main <- function() {
  # Defina o nome do arquivo CSV gerado pelo programa Python
  arquivo_csv <- "dados_cultivo.csv"
  
  # Carregar os dados
  dados <- carregar_dados(arquivo_csv)
  
  # Calcular as estatísticas
  estatisticas <- calcular_estatisticas(dados)
  
  # Exibir as estatísticas
  exibir_estatisticas(estatisticas)
}

# Executar o script
main()
