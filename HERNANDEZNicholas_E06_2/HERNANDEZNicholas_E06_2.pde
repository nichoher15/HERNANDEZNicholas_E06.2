int estado = 0;  // Controla en qué parte de la historia estamos (inicio, camino, trampa, etc.).

Explorador explorador; // Objeto de la clase Explorador que representará al personaje principal.

void setup() {
  size(800, 600);
  explorador = new Explorador(100, 400); //Se crea el personaje en la posición (100, 400).
}

void draw() {
  // Fondos distintos para cada estado
  if (estado == 0) {
    background(30, 60, 100);  // Azul oscuro
    escenaInicio();
  } else if (estado == 1) {
    background(50, 100, 50);  // Verde selva
    escenaCamino();
  } else if (estado == 2) {
    background(80, 50, 20);   // Cámara misteriosa
    escenaCofre();
  } else if (estado == 3) {
    background(150, 0, 0);    // Trampa activada
    escenaTrampa();
  } else if (estado == 4) {
    background(80, 20, 80);   // Cámara inundada
    escenaDecision();
  } else if (estado == 5) {
    background(255, 215, 0);  // Oro, éxito
    escenaEscape();
  } else if (estado == 6) {
    background(20);           // Oscuridad
    escenaAtrapado();
  }

  explorador.mostrar();
}

void escenaInicio() {
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text("Inicio de la aventura", width/2, 100);
  text("Presiona cualquier tecla para continuar", width/2, 150);
}

void escenaCamino() {
  fill(255);
  text("Elige tu camino: seguro o peligroso", width/2, 100);
  text("Haz clic para avanzar", width/2, 150);

  fill(100);
  rect(150, 300, 200, 200); // Camino seguro
  rect(450, 300, 200, 200); // Camino peligroso
}

void escenaCofre() {
  fill(255);
  text("Llegas al cofre misterioso", width/2, 100);
  text("Presiona una tecla para decidir si tomarlo", width/2, 150);

  fill(139, 69, 19); // marrón
  rect(width/2 - 50, 350, 100, 60); // Cofre
}

void escenaTrampa() {
  fill(255);
  text("¡Trampa activada!", width/2, 100);
  text("Haz clic para buscar una salida", width/2, 150);

  fill(0, 0, 255, 100);
  ellipse(width/2, height/2 + 100, 300, 100); // Agua subiendo
}

void escenaDecision() {
  fill(255);
  text("¿Qué camino tomas para escapar?", width/2, 100);
  text("Flecha IZQUIERDA o DERECHA", width/2, 150);

  fill(150);
  triangle(200, 400, 170, 450, 230, 450); // Camino 1
  triangle(600, 400, 570, 450, 630, 450); // Camino 2
}

void escenaEscape() {
  fill(0);
  text("¡Escapaste con el tesoro!", width/2, 100);
  fill(255, 223, 0);
  ellipse(width/2, 300, 100, 100); // Tesoro brillante
}

void escenaAtrapado() {
  fill(255);
  text("Quedaste atrapado en la cueva...", width/2, 100);
  fill(100);
  rect(width/2 - 100, 300, 200, 200); // Roca cerrando la salida
}

void keyPressed() { //Cambia de estado al presionar una tecla.
  if (estado == 0) {
    estado = 1;
  } else if (estado == 2) {
    estado = 3;
  } else if (estado == 4) { //Dependiendo de la flecha presionada, se elige el final feliz o triste.
    if (keyCode == LEFT) {
      estado = 5;
    } else if (keyCode == RIGHT) {
      estado = 6;
    }
  }
}

void mousePressed() {
  if (estado == 1) {
    estado = 2;
  } else if (estado == 3) {
    estado = 4;
  }
}

class Explorador {
  float x, y;

  Explorador(float x, float y) {
    this.x = x; //se refiere a la variable del objeto
    this.y = y; //se refiere a la variable del objeto
  }

  void mostrar() {//Define el personaje con una cabeza (círculo) y un cuerpo (rectángulo).
 
    fill(255);
    ellipse(x, y, 50, 50); // Cabeza
    rect(x - 10, y + 25, 20, 40); // Cuerpo
  }
}



//Nicholas Hernandez Salazar 202410196
//Codigo hecho, en parte, con la ayuda de Processing y ChatGPT

 
