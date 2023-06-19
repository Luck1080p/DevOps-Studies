# Kubectl-Commands

- `kubectl get nodes` → Mostra os nodes ativos no cluster
- `kubectl run <name> --image= name:version`  → cria um pod de forma imperativa
- `kubectl get pods` → valida pods existentes
- `kubectl get pods --watch` → mostra em tempo real
- `kubectl describe pod  <name>` → descreve o pod
- `kubectl edit pod`  → edita a declaração do pod
- `kubectl apply -f` → cria um pod declarativamente a partir de um arquivo yaml ou json
- `kubectl delete pod` → apaga o pod
- `kubectl delete -f ./<arquivo de definição>`  → apaga a partir de um arquivo declarado
- `kubectl exec -it <pod-name> -- bash` → acessa um pod

---

### Minikube-commands

- `minikube start --vm-driver=` → Inicia com um driver de virtualização

English with YT -