/* Diagnostics */
const boolean diagnostics = false;

/* Constant Variables */
const String Sensor1 = "Temp";
const String Sensor2 = "Moist";
const String Sensor3 = "Batt";

/* Declare variables for communication */
String incoming_msg = "";
boolean start_concatenating = false;
int thisChar;
int counter = 0;
boolean end_of_message = true;
boolean start_transmission = true;

/* Declare flags of sensors */
boolean read_temperature     = false;
boolean read_moisture        = false;
boolean read_battery         = false;

void setup() {
  // Open serial communications:
  Serial.begin(57600);
  read_temperature     = false;
  read_moisture        = false;
  read_battery         = false;

  // send an intro:
  Serial.println("Arduino Serial Communication ON");
  Serial.println();
}

void loop() {
  // get any incoming bytes:
  while (Serial.available() > 0) {
    thisChar = Serial.read();

    if(isAscii(thisChar)) {

      if (start_concatenating == true){
      
        if(isAlphaNumeric(thisChar)){
         
          incoming_msg       += char(thisChar);
          
          if(diagnostics)
            Serial.println(incoming_msg);
        
        }
      
      }
      else{
        
        incoming_msg           = "";
        
      }
      
      if(thisChar == '$'){
        
        start_transmission     = true;
        end_of_message         = false;      
        incoming_msg           = "";
        read_temperature     = false;
        read_moisture        = false;
        read_battery         = false;

      }
      
      if(thisChar == '#' ){

        if( incoming_msg.length() > 0 ){
          
          if ( isAlpha(char(incoming_msg.charAt(0))) ){
            
            if(incoming_msg == Sensor1) {
              
                read_temperature     = true;
                if(diagnostics)
                  Serial.println("Temp true");
            }
            else if (incoming_msg == Sensor2){

                read_moisture        = true;
                if(diagnostics)
                  Serial.println("Moist true");
            }

            else if (incoming_msg == Sensor3){

                read_battery         = true;
                if(diagnostics)
                  Serial.println("Batt true");
            }

          }
          
          incoming_msg = "";
        }
        if(diagnostics)
          Serial.println("Start concatenating");

        start_concatenating    = true;

    
      }
      else if(thisChar == '@'){
        
        if( incoming_msg.length() > 0 ){
          
          if ( isAlpha(char(incoming_msg.charAt(0))) ){
            
            if(incoming_msg == Sensor1) {
              
                read_temperature     = true;
                if(diagnostics)
                  Serial.println("Temp true");
            }
            else if (incoming_msg == Sensor2){

                read_moisture        = true;
                if(diagnostics)
                  Serial.println("Moist true");
            }

            else if (incoming_msg == Sensor3){

                read_battery         = true;
                if(diagnostics)
                  Serial.println("Batt true");
            }

          }
          
          incoming_msg = "";
        }

        start_concatenating    = false;
        end_of_message         = true;
      }
    }
       
  }
  delay(2000);
  if (end_of_message == true && start_transmission == true){
    Serial.println("");
    Serial.println("");
    if(read_temperature){
      
      Serial.println("Read Temperature");
    }
    if(read_moisture){
      
      Serial.println("Read Moisture");
    }
    if(read_battery){
      Serial.println("Read Battery");
    }
    
    
  }

}






