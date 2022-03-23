# Projet Docker

## Load balancer

Fichier `docker-compose` : [`docker-compose.yaml`](docker-compose.yaml)

## Application OpenCV

[Dockerfile](Dockerfile)

Pour build l'image :

```sh
docker build -t projet-opencv .
```

Cette étape compilera le projet dans une image intermédiaire et créera une
image `projet-opencv` à exécuter :

```sh
docker run -p 8080:8080 projet-opencv
```

Le service est accessible dans un navigateur à l'adresse
[localhost:8080](http://localhost:8080).
