# Custom variables -------------------------

eval "$(starship init zsh)"

set -o vi

alias bz="/usr/local/bin/bazelisk"
alias lsl="exa -lLsSuUhHa"
alias ls="exa"
alias l="ls -lah"
alias vim="nvim"
alias dc="docker-compose"
alias gitchange="git add . && git commit --amend --no-edit"
alias gitrchange="gitchange && git push -f"
alias update="brew update && brew upgrade && brew cask upgrade && rustup update"
alias cleanup="brew cleanup && brew doctor"
alias cleanupdate="update && cleanup"
alias ec="exercism"

export GOPATH="/Users/$USERNAME/Projects/"

#fortune | lolcat

export PATH="/Users/$USERNAME/.cargo/bin:$PATH"
export PATH="/Users/$USERNAME/Projects/auth-fn/sessionmanager-bundle/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Fuchsia paths
export PATH="/Users/chetan.bhasin/Projects/fuchsia/fuchsia/.jiri_root/bin:$PATH"

# Python3 local
export PATH="/Users/chetan.bhasin/Library/Python/3.7/bin:$PATH"

# Haskell Stack binaries path
export PATH=$PATH:~/.local/bin

# Use TheFuck for previous command correction
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/sbin:$PATH"
export ENVIRONMENT=DEBUG
export TF_VAR_usernam=chetan.bhasin

# added by travis gem
[ -f /Users/$USERNAME/.travis/travis.sh ] && source /Users/$USERNAME/.travis/travis.sh

# End Custom Variables ---------------------------------

## Kuberentes (kubectl) functions --------------

# Finds pods using a search term
# Run using `podname <namespace> <search-term>
podname() {
  kubectl -n $1 get pods | grep -i "$2" | awk '{print $1;}'
}

# Find the namespace that matches a string
# Run using `findns <search-term>`
findns() {
  kubectl get namespaces | grep -i "$@" | awk '{print $1;}'
}

# Deletes all pods matching a given search term
# Run using `deletepod <namespace> <search-term>`
deletepod() {
  kubectl -n $1 delete pod `podname "$1" "$2"`
}

# Describes all pods matching a given search term
# Run using `descpod <namespace> <search-term>`
descpod() {
  kubectl -n $1 describe pod `podname "$1" "$2"`
}

# Watches pods for changes in a given namespace
# Run using `watchnspods <namespace>`
watchpods() {
  kubectl -n $1 get pods -w
}

# Gets a resource from kubernetes by `kubectl get <resource list>`
# Run using `kget <resource-list>`
# To use a namespace, run using `kget -n <namespace> <resource-list>`
kget() {
  kubectl get "$@"
}

# Finds all the pods in a given namespace using `kget` function
# Run using `npods <namespace>`
npods() {
  kget pods -n "$@"
}

# Finds a type of resources for a given searchable namespace
# Run using `knget <namespace-search-term> <resource>`
knget() {
  kubectl -n `findns $1` get $2
}

# Starts tailing the logs of a pod defined in a namespace after
# looking up the name of the pod
# Run using `klogs <namespace> <podname>`
klogs() {
  export ns=$(findns $1)
  export pod=$(podname $ns $2)
  kubectl logs -f -n $ns $pod
}

# Starts tailing the logs of a pod defined in a namespace after
# looking up the name of the pod. It also takes the container name
# inside the pod for pods that have more than one container.
kclogs() {
  export ns=$(findns $1)
  export pod=$(podname $ns $2)
  kubectl logs -f -n $ns $pod $3 $4
}

# Runs fblog on klogs
fklogs() {
  klogs "$@" | fblog
}

# Runs fblog on kclogs
fkclogs() {
  kclogs "$@" | fblog
}

# Forwards porsts frmo a given pod by searching for a namespace
# and pod name from other functions
# Run using `kfwd <namespace-search-term> <podname-search-term> <port-to-forward>`
kfwd() {
  export ns=$(findns $1)
  export pod=$(podname $ns $2)
  kubectl -n $ns port-forward $pod $3:$3
}

## End Kubernetes (kubectl) functions ---------


# Runs make in a given directory and returns
# Useage: makein <dir> <make-command>
# Example: makein .. deploy
makein() {
  cd $1
  current=`pwd`
  echo "Make in $current"
  make $2
  cd -
}


# Generate kubernetes secret for the dashboard:
k8_dash_sec() {
 kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
}

# Who has time to find the right extract command for the file. This does this for you
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}
