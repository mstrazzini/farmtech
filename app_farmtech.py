import csv

# Definições iniciais
culturas = ['Milho', 'Café']
dados_milho = []
dados_cafe = []

# Funções para manipular os dados
def calcular_area(largura, comprimento):
    return largura * comprimento

def calcular_manejo_insumos(cultura, area):
    if cultura == 'Café':
        # Exemplo: 500 mL de fosfato por metro
        litros_por_metro = 0.5
        return area * litros_por_metro
    elif cultura == 'Milho':
        # Exemplo: 100 mL de insumo por metro
        litros_por_metro = 0.1
        return area * litros_por_metro
    else:
        return None

def entrada_dados():
    cultura = input("Digite a cultura (Milho/Café): ").capitalize()
    if cultura not in culturas:
        print("Cultura inválida. Tente novamente.")
        return

    largura = float(input("Digite a largura da área (em metros): "))
    comprimento = float(input("Digite o comprimento da área (em metros): "))
    
    area = calcular_area(largura, comprimento)
    manejo = calcular_manejo_insumos(cultura, area)

    dados = {
        'cultura': cultura,
        'largura': largura,
        'comprimento': comprimento,
        'area': area,
        'manejo': manejo
    }

    if cultura == 'Milho':
        dados_milho.append(dados)
    elif cultura == 'Café':
        dados_cafe.append(dados)

    print(f"Dados inseridos com sucesso para a cultura {cultura}!")

def saida_dados():
    cultura = input("Qual cultura deseja visualizar (Milho/Café)? ").capitalize()
    if cultura == 'Milho':
        for i, dado in enumerate(dados_milho):
            print(f"Registro {i+1}: {dado}")
    elif cultura == 'Café':
        for i, dado in enumerate(dados_cafe):
            print(f"Registro {i+1}: {dado}")
    else:
        print("Cultura inválida.")

def atualizar_dados():
    cultura = input("Qual cultura deseja atualizar (Milho/Café)? ").capitalize()
    if cultura == 'Milho':
        index = int(input("Qual o número do registro que deseja atualizar? ")) - 1
        if 0 <= index < len(dados_milho):
            largura = float(input("Nova largura (em metros): "))
            comprimento = float(input("Novo comprimento (em metros): "))
            area = calcular_area(largura, comprimento)
            manejo = calcular_manejo_insumos(cultura, area)
            dados_milho[index].update({'largura': largura, 'comprimento': comprimento, 'area': area, 'manejo': manejo})
            print("Dados atualizados com sucesso!")
        else:
            print("Índice inválido.")
    elif cultura == 'Café':
        index = int(input("Qual o número do registro que deseja atualizar? ")) - 1
        if 0 <= index < len(dados_cafe):
            largura = float(input("Nova largura (em metros): "))
            comprimento = float(input("Novo comprimento (em metros): "))
            area = calcular_area(largura, comprimento)
            manejo = calcular_manejo_insumos(cultura, area)
            dados_cafe[index].update({'largura': largura, 'comprimento': comprimento, 'area': area, 'manejo': manejo})
            print("Dados atualizados com sucesso!")
        else:
            print("Índice inválido.")
    else:
        print("Cultura inválida.")

def deletar_dados():
    cultura = input("Qual cultura deseja deletar os dados (Milho/Café)? ").capitalize()
    if cultura == 'Milho':
        index = int(input("Qual o número do registro que deseja deletar? ")) - 1
        if 0 <= index < len(dados_milho):
            dados_milho.pop(index)
            print("Dados deletados com sucesso!")
        else:
            print("Índice inválido.")
    elif cultura == 'Café':
        index = int(input("Qual o número do registro que deseja deletar? ")) - 1
        if 0 <= index < len(dados_cafe):
            dados_cafe.pop(index)
            print("Dados deletados com sucesso!")
        else:
            print("Índice inválido.")
    else:
        print("Cultura inválida.")

# Função para exportar os dados para um arquivo CSV
def exportar_dados_para_csv():
    with open('dados_cultivo.csv', mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=['cultura', 'largura', 'comprimento', 'area', 'manejo'])
        writer.writeheader()
        
        for dado in dados_milho:
            writer.writerow(dado)
        
        for dado in dados_cafe:
            writer.writerow(dado)
    
    print("Dados exportados para 'dados_cultivo.csv' com sucesso!")

# Menu
def menu():
    while True:
        print("\nMenu de opções:")
        print("1. Entrada de dados")
        print("2. Saída de dados")
        print("3. Atualização de dados")
        print("4. Deleção de dados")
        print("5. Exportar dados para CSV")
        print("6. Sair")
        
        opcao = input("Escolha uma opção: ")
        
        if opcao == '1':
            entrada_dados()
        elif opcao == '2':
            saida_dados()
        elif opcao == '3':
            atualizar_dados()
        elif opcao == '4':
            deletar_dados()
        elif opcao == '5':
            exportar_dados_para_csv()
        elif opcao == '6':
            print("Saindo do programa...")
            break
        else:
            print("Opção inválida. Tente novamente.")

# Execução do programa
menu()
