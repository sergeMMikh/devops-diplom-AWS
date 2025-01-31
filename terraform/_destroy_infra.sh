#!/bin/bash

set -e  # Остановить выполнение при первой же ошибке

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

dir="infrastructure"

echo -e "${YELLOW}📝 Running Terraform destroy in $dir...${NC}"
  if (cd $dir && terraform destroy -auto-approve); then
    echo -e "${GREEN}✅ Destroy completed successfully in $dir${NC}"
  else
    echo -e "${RED}❌ Terraform destroy failed in $dir!${NC}!"
    exit 1
  fi


terraform -chdir=infrastructure destroy -auto-approve
