import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from openpyxl import Workbook
import tkinter as tk
from tkinter import messagebox

# Configuração do WebDriver
def configurar_driver():
    driver = webdriver.Chrome()  # Certifique-se de ter o ChromeDriver instalado
    return driver

# Função para capturar a temperatura e umidade
def capturar_dados(driver):
    driver.get("URL_DO_SITE_DE_PREVISAO")  # Substitua pela URL do site de previsão

    temperatura = driver.find_element(By.XPATH, "XPATH_TEMPERATURA").text
    umidade = driver.find_element(By.XPATH, "XPATH_UMIDADE").text

    return temperatura, umidade

# Função para salvar os dados na planilha
def salvar_dados(temperatura, umidade):
    wb = Workbook()
    ws = wb.active
    ws.append(["Data", "Hora", "Temperatura", "Umidade"])

    from datetime import datetime
    now = datetime.now()
    ws.append([now.strftime("%Y-%m-%d"), now.strftime("%H:%M:%S"), temperatura, umidade])
    
    wb.save("dados_temperatura.xlsx")

# Função chamada pelo botão da interface
def buscar_previsao():
    driver = configurar_driver()
    temperatura, umidade = capturar_dados(driver)
    salvar_dados(temperatura, umidade)
    driver.quit()
    messagebox.showinfo("Sucesso", "Dados salvos com sucesso!")

# Interface com Tkinter
def criar_interface():
    root = tk.Tk()
    root.title("Captador de Temperatura e Umidade")
    root.geometry("300x150")

    btn_buscar = tk.Button(root, text="Buscar Previsão", command=buscar_previsao)
    btn_buscar.pack(pady=20)

    root.mainloop()

if __name__ == "__main__":
    criar_interface()
