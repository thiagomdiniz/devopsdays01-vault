## Terraform-Docs

Documentação gerada automaticamente com [terraform-docs](../.terraform-docs.yml)

```sh
# gerar documentacao do terraform com base nas configuracoes do arquivo '.terraform-docs.yml'
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```