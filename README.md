

#include "MeOrion.h"
#include <Wire.h>
#include <PinChangeInt.h>
#include <PID_v1.h>

int valor=0;

#define kp 0.15
#define ki 0.0
#define kd 0.0

// I2C
MeEncoderMotor motor1(0x09, SLOT1);   //  Motor at slot1
MeEncoderMotor motor2(0x09, SLOT2);   //  motor at slot2

double posactual =0, salida=0, posnext =0;
PID myPID(&posactual, &salida, &posnext, kp, ki, kd, DIRECT);

void setup(){
  myPID.SetMode(AUTOMATIC);
  myPID.SetSampleTime(1); /*Establece la diferencia de tiempos para los que se obtiene la nueva salida*/
  myPID.SetOutputLimits(-185, 185); /*Límites de la salida (Las señales PWD están limitadas entre este intervalo)*/
  //contador = 0;  
  motor1.begin();
  motor2.begin();
  motor1.reset();
  motor2.reset();

  Serial.begin(9600);
}


void loop(){
  
  String nada;
  String comando;
  String angulo;
//  posactual=50;
//  posnext=30;
  Serial.print("Salida:");Serial.println(salida);
  
  if(Serial.available()){//solo leeremos si hay un byte en el buffer
    
    //comando=Serial.read();//leemos el byte
    nada  = Serial.readStringUntil('#');
    comando  = Serial.readStringUntil('#');
    angulo  = Serial.readStringUntil('#');


    if(comando=="1"){

      //myPID.Compute(); //Genera la acción de control
      posnext=(angulo.toDouble());//Posición a donde se quiere mover el motor enviado por matlab
      Serial.print("Posnext:");Serial.println(posnext);
      
      while ((posactual<1000)){
        double posactual = motor1.getCurrentPosition();//Posición actual del motor
        Serial.print("Posactual:");Serial.println(posactual);
        //Serial.print("Posactual Double:");Serial.println(posactual);
        //double  posnext;
        delay(2000);
        myPID.Compute(); //Genera la acción de control
        delay(2000);
        Serial.print("Salida:");Serial.println(salida);//Este valor no cambia a pesar de que los valores de posactual y posnext son diferentes
        motor1.runSpeed(salida);   
        //salida=0;    
        delay(2000);
        Serial.print("Diferencia de pos:");Serial.println(abs(posnext-posactual));
      }
      motor1.runSpeed(salida);   
    }
    if(comando=="2"){
      valor=(angulo.toInt());//decrementamos 10
      motor2.moveTo(valor, 200);
      delay(2000);
      
       motor2.moveTo(0, 100);
       delay(2000);
    }
    if (comando=="3"){
      motor1.runSpeed(0);  
    }
//    motor1.reset();
//    motor2.reset();
  }

  delay(10);
}//End loop

