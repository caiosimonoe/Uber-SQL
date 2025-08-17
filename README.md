# 🚕 Análise de Corridas — SQL (Em desenvolvimento)

Projeto de análise de dados de corridas em banco **SQLite**, utilizando consultas SQL para responder perguntas de negócio.  

O objetivo é demonstrar **habilidades em SQL** com foco em exploração de dados, geração de KPIs e organização de consultas em um case prático.

---

## 📂 Estrutura do Projeto
- `uber_sql_analysis.sql` → script principal com as consultas SQL  
- (futuro) `/data` → pasta de dados caso queira disponibilizar um CSV de exemplo  
- (futuro) `/insights` → outputs, visualizações ou relatórios baseados nas queries  

---

## 🧰 Ferramentas
- **Banco:** SQLite  
- **Ambiente:** DBeaver / VS Code / SQLite CLI  

---

## 📊 Consultas implementadas

1. **Visão geral**
   - Total de corridas realizadas
   - Distribuição por status de corrida (Completed, Cancelled, etc.)

2. **Tendência mensal**
   - Volume de corridas mês a mês (YYYY-MM)
   - Tradução para meses em PT-BR

3. **Análise por tipo de veículo**
   - Número de corridas
   - Valor total, ticket médio e distância média percorrida

4. **Método de pagamento**
   - Total de corridas e receita por forma de pagamento  

5. **(Em construção)**
   - Rotas mais populares
   - Ratings de motoristas e clientes
   - Horários/dias de pico  

---

## 📈 Exemplos de Resultados

- **Total de corridas:** 150.000  
- **Status:**  
  - ✅ Completed → 93.000  
  - 🚫 Cancelled by Driver → 27.500  
  - 🚫 Cancelled by Customer → 10.500  
  - ⚠️ Incomplete → 9.000  
  - ❌ No Driver Found → 10.500  

- **Corridas por mês (exemplo):**  
  Janeiro = 12.861 | Fevereiro = 11.927 | ... | Dezembro = 12.250  

- **Ticket médio por veículo (Completed):** ~ **R$ 505 – R$ 512**  

---

## 🙌 Créditos
Projeto pessoal de portfólio para prática em **SQL**.  
Base de dados sintética, utilizada apenas para fins educacionais.
