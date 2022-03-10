class Player {                        //creer une classe Player pours le deux joueurs
float x;
float y = height/2;                  //les coordonnés des joueurs
float w = 20;
float h = 100;

float smooth = 0;                     // un entier a utiliser

Player(boolean left) {
 if (left) {                       //on a creer une condition de vrai ou faux pour avoir les deux joueurs en face
   x = w;
 }
 else {
   x = width - w;
 }
}

void update() {                          //la fonction update fonctionne comme un update pour la fon fonction move,
y += smooth;                              //les deux joueur va se deplacer d'apres l'axe y ,donc on utilise la commande "constrain"
y = constrain(y,h/2+10,height-h/2-10);
}

void move(float steps) {
smooth = steps;                           //on a creer une fonction pour faire bouger les joueurs telque smooth reçoit le nombre de steps
}

void show() {
 
 stroke(255,255,255,0);
 fill(255);
 rectMode(CENTER);         //c'est nos joueurs sous la formes d'un rectangle
 rect(x,y,w,h); 
}
}
