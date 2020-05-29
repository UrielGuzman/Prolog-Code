/*Programacion Logica Y Funcional

Presenta:
Guzman Ruiz Edvin Uriel
Pineda Bedolla Sergio 

Utilizamos en este caso para la demostracion solamente un sensor de movimiento
el cual al detectar el movimiento enviara señales a Python, ya que utilizamos
arduino solamente para el envio de señales no es necesario procesarlas aqui
puesto que se prevee que la carga que eso requiere podria alentar el arduino.
*/
const int LEDPin = 13;        // Led aviso
const int PIRPin = 2;         // PIR Out int
 
int pirState = LOW;           // de inicio no hay movimiento
int val = 0;                  // estado del pin

int persona = 1;              //Contador de personas
 
void setup() 
{
   pinMode(LEDPin, OUTPUT); 
   pinMode(PIRPin, INPUT);
   Serial.begin(115200);
}
 
void loop()
{
   val = digitalRead(PIRPin);
   if (val == HIGH)   //si está activado
   { 
      digitalWrite(LEDPin, HIGH);  //LED ON
      if (pirState == LOW)  //si estaba apagado
      {
        //opcional formato json
        //Serial.println("{\"x\":" + (String)persona+ "}");

        Serial.println((String)persona)
        pirState = HIGH;
        persona=persona+1;
      }
   } 
   else   //si esta desactivado
   {
      digitalWrite(LEDPin, LOW); // LED OFF
      if (pirState == HIGH)  //si  estaba encendido
      {
        pirState = LOW;
      }
   }
}
