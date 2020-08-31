# Kubectl-OIDC Action

This action allows you to control a Kubernetes cluster and deploy resources.
It enhances [danielr1996/kubectl-action](https://github.com/danielr1996/kubectl-action) introducing the support for OIDC authentication.

## Inputs

### `kubeconfig`

Base64 encoded `.kube/config` file, to generate use:
```shell script
cat .kube/config | base64
```

## Usage
## Kustomize a Deployment
```yaml
- name: Kustomize
  uses: danielr1996/kubectl-action@1.0.0
  with:
    args: kustomize deployment/overlays/replace > template.yaml
```

## Deploy a Deployment
```yaml
- uses: danielr1996/kubectl-action@1.0.0
  name: Deploy
  with:
    kubeconfig: ${{ secrets.KUBE_CONFIG }}
    args: apply -f deployment.yaml
```
