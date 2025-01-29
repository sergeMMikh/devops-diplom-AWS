#!/bin/bash

for dir in bootstrap infrastructure; do
  echo "Running Terraform validate in $dir..."
  (cd $dir && terraform validate)

  echo "Running Terraform plan in $dir..."
  (cd $dir && terraform plan -out=tfplan-$dir)
done
