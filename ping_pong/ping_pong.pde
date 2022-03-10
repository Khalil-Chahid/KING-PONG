Ball ball;      //appeler la classe Ball

Player left;    //appeler la classe Player
Player right;

int leftscore = 0; //definir deux entiers pou afficher le score
int rightscore = 0;

PImage img;            //definir deux images
PImage img2;

int stage;              //defiir l'entier stage pour balancer entre le jeux et l'interface principale

float timeInterval;   //entier pour le temp
float timePast;        //entier qui fontionne comme un timer
int textAlpha = 120;  //entier pour la transparance de couler
int textFade = 2;     //entier d'efftet qu'on va creer 
 

void setup () {
  
  size(800,500);    //dimention principalle de la fenetre
 
  stage = 1;        //l'entier stage reçoit 
 
 timeInterval = 2000; //le temp de fading et de 1400 millisecondes
 timePast = millis();    //la commande millis()
 
  
  img = loadImage("kong.jpg");   //la commande load image pour deposer nos images
  img2 = loadImage("menu.jpg"); 
 ;
 
  
  ball  = new Ball();
  left  = new Player(true);
  right = new Player(false);
}




void draw() {          //si on a dan la stage egale a 1, on met la photo "menu"
 
 if (stage==1) {

    background(0); 
    image(img2,0,0);
   
 textEffect();          //en fait l'appelle a la fonction textEffect
 
 noStroke();
 rectMode(CENTER);        
 fill(255,255,255,100);
 rect(400,400,80,3);      //cest mon façon de voir les choses plus beaux 
 rect(400,408,50,3);
 rect(400,416,10,3);
 
 
 }
   
   if (stage==2) {        //si le stage egale a 2, on entre dans le jeux
     
 
 image(img,0,0);          //faire appeler l'image "kong"
   
 stroke(255,255,255);
 strokeWeight(3);
 noFill();
 rect(400,250,790,490);    //avoir plus de detail sur le background de jeux
 
 stroke(255);
 strokeWeight(3);
 line(400,10,400,125);
 line(400,375,400,495);
 
 
 stroke(255);
 strokeWeight(3);
 noFill();
 ellipse(400,250,250,250);
 
 
 

 ball.checkPlayerLeft(left);        
 ball.checkPlayerRight(right);
 
 left.show();
 right.show();

 left.update();
 right.update();                  //appeler les fonctions creer dans la classe Ball et la classe Player
 
 ball.edges();
 ball.shift();
 ball.show();

fill(255);
textSize(30);
text(leftscore,370,40);
text(rightscore,430,40);

stroke(255);                    //les coordonnées de textes et de cadrage des scores
strokeWeight(3);
noFill();
rect(370,30,60,50);
rect(430,30,60,50);


   }
 }



void keyReleased () {          //la fonction key released permet de stopper le mouvement des joueurs dés qu'on arret de presser sur les bouton
  left.move(0);
  right.move(0);                   
}

void keyPressed() {
 if (key == 'z') {               
   left.move(-10);
 } else if (key == 'd') {         //La fonction Pressed est pour la commande :z et d our le mouvement hat et bas du joueurs gauche,
   left.move(10);                    //le maeeme pour le droit mai avec les commandes NUM (4 et 3),
}                                      //le move 10 c'est l'appelle de la fontion move qui permet de bouger de 10pixels

 if (key == '4') {
   right.move(-10);
 } else if (key == '3') {
   right.move(10);
}

if (key == 'x') {
   stage = 2;
 } else if (key == 'p') {
   stage = 1;
   leftscore = 0;                   //le x est pou enter dans le jeux, le p est pour revener au menu(interface primaire)
   rightscore = 0;                  //lorsque on est en train de jouer et on tappe p,en revient a l'interface principale,et lorsque on recommance a appuyer sur x,le score revient nul por les 2 joueurs. 
   
   textEffect();
   
}
 

}
