##Lien vers Dockerhub pour notre projet : https://hub.docker.com/repository/docker/nassorou/my-odoo-image/general
# Containerization_Exam
Containerization_Exam

**Membres du groupe**
Diallo Mamoudou 
Melvin Moukam 
Nassourou-Lahi FOFANA Karim 
Richmond Coulibaly



**Description du projet **

Notre projet consistait à mettre en place le déploiement d'une application que nous avions conteneurisé sur une plateforme Kubernetes.  
Pour cela : 

-Nous avons créé un fichier Dockerfile pour construire l'image de l'application Odoo sur une image Debian 
-Ensuite , nous avons utilisé une image PostgreSQL déjà présente sur DockerHub pour la base de données PostgreSQL. Nous n’avons donc pas eu besoin de créer un fichier Dockerfile pour gérer la base de données 

-Par la suite, afin de déployer notre application sur un cluster Kubernetes, nous nous sommes servis d’un fichier YAML que nous avons écrit au préalable en créant les ressources « Deployment » et « Service » en s’assurant de la gestion des données et aussi de la limitation de ressources consommées par les conteneurs déployés. 

- Enfin, nous avons pu tester nos déploiements sur le cluster Kubernetes « g3-kubeconfig » que le prof nous a mis à disposition. 

**Choix Technique et Technologies**
- Cluster Kubernetes pour tester le déploiement 
- Docker pour la création de l'image de l'application. 
- Ubuntu Debian pour le système d'exploitation 
- Kubernetes pour la gestion de la conteneurisation et du déploiement 

**Utilisation de notre projet :**
Dans un premier temps, nous avons créé un projet nommé « projet_containerization » puis nous avons créé les fichiers Dockerfile et « odoo-erp.yaml » en utilisant les commande : 
 
     	***touch dockerfile***
    	***touch odoo-erp.yaml***
 
Après cela : 
- nous avons construit l’image de l’application Odoo avec la commande : 
 
        	***docker build -t my-odoo-image .*** 
 
           ***my-odoo-image étant le nom de notre image***
 
Ensuite nous avons créé la ressource Deployment à partir du fichier manifest en utilisant les commandes : 
 
     ***kubectl create -f odoo-erp.yaml ***
 
Une fois le service crée, nous avons vérifié l’état du deploiement avec :  
 
        ***Kubectl get odoo-erp.yaml ***
 
Enfin nous avons pousser notre image sur DockerHub : 
 
      	***Docker login ***
   	    ***Docker push ***
        
**Problèmes rencontrés :**
Lors de la création du projet et du déploiement avec Docker et Kubernetes, nous avons rencontré des difficultés techniques qui ont ralenti le développement et le déploiement du projet. 
Voici quelques difficultés qu'on a rencontrées :
### Problèmes de configuration : Au niveau des fichiers Dockerfile et odoo-erp.yaml 
### Erreurs de construction : Lors de la construction des images Docker, nous avons rencontré des erreurs liées à des dépendances manquantes ou des erreurs de syntaxe dans le code. 
### Nous avons rencontré un souci avec notre VM dont l’espace de stockage avait été épuisé. Ce qui a causé un gros retard pour le rendu de notre travail compte tenu du fait que nous étions obligés de changer de machine du coup reprendre tout le projet. 

