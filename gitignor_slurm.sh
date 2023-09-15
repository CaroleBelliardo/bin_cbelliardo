#!/bin/bash

# Fonction pour parcourir les répertoires récursivement
update_gitignore() {
  local dir="$1"
  local gitignore_file="$dir/.gitignore"

  if [ -f "$gitignore_file" ]; then
    # Vérifier si .gitignore contient déjà des règles pour .err et .out
    if grep -qE '(\.err|\.out)$' "$gitignore_file"; then
      echo "Les règles pour .err et .out existent déjà dans $dir/.gitignore"
    else
      echo -e "\n# Ignorer les fichiers .err et .out\n*.err\n*.out" >> "$gitignore_file"
      echo "Règles ajoutées à $dir/.gitignore"
    fi
  fi

  # Parcourir les sous-répertoires
  for subdir in "$dir"/*/; do
    if [ -d "$subdir" ]; then
      update_gitignore "$subdir"
    fi
  done
}

# Appel de la fonction avec le répertoire courant
update_gitignore "$(pwd)"

