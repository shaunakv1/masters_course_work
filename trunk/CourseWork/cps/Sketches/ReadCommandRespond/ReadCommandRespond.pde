/* Diagnostics */
boolean diagnostics = true;

/* Constant Variables */
const String Sensor1 = "temp";
const String Sensor2 = "moist";
const String Sensor3 = "batt";
const int pin = 0; // analog pin
const int pin1= 2; //analog pin

const int    my_id   = 2;

/* Declare variables for communication */
String incoming_msg = "";
boolean start_concatenating = false;
int thisChar;
int counter = 0;
boolean end_of_message = true;
boolean start_transmission = true;
String returning_msg = "$";

/* Declare flags of sensors */
boolean read_id              = false;
boolean read_temperature     = false;
boolean read_moisture        = false;
boolean read_battery         = false;

/* Variable to respond to request */
int send_msg_counter         = 1;
int temperature_value        = 0;
int moisture_value           = 0;
int my_id_value;



int ReadTemperatureFromSensor()
{
    int samples[8];  
    int tempc = 0;
    int i;
    for(i = 0; i<=7;i++)
    { // gets 8 samples of temperature
    
      samples[i] = ( 3.27 * analogRead(pin) * 100.0) / 1024.0;
      tempc = tempc + samples[i];
//      delay(500);
    }
    
    tempc = tempc/8.0; // better precision
    return tempc;
}

int ReadMoistureFromSensor()
{
  return analogRead(pin1);
}

void setup() {
  // Open serial communications:
  Serial.begin(57600);
  read_id              = false;
  read_temperature     = false;
  read_moisture        = false;
  read_battery         = false;

  // send an intro:
//  if(diagnostics){
//    Serial.println("Arduino Serial Communication ON");
//    Serial.println();
//  }
}

//void SendString(){
//}

void loop() {
  // get any incoming bytes:
  while (Serial.available() > 0) {
    send_msg_counter = 0;
    thisChar = Serial.read();

    if(isAscii(thisChar)) {

      if (start_concatenating == true){
      
        if(isAlphaNumeric(thisChar)){
         
          incoming_msg       += char(thisChar);
          
//          if(diagnostics){
//            Serial.println(incoming_msg);
//          }
        
        }
      
      }
      else{
        
        incoming_msg           = "";
        
      }
      
      if(thisChar == '$'){
        
        start_transmission     = true;
        end_of_message         = false;      
        incoming_msg           = "";
        read_id                = false;
        read_temperature       = false;
        read_moisture          = false;
        read_battery           = false;

      }
      
      if(thisChar == '#' ){
 
        if( incoming_msg.length() > 0 ){
          
          if ( isAlpha(char(incoming_msg.charAt(0))) ){
            
            if(incoming_msg == Sensor1) {
              
                read_temperature     = true;
                
                temperature_value    = ReadTemperatureFromSensor();
                returning_msg        += '#';                
                returning_msg        += temperature_value;
                
//                if(diagnostics){
//                  Serial.println("Temp true1");
//                }
            }
            else if (incoming_msg == Sensor2){
                
                read_moisture        = true;

                moisture_value       = ReadMoistureFromSensor();
                returning_msg        += '#';                
                returning_msg        += moisture_value;

//                if(diagnostics){
//                  Serial.println("Moist true1");
//                }
            }

            else if (incoming_msg == Sensor3){

                read_battery         = true;
//                if(diagnostics){
//                  Serial.println("Batt true1");
//                }
            }

          }
          if( isDigit(char(incoming_msg.charAt(0))) ){
            if(incoming_msg.toInt() == my_id){
              
              read_id              = true;
              my_id_value          = incoming_msg.toInt();
              returning_msg        += '#';
              returning_msg        += my_id_value;
              
//              if(diagnostics){
//                  Serial.println("ID True1");
//              }
              
            }
            
          }
          
          incoming_msg = "";
        }
//        if(diagnostics){
//          Serial.println("Start concatenating");
//        }

        start_concatenating    = true;

    
      }
      else if(thisChar == '@'){
        
        if( incoming_msg.length() > 0 ){
          
          if ( isAlpha(char(incoming_msg.charAt(0))) ){
            
            if(incoming_msg == Sensor1) {
              
                read_temperature     = true;
                temperature_value    = ReadTemperatureFromSensor();
                returning_msg        += '#';                
                returning_msg        += temperature_value;
                
//                if(diagnostics){
//                  Serial.println("Temp true2");
//                }
            }
            else if (incoming_msg == Sensor2){

                read_moisture        = true;
                moisture_value       = ReadMoistureFromSensor();
                returning_msg        += '#';                
                returning_msg        += moisture_value;

//                if(diagnostics){
//                  Serial.println("Moist true2");
//                }
            }

            else if (incoming_msg == Sensor3){

                read_battery         = true;
//                if(diagnostics){
//                  Serial.println("Batt true2");
//                }
            }

          }

          if( isDigit(char(incoming_msg.charAt(0))) ){

            if(incoming_msg.toInt() == my_id){
              read_id              = true;              
              my_id_value          = incoming_msg.toInt();
              returning_msg        += '#';
              returning_msg        += my_id_value;
              
//              if(diagnostics){
//                  Serial.println("ID True2");
//              }
              
            }
            
          }
          
          incoming_msg = "";
        }

        start_concatenating    = false;
        end_of_message         = true;
      }
    }
       
  }
  // End While Loop
  if(send_msg_counter == 0){// Send back data only once
    delay(1000);    
    returning_msg         += '@';  
    send_msg_counter      = 1;    
    if (end_of_message == true && start_transmission == true && read_id == true){
      Serial.print(returning_msg);
      returning_msg         = "$";
//      if(read_temperature){
//        Serial.println("Read Temperature");
//        Serial.println(returning_msg);
//      }
//      if(read_moisture){
//        
//        Serial.println("Read Moisture");
//        Serial.println(returning_msg);        
//      }
//      if(read_battery){
//        Serial.println("Read Battery");
//      }
      
      
    }
    else{
      returning_msg         = "$";
    }

  }

}






