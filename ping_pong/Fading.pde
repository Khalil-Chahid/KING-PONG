void textEffect()  {
  
{
  if (millis() > timeInterval + timePast) {    //la fonction textEffect permet d'effectuer un effet de fade sur le texte qu'on va choisir,
    timePast = millis();                        //cet effet fonctionne comme un timer 
    textFade *= -1;
  }
  
  textAlpha += textFade;
} 
  
 textAlign(CENTER);
 textSize(20);
 noStroke();
 fill(255,255,255,textAlpha);                    //se son les caracteristique de notre texte "taper X" pour entrer dans le jeux
 text("PRESS  X",400,385);
}
