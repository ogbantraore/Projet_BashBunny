Le processus consiste à d'abord copier le programme de contrefaçon de la commande "sudo" dans le répertoire personnel de l'utilisateur. 
Ensuite, il établit un nouvel alias "sudo" de manière persistante en utilisant le fichier "~/.bash_aliases". 
Lorsque l'utilisateur  lance la commande "sudo" dans un terminal, le programme de contrefaçon est déclenché. 
Par défaut, ce programme récupère le nom d'utilisateur et le mot de passe, puis les enregistre dans le fichier "/tmp/.sudo_password". 
Cependant, il est possible de modifier ce comportement en modifiant la ligne 21 du fichier "sudo-phishing.sh". 
Une fois que le programme de contrefaçon a accompli sa tâche, il supprime l'alias "sudo" avant de se supprimer lui-même.
