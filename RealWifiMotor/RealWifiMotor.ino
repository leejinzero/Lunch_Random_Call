#include <Stepper.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h> 
#include <SoftwareSerial.h>
#define DEBUG true
 
SoftwareSerial esp8266(50,51); // make RX Arduino line is pin 2, make TX Arduino line is pin 3.
                                        // This means that you need to connect the TX line from the esp to the Arduino's pin 2
                                        // and the RX line from the esp to the Arduino's pin 3
 
LiquidCrystal_I2C lcd(0x3F,16,2); 
// set the LCD address to 0x3F for a 16 chars and 2 line display 
const int degree=256;
int i;
Stepper motor12(degree, 11, 9, 10, 8);
Stepper motor36(degree, 25, 23, 24, 22);
Stepper motor45(degree, 29, 27, 28, 26);
Stepper motor78(degree, 33, 31, 32, 30);
Stepper motor90(degree, 37, 35, 36, 34);


void setup() {

  Serial.begin(9600);
  esp8266.begin(9600); // your esp's baud rate might be different
  
  pinMode(8,OUTPUT); 
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(22,OUTPUT);
  pinMode(23,OUTPUT);
  pinMode(24,OUTPUT);
  pinMode(25,OUTPUT);  
  pinMode(26,OUTPUT);
  pinMode(27,OUTPUT);
  pinMode(28,OUTPUT);
  pinMode(29,OUTPUT);
  pinMode(30,OUTPUT);
  pinMode(31,OUTPUT);
  pinMode(32,OUTPUT);
  pinMode(33,OUTPUT);
  pinMode(34,OUTPUT);
  pinMode(35,OUTPUT);
  pinMode(36,OUTPUT);
  pinMode(37,OUTPUT);

  sendData("AT+RST\r\n",2000,DEBUG); // reset module
  sendData("AT+CIOBAUD?\r\n",2000,DEBUG); // check baudrate (redundant)
  sendData("AT+CWMODE=3\r\n",1000,DEBUG); // configure as access point (working mode: AP+STA)
  sendData("AT+CWLAP\r\n",3000,DEBUG); // list available access points
  sendData("AT+CWJAP=\"Treez3\",\"\"\r\n",5000,DEBUG); // join the access point
  sendData("AT+CIFSR\r\n",1000,DEBUG); // get ip address
  sendData("AT+CIPMUX=1\r\n",1000,DEBUG); // configure for multiple connections
  sendData("AT+CIPSERVER=1,80\r\n",1000,DEBUG); // turn on server on port 80
 
  motor12.setSpeed(30);
  motor36.setSpeed(30);
  motor45.setSpeed(30);
  motor78.setSpeed(30);
  motor90.setSpeed(30);

}
void checkNumb(int a) 
{
   switch(a) 
   {
    case 0 : 
    motor90.step(-degree);
    motor90.step(degree);
    break;
    case 1 :
    motor12.step(degree);
    motor12.step(-degree);
    break;
    case 2 :
    motor12.step(-degree);
    motor12.step(degree);
    break;
    case 3 :
    motor36.step(degree);
    motor36.step(-degree);
    break;
    case 4 :
    motor45.step(degree);
    motor45.step(-degree);
    break;
    case 5 :
    motor45.step(-degree);
    motor45.step(degree);
    break;
    case 6 :
    motor36.step(-degree);
    motor36.step(degree);
    break;
    case 7 :
    motor78.step(degree);
    motor78.step(-degree);
    break;
    case 8 :
    motor78.step(-degree);
    motor78.step(degree);
    break;
    case 9 :
    motor90.step(degree);
    motor90.step(-degree);
    break;
    }
}
void loop() {
  //int phoneNum[10];
  if(esp8266.available()) { // check if the esp is sending a message
    if(esp8266.find("+IPD,")) {
      delay(1000); // wait for the serial buffer to fill up (read all the serial data)
      // get the connection id so that we can then disconnect
      int connectionId = esp8266.read()-48; // subtract 48 because the read() function returns 
                                           // the ASCII decimal value and 0 (the first decimal number) starts at 48
      esp8266.find("pin="); // advance cursor to "pin="
      int phoneNum[11];
      int i;
      int p_l=sizeof(phoneNum)/sizeof(int);
 for(i=0;i<p_l;i++)
     {
        phoneNum[i] = ((esp8266.read()-48));
     } 
      //int pinNumber = (esp8266.read()-48)*10; // get first number i.e. if the pin 13 then the 1st number is 1, then multiply to get 10
      //pinNumber += (esp8266.read()-48); // get second number, i.e. if the pin number is 13 then the 2nd number is 3, then add to the first number
       //체크넘 대신 핀넘벼(=폰넘버)가 들어가야한다.
       delay(1000);

         lcd.init(); // initialize the lcd 
// Print a message to the LCD. 
lcd.backlight();
  int j;
  int p_l2=sizeof(phoneNum)/sizeof(int);
  for(j=0; j<p_l2; j++)
  { 
    if(phoneNum[j]<=9&&phoneNum[j]>=0)
    {
    lcd.print(phoneNum[j]);
    }
    else
    break;
  }
       for(i=0;i<p_l;i++)
    {
        if(phoneNum[i]<=9&&phoneNum[i]>=0)
        {
        checkNumb(phoneNum[i]);
        }
            else
    break;
     }
           
      // make close command
      String closeCommand = "AT+CIPCLOSE="; 
      closeCommand+=connectionId; // append connection id
      closeCommand+="\r\n";
      sendData(closeCommand,1000,DEBUG); // close connection
    }
  }

}




String sendData(String command, const int timeout, boolean debug) {
    String response = "";
    esp8266.print(command); // send the read character to the esp8266
    long int time = millis();
    
    while( (time+timeout) > millis()) {
      while(esp8266.available()) {
        // The esp has data so display its output to the serial window 
        char c = esp8266.read(); // read the next character.
        response+=c;
      }
    }
    
    if(debug) {
      Serial.print(response);
    }
    return response;
}
