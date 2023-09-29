#!/bin/bash

rep="$1"

if [ -z "$rep" ]; then
  echo "Usage: $0 <répertoire>"
  exit 1
fi

gitignore_file="$rep/.gitignore"


# Ajouter les règles pour ignorer les fichiers .err et .out s'ils n'y sont pas déjà
if ! grep -qE '(\.err|\.out)$' "$gitignore_file "; then
  echo "# Ignorer les fichiers .err et .out" > "$gitignore_file"
  echo "*.err" >> "$gitignore_file"
  echo "*.out" >> "$gitignore_file"
  echo "Les fichiers .err et .out seront ignorés dans le suivi Git de ce répertoire."
else
  echo "Les règles pour ignorer les fichiers .err et .out existent déjà dans le fichier .gitignore."
fi

