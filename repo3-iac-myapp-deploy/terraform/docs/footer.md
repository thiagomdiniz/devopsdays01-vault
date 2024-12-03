## Terraform-Docs

Automatically generated documentation with [terraform-docs](../.terraform-docs.yml)

```sh
# generate terraform documentation based on '.terraform-docs.yml' file configurations
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```