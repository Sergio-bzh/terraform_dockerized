# Terraform sous Docker

Ce petit projet a pour but de mettre en place TERRAFORM sur mon poste Ubuntu sans impacter la configuration de mon laptop pendant mon apprentisage.
Il me servira aussi à tester cette approche sur mes autres plateformes où j'utilise Docker (_MS-Windows et Apple-Mac-OS_)

## Pré-requis :
- Docker installé sur le poste de travail
- Proxmox VE (installé sur une machine du réseau domestique ou dans une VM sur le poste de travail)
- Une petite connaissance des commandes shell (**bash** _dans mon cas_)

## Implémentation sur votre machine :
- Clôner le projet
    - ```git clone https://github.com/Sergio-bzh/terraform_dockerized.git```
- Se positonner sur le dossier que l'on vient de clôner
    - ```cd terraform_dockerized```
- Créez votre fichier .env_local en adaptant les variables à vos besoins
    - ```cp .env .env_local``` et mettez à jour les variables
- Vérifier que docker daemon ou Docker-Desktop est en cours d'exécution
    - ```docker ps``` si nécessaire démarrez Docker-Desktop

## Utilisation :
- Construir l'image et instancier le conteneur
    - Version résecente de Docker : ```sudo docker compose up -d --build```
    - Ancienne version de Docker : ```sudo docker-compose up -d --build```
- Vérifier la présence du conteneur : ```docker ps``` Vous devriez voir **terraform**
- Se connecter au conteneur (pour utiliser TERRAFORM):
    - ```docker exec -it nom_du_conteneur /bin/bash``` **OU**
    - ```./container_connect.sh``` Ce script contient l'équivalent de la commande précédente
- Se possiotionner dans le dossier **terraform-data** et creer votre espace de travail
    - Par exemple : ```mkdir proxmox_pi-hole-CT```
- Se possitionner dans l'espace de travail que l'on vient de créer
    - ```cd proxmox_pi-hole-CT``` C'est ici que vous mettre vos fichiers **.tf**

### Dans le conteneur :
- Se positionner dans l'espace de travail (où se trouve le fichier main.tf)
    - ```cd dossier_de_travail```  ex. **proxmox_pi-hole-CT**
- Initialiser l'espace de travail :
    - ```terraform init```
- Générer votre plan d'exécution et sauvegardez le dans le fichier planfile.tfplan :
    - ```terraform plan -out=planfile.tfplan```
- Appliquer les modification et procéder à la création de l'infra : 
    - ```terraform apply planfile.tfplan```

### Arborescence du projet (avec mes deux tests supprimés depuis):
```
terraform_dockerized
├── compose.yaml
├── container_connect.sh
├── Dockerfile
├── README.md (ce fichier) 
└── terraform-data ===================> (équivaut au dossier workspace du conteneur)
    ├── proxmox_pi-hole-CT
    │   ├── main.tf
    │   ├── planfile.tfplan
    │   ├── terraform.tfstate
    │   ├── terraform.tfstate.backup
    │   └── variables.tf
    └── vbox_pve-vm
        └── main.tf
```

Merci pour l'intérêt que vous prêtez à ce petit projet et j'espère qu'il vous sera utile.

_Bon code_