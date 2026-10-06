# Dicionário de Dados do Sistema - Schulz S.A.

O dicionário de dados mapeia a estrutura de campos, tipos e restrições adotados no banco de dados SQLite para o controle de calibrações.

| Nome do Campo | Entidade / Tabela | Tipo de Dado (SQLite) | Tipo de Chave | Permite Nulo | Descrição do Campo |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `id_tecnico` | `tecnico` | Inteiro (`INTEGER`) | Chave Primária (PK) | Não | Identificador numérico e único do técnico ou solicitante. |
| `nome_tecnico` | `tecnico` | Texto (`TEXT`) | Nenhuma | Não | Nome completo do profissional responsável. |
| `cpf_tecnico` | `tecnico` | Texto (`TEXT`) | Nenhuma (Único) | Não | Documento de identificação do técnico. |
| `cargo` | `tecnico` | Texto (`TEXT`) | Nenhuma | Sim | Função ou cargo ocupado pelo colaborador. |
| `id_equipamento` | `equipamento` | Inteiro (`INTEGER`) | Chave Primária (PK) | Não | Identificador numérico e único do instrumento. |
| `codigo_equipamento`| `equipamento` | Texto (`TEXT`) | Nenhuma (Único) | Não | Código de rastreabilidade ou TAG do equipamento. |
| `descricao_equipamento`| `equipamento`| Texto (`TEXT`) | Nenhuma | Não | Descrição detalhada do instrumento de medição. |
| `fabricante` | `equipamento` | Texto (`TEXT`) | Nenhuma | Sim | Empresa fabricante do equipamento. |
| `modelo` | `equipamento` | Texto (`TEXT`) | Nenhuma | Sim | Modelo específico do equipamento. |
| `id_medicao` | `medicao` | Inteiro (`INTEGER`) | Chave Primária (PK) | Não | Identificador numérico e único do registro de medição. |
| `id_equipamento` | `medicao` | Inteiro (`INTEGER`) | Chave Estrangeira (FK)| Não | Vínculo com a tabela de equipamentos (`equipamento.id_equipamento`). |
| `id_tecnico` | `medicao` | Inteiro (`INTEGER`) | Chave Estrangeira (FK)| Não | Vínculo com a tabela de técnicos (`tecnico.id_tecnico`). |
| `data_medicao` | `medicao` | Texto (`TEXT`) | Nenhuma | Não | Data e hora em que a medição foi realizada. |
| `parametro` | `medicao` | Texto (`TEXT`) | Nenhuma | Não | Grandeza física ou parâmetro aferido (ex: Pressão, Temperatura, Comprimento). |
| `valor_nominal` | `medicao` | Real (`REAL`) | Nenhuma | Não | Valor nominal esperado de referência. |
| `tolerancia_inferior`| `medicao` | Real (`REAL`) | Nenhuma | Não | Limite mínimo de variação permitida. |
| `tolerancia_superior`| `medicao` | Real (`REAL`) | Nenhuma | Não | Limite máximo de variação permitida. |
| `valor_obtido` | `medicao` | Real (`REAL`) | Nenhuma | Não | Valor efetivamente lido no instrumento durante o ensaio. |
| `status` | `medicao` | Texto (`TEXT`) | Nenhuma | Não | Resultado do ensaio ('Aprovado', 'Reprovado' ou 'Em Análise'). |
