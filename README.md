# PoC DevOps ITT
Ce repo contient le PoC associé à la formation Devops ITT.

### Descritpion de repo

- Dossier **Continious Deployment**

    - contient le code Terraform création de ressource sur Azure 

### Prérequis
- Avoir un compte utilisateur Azure (Contibutor role)
- Avoir un accès programmatic à Azure (Azure principal) : cet acces sera utilisé par Terraform pour gérer automatiquement les ressoures Azure via le pipeline Github Action.

Pour plus d'information, voir la [Documentation d'Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash#create-a-service-principal) 

## Comment lancer le PoC ?

### Configurer le repo Github

- Mise à jour des secrets
    * Azure credentials #TODO (Ajouter les capture d'écran)
    * Container registry token

## Initialisation du PoC
- Initialisation des configuration de Terraform (à faire en local)
    - #TODO (Soulémanou)

- Depuis l'onglet "**Action**", Lancer le workflow **Container deployment** avec les paramètres ci-dessous :
    - Deployment environment : **all**
    - Application version : **0.1**

![plot](./images/all-initialisation.png)

L'exécution du pipeline déploiera la version sélectionnée (0.1 dans notre exemple) de l'application dans les environnements de **prod** et de **test** accessible vie la liens ci-dessous quelques minutes après l'exécution du workflow :

- PROD : http://prod-itt-poc-devops.eastus.azurecontainer.io:3000/
- TEST : http://test-itt-poc-devops.eastus.azurecontainer.io:3000/

## Exécution du PoC : PLAN -> CODE -> BUILD -> TEST -> DEPLOY

### 1 - PLAN
#TODO (Martin) : création de ticker pour nouvelle fonctionalité ou correction de bug

### 2 - CODE
#TODO (Martin): mettre à jour le code, nouvelle branche, merge, ...

### 3 - TEST
#TODO (Martin)
- Tests d'intégration
- Test de qualité de code
Donner un cas de test échoué

### 4 - BUILD
#### Description
Cette étape permet de construire une image de conteneur de l'application prenant en compte les dernières modifications faites sur la branche principale. Cette image sera stocké dans un registre de conteneur [ici](https://hub.docker.com/r/sngbango/app-poc/tags).
#### Comment lancer le workflow ?
Dans l'onglet "**Action**" du repo git, lancer le workflow **Build docker image**

![plot](./images/Docker-build-workflow.png)

Note : Pour les besoins du POC, nous utilisons temporairement [Docker Hub](https://hub.docker.com/r/sngbango/app-poc/tags) comme registre de conteneur.

### 4 - DEPLOY (environnement de TEST)
#### Description
Cette étape permet de déployer la dernière version de l'application en environnement de Test.

#### Comment lancer le workflow ?
Lancer le pipeline **container deployment** avec le paramètres :
- Deployment environment : **test**
- Application version : **latest**

A la fin de l'exécution du workflow, vous pouvez vérifier que la dernière version de l'application a bien été dépoyée en [TEST](http://test-itt-poc-devops.eastus.azurecontainer.io:3000/) : http://test-itt-poc-devops.eastus.azurecontainer.io:3000/

![plot](./images/latest-test-deploy.png)

**Note** : Il est possible de voir les détails d'exécution du workflow en cliquant sur le nom du workflow.

### 4bis - DEPLOY (environnement de PROD)

Cette étape permet de déployer la dernière version de l'application en environnement de Production.

#### Comment lancer le workflow ?
Lancer le pipeline **container deployment** avec le paramètres :
- Deployment environment : **prod**
- Application version : **latest**

A la fin de l'exécution du workflow, vous pouvez vérifier que la dernière version de l'application a bien été dépoyée en [PROD](http://prod-itt-poc-devops.eastus.azurecontainer.io:3000/) : http://prod-itt-poc-devops.eastus.azurecontainer.io:3000/

![plot](./images/latest-prod-depoyment.png)

**Note** : Il est possible de voir les détails d'exécution du workflow en cliquant sur le nom du workflow.


### 5 - Supprimer les ressources
#TODO(Soulémanou) workflow de suppression des ressources Azure à mettre en place.