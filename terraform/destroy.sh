#!/bin/bash

set -e  # Остановить выполнение при первой же ошибке

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Очистка S3-бакета перед удалением
BUCKET_NAME=$(cd bootstrap && terraform output -raw s3_bucket_name || echo "")

if [ -n "$BUCKET_NAME" ] && aws s3 ls "s3://$BUCKET_NAME" 2>/dev/null; then
  echo -e "${YELLOW}📝 Удаляем все файлы из S3 бакета: $BUCKET_NAME...${NC}"
  aws s3 rm s3://$BUCKET_NAME --recursive
  echo -e "${GREEN}✅ Файлы из S3 бакета удалены${NC}"
else
  echo -e "${YELLOW}⚠️  S3 бакет $BUCKET_NAME не найден или уже пуст.${NC}"
fi

for dir in infrastructure bootstrap ; do
  echo -e "${YELLOW}📝 Running Terraform destroy in $dir...${NC}"
  if (cd $dir && terraform destroy -auto-approve); then
    echo -e "${GREEN}✅ Destroy completed successfully in $dir${NC}"
  else
    echo -e "${RED}❌ Terraform destroy failed in $dir!${NC}"
    exit 1
  fi
done
