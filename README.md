# 🚕 Análise de Corridas — SQL  

Projeto de **análise de dados de corridas** utilizando **SQLite** e **consultas SQL** para responder perguntas de negócio, gerar KPIs e explorar padrões em um dataset público do Kaggle.  

🔗 **Fonte dos dados:** [Uber Ride Analytics Dataset — Kaggle](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard/data)  

---

## 🎯 Objetivo  
- Demonstrar **habilidades práticas em SQL** para análise de dados.  
- Criar **consultas organizadas e interpretáveis**, explorando desde visão geral até KPIs mais específicos.  
- Simular um case real de **Business Intelligence / Data Analytics**.  

---

## 📂 Estrutura do Projeto  

📦 uber-sql-analysis
 ┣ 📜 uber_sql_analysis.sql   # script principal com as queries
 ┣ 📂 data/                   # (futuro) dataset CSV de exemplo
 ┣ 📂 insights/               # (futuro) outputs e relatórios
 ┗ 📜 README.md

---

## 🧰 Ferramentas Utilizadas  
- Banco: **SQLite**  
- Ambiente: **DBeaver | VS Code | SQLite CLI**  
- Dataset: **Kaggle**  

---

## 📊 Consultas Implementadas  

### 📌 Visão Geral  
- Total de corridas realizadas  
- Distribuição por status de corrida *(Completed, Cancelled, etc.)*  

### 📈 Tendência Mensal  
- Volume de corridas mês a mês (YYYY-MM)  
- Tradução de períodos para **meses em PT-BR**  

### 🚗 Análise por Tipo de Veículo  
- Número de corridas  
- Valor total e ticket médio  
- Distância total e média percorrida  

### 💳 Métodos de Pagamento  
- Corridas e receita por forma de pagamento  

### (Em construção)  
- Rotas mais populares  
- Ratings de motoristas e clientes  
- Horários e dias de pico  

---

## 📈 Exemplos de Resultados  

**Total de corridas:**  
150.000

**Status:**  
✅ Completed             → 93.000 (62%)  
🚫 Cancelled by Driver   → 27.500 (18%)  
🚫 Cancelled by Customer → 10.500 (7%)  
⚠️ Incomplete            → 9.000  (6%)  
❌ No Driver Found       → 10.500 (7%)  

**Exemplo — Corridas por mês:**  
Janeiro   → 12.861  
Fevereiro → 11.927  
...  
Dezembro → 12.250  

**Ticket médio por veículo (Completed):**  
~ R$ 505 – R$ 512  

---

## 🚀 Como Rodar  

1. Baixar o dataset no [Kaggle](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard/data).  
2. Importar para o SQLite via DBeaver, CLI ou VS Code.  
3. Executar as queries no arquivo `uber_sql_analysis.sql`.  

---

## 🙌 Créditos  

- Dataset público do Kaggle.  
- Projeto pessoal de **portfólio em SQL** para prática e aprendizado.  
- Criado por Caio Yuji Simonoe (https://github.com/caiosimonoe).  
