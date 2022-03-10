class Ball {                    //creation d'une classe pour la balle
                     
  
PVector location;               //creation de deux vecteurs (position et vitesse)
PVector velocity;  

float r = 10;                   //r est le rayon de cerle



Ball() {                         
  
  location = new PVector(width/2,height/2);  //postion de balle est au centre 
  velocity = new PVector(0,0);               //vitesse est nul 
  
 reset();
}
  
void checkPlayerLeft(Player p) {
  if (location.y - r < p.y + p.h/2 && location.y + r > p.y - p.h/2 && location.x - r < p.x + p.w/2) {
    if (location.x > p.x) { 
                                                           //la fonction checkPlayerLeft permet de determiner les coordonnées du rebond de la ballesur par rapport au coordonnées,
      float diff = location.y - (p.y - p.h/2);                // des deux joueurs (left & Right), on a crer un condition teque si la balle rebond , el va deplacer selon un intervalle, 
                                                         // d'angles,don on utilise la commande map() pour mapper les angle le logn du joueur
      float rad = radians(45);
      float angle = map(diff,0,p.h,-rad,rad);
      velocity.x = 10 * cos(angle);                       //On peut changer la vitesse de la balle en changant le nombre multiplié par cos et sin. 
      velocity.y = 10 * sin(angle);  
      location.x = p.x + r + p.w/2;                     //c'est la condition finale du rebond de la balle
   }
  }
}                                                        //le meme travaille pour l'autre joueur ,mais en prenant compte les dimensions (puisque les deux joueur sont en face, gauche et droit)

void checkPlayerRight(Player p) {
  if (location.y - r < p.y + p.h/2 && location.y + r > p.y - p.h/2 && location.x + r > p.x - p.w/2) {
    if (location.x < p.x) {
      
      float diff = location.y - (p.y - p.h/2);
      float angle = map(diff,0,p.h,radians(135),radians(225));
      velocity.x = 10 * cos(angle);  
      velocity.y = 10 * sin(angle);  
      location.x = p.x - p.w/2 - r;

   }
  }
}

void shift ()   {   //Creation dune fonction du vecteur mouvement de la classe 
 location.add(velocity);   //La somme des deux vecteurs nous donne le mouvement de la balle 
}

void reset() {              //La fonction reset permet de renouveler la balle dès quelle sorte des bords
 location.x = width/2;       //se sont les coordonnées cartésiennes de la balle 
 location.y = height/2;
 float angle = random(-PI/4,PI/4);   //La mouvement de la balle se change avec une reference sur,
                                     // le cercle trigonometrique, en prenant compte de la regle 
                                     // de Pythagores et fait controller la valeur de vitesse (10 pixel par exemple) 
 velocity.x = 10 * cos(angle);
 velocity.y = 10 * sin(angle);
 
 if (random(2) < 1) {                // le mouvement de la balle est aléatoire de 50% dans le sens direct(velocity = velocity * 1) et 50% dans le sens indirect(velocity = velocity * (-1))
 velocity.x *= -1;
 }
}

void edges() {                       //la fonction edges permet de specifier les bords du mouvement de la balle dans la fenetre
 if (location.y - r - 10 < 0 || location.y + r + 10 > height) {  //d'apres le coordonné y - r de la balle, la balle reste en mouvement dès quelle ne depass pas ,
                                                                 //   le top de la fennetre (0) et le long la la fenetre principale (10 :hauteur d'un autre rectangle dans le background
 velocity.y *= -1;
} 

 if (location.x - r > width) {
   leftscore++;
   reset();
 }
 
 if (location.x + r < 0) {
   rightscore++;
   reset();
}
}

void show() {                            //c'est notre balle sous la forme d'une ellipse de rayon r
  fill(255);
  ellipse(location.x,location.y,r*2,r*2);
  }
}
