
#include "MeOrion.h"
#include <Wire.h>
String nada;
String angulo;
String comando;

MeEncoderNew motor(0x09, SLOT1); 

void setup()
{
  motor.begin();
  Serial.begin(9600);
}


void loop()
{
delay(50);
 if(Serial.available()){//solo leeremos si hay un byte en el buffer
    
    
    //comando=Serial.read();//leemos el byte
    nada  = Serial.readStringUntil('#');
    comando  = Serial.readStringUntil('#');
    angulo  = Serial.readStringUntil('#');
   
   if(comando=="1"){//Cambiar posición
    float posactual= motor.getCurrentPosition();//Posición en la que se encuentra el motor
    int posnext=(angulo.ToInt());
    float angmov= posnext-posactual;//Giro que va a hacer el motor para llegar a la posición deseada
                                    //Puede ser + o - (El signo indica el sentido del giro)
    motor.moveto(angmov,200); //200 es la velocidad que le hemos puesto, será modificado luego
    delay(100);
    }
    }
    //Falta control P
}



