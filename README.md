# PoC DevOps ITT
Ce repo contient le PoC associé à la formation Devops ITT.

### Prérequis
- Avoir un compte utilisateur Azure (Contibutor role)
- Avoir un accès programmatic à Azure (Azure principal) : cet acces sera utilisé par Terraform pour gérer automatiquement les ressoures Azure via le pipeline Github Action.

Pour plus d'information, voir la [Documentation d'Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash#create-a-service-principal) 
## Comment lancer le PoC ?

### Configurer le repo Github

- Mise à jour des secrets
    * Azure credentials
    * Container registry token

### 1 - Initialisation du PoC
- Initialisation des configuration de Terraform (à faire en local)
    - #TODO

- Lancer le pipeline Container deployment avec les paramètres ci-dessous :
    - Deployment environment : **all**
    - Application version : **0.1**

L'exécution du pipeline déploiera la version 0.1 de l'application dans les environnements de **prod** et de **test**

Url vers l'environnement de prod : http://prod-itt-poc-devops.eastus.azurecontainer.io:3000/

Url vers l'environnement de test : http://test-itt-poc-devops.eastus.azurecontainer.io:3000/

### 2 - Ticket pour nouvelle fonctionnalité

### 3 - Code

### 4 - Test & Build
#### Test
- Tests d'intégration
- Test de qualité de code
#### Build
- Contruction d'une nouvelle image de conteneur
- ajout de l'image dans le registre de conteneur

### 5 - Déploiement en environnement de TEST
Lancer le pipeline **container deployment avec le paramètres :
- Deployment environment : **test**
- Application version : **latest**

#TODO ajouter capture d'écran

### 6 - Déploiement en environnement de PROD

Lancer le pipeline **container deployment avec le paramètres :
- Deployment environment : **prod**
- Application version : **latest**

#TODO(Soulémanou) ajouter capture d'écran