function knmsp -d "run vim with fzf"
  kubectl config set-context --current --namespace=(kubectl get namespace --no-headers | fzf | awk '{ print $1}')
end
