#!/bin/bash
# newProject.sh
# script d'initialisation de projet React+Parcel
# nov-2021 - par david-2.garnier
#
set -e;

PURPLE='\033[0;35m'; # Violet
RED='\033[0;31m'; # Rouge
NC='\033[0m'; # No Color

echo -e "$PURPLE
#################################
#         newPr_ReaPar.sh       #
# New Project in React + Parcel #
#################################
$NC";

echo -e "Voulez-vous vraiment créer un nouveau projet nommé $RED$1$NC ?
Ce projet sera propulsé par du React/React-dom avec l'aide du bundler Parcel.";
select on in "Oui" "Non"; do
  case $on in
    Oui ) echo "Processus démarré !"
      break;;
    Non ) echo "Processus annulé !"
      exit;;
  esac
done;

echo -e "Création de votre projet REACT+PARCEL : $RED $1 $NC";
mkdir $1;
cd $1;

echo "----------------------------------------------------
Création du fichier de configuration package.json...
----------------------------------------------------";
echo "
{
  \"name\": \"$1\",
  \"version\": \"1.0.0\",
  \"source\": \"./src/index.html\",

  \"browserslist\": \"> 0.5%, last 2 versions, not dead\",
  \"author\": \"$USERNAME\",
  \"license\": \"MIT\",
  \"private\": true,
  \"scripts\": {
    \"watch\": \"parcel watch\",
    \"start\": \"parcel --open\",
    \"build\": \"parcel build --log-level error\"
  },
  \"description\": \"Description de votre projet...\",
  \"repository\": \"\"
}" >> package.json;

echo "
---------------------------
Initialisation du projet...
---------------------------";
yarn init;

echo "
-------------------------
Installation de PARCEL...
-------------------------";
yarn add --dev uuid;
yarn add --dev parcel;
echo "
------------------------------------
Installation de REACT & REACT-DOM...
------------------------------------";
yarn add react react-dom;

echo "
---------------------------------------------
Installation de REACT-BOOSTRAP & BOOTSTRAP...
---------------------------------------------";
yarn add react-bootstrap bootstrap;

#Initialisation des principaux fichiers
echo "
------------------------------
Création du fichier .yarnrc...
------------------------------";
echo "registry \"https://pnexus.gendarmerie.fr/repository/Node_Js/\"
\"@stsisi:registry\" \"https://pnexus.gendarmerie.fr/repository/Node_JS_hosted/\"
" >> .yarnrc;

echo "
---------------------------------
Création du fichier .gitignore...
---------------------------------";
echo "/.idea/
/node_modules/
/.parcel-cache/
/dist/
/.yarnrc
/yarn-error.log
" >> .gitignore;

echo "
-----------------------------
Création du fichier README.md
-----------------------------";
echo "# $1
### Documentation à destination des utilisateurs et des développeurs/intégrateurs

## SOMMAIRE

* A propos du projet
* Technologies employées
* Démarrage
* Pré-requis
* Installation
* Usage
* Roadmap
* Contributions
* Licence
* Contact

## A propos du projet

## Technologies employées

## Démarrage

## Pré-requis

## Installation

## Usage

## Roadmap

## Contributions

## Licence

## Contact
=> $USER.gendarmerie.interieur.gouv.fr

" >> README.md;

mkdir src/ && cd src/;
mkdir assets/;
mkdir components/;

echo "
---------------------------------
Création du fichier index.html...
---------------------------------";
echo "<!DOCTYPE html>
<html lang=\"fr\">
<head>
    <meta charset=\"UTF-8\">
    <title>$1</title>
</head>
<body>

    <div id=\"root\"></div>

    <script src=\"src/index.js\" type=\"module\"></script>

</body>
</html>
" >> index.html;

echo "
-----------------------------
Création du fichier index.js...
-----------------------------";
echo "
/* -------------------------
==> ${1^^} <==

Par $USER
Composant react principal
Agglomère tous les autres composants avant le rendu
--------------------------------------------------- */
'use strict';

/* ------------------------
          IMPORTS
--------------------------- */

// Modules
import React from 'react';
import ReactDOM from 'react-dom';

// Styles

// Components
// Ex.: import component from './component';

/* ------------------------
          VARIABLES
--------------------------- */

/* ------------------------
          CLASSES
--------------------------- */
class App extends React.Component {
  render() {
    return (
      <div>
        <h1>${1^^}</h1>
      </div>
    );
  }
}

/* ------------------------
          FONCTIONS
--------------------------- */

/* ------------------------
          EXECUTION
--------------------------- */
ReactDOM.render(<App />, document.getElementById('root'));

" >> index.js;

# Lancement du projet dans l'IDE
echo "
-------------------------------------------------------
Ouverture du projet avec IntelliJ IDEA Ultimate Edition
-------------------------------------------------------
";
cd ..;
idea.sh $PWD;

echo -e "
****************************************
>>> Projet $RED$1$NC créé et initialisé.
Bon développement !
****************************************";
