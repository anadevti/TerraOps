# Projeto Terraform FinOps - S3 com Gestão de Custos

## 🎯 Objetivo
Criar uma infraestrutura AWS com foco em FinOps utilizando Terraform, demonstrando boas práticas de governança e controle de custos.

## 🏗️ Recursos Provisionados
- Bucket S3 principal para armazenamento de dados
- Bucket S3 dedicado para logs de acesso
- Política de ciclo de vida (lifecycle) de 30 dias
- Configurações de logging e ACL

## 💰 Análise de Custos
O projeto inclui estimativas de custos mensais baseadas em:
- Armazenamento (GB)
- Requisições PUT
- Custos de logging

## 🚀 Como Usar

### Pré-requisitos
- Terraform instalado (v1.0+)
- Credenciais AWS configuradas
- AWS CLI instalado

### Comandos Principais
```bash
# Inicializar o Terraform
terraform init

# Verificar o plano de execução
terraform plan

# Aplicar as mudanças
terraform show

# Visualizar outputs (incluindo estimativas de custo)
terraform output
```

## 📊 Outputs
- Custo mensal estimado de armazenamento
- Custo estimado de requisições
- Custo total mensal

## 🔒 Segurança
- ACL configurada para log-delivery-write
- Logging habilitado para auditoria
- Lifecycle policy para gestão de retenção

## 📝 Variáveis
- `estimated_cost_storage`: Estimativa de armazenamento em GB
- `price_per_gb`: Preço por GB de armazenamento
- `put_request_count`: Número estimado de requisições PUT
- `price_per_1000_put`: Preço por 1000 requisições PUT