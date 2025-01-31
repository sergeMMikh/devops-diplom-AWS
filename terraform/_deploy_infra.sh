#!/bin/bash

set -e  # Остановить выполнение при ошибке

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

dir="infrastructure"
  echo -e "${YELLOW}🔍 Running Terraform validate in $dir...${NC}"
  (cd $dir && terraform validate)

  echo -e "${YELLOW}📝 Running Terraform plan in $dir...${NC}"
  (cd $dir && terraform plan -out=tfplan-$dir)

  echo -e "${GREEN}🚀 Running Terraform apply in $dir...${NC}"
  (cd $dir && terraform apply -auto-approve tfplan-$dir)

  echo -e "${GREEN}✅ $dir deployment completed successfully!${NC}"

echo -e "${GREEN}🎉 All Terraform deployments completed!${NC}"
