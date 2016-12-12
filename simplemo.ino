
#include <Stepper.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h> 
LiquidCrystal_I2C lcd(0x3F,16,2); 
// set the LCD address to 0x3F for a 16 chars and 2 line display 
int PhoneNum[] = {4};
const int degree=256;
int i;
Stepper motor12(degree, 11, 9, 10, 8);
Stepper motor36(degree, 25, 23, 24, 22);
Stepper motor45(degree, 29, 27, 28, 26);
Stepper motor78(degree, 33, 31, 32, 30);
Stepper motor90(degree, 37, 35, 36, 34);


void setup() {
  
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
  
  lcd.init(); // initialize the lcd 
// Print a message to the LCD. 
lcd.backlight();
  int i;
  int p_l=sizeof(PhoneNum)/sizeof(int);
  for(i=0; i<p_l; i++)
  { 
    lcd.print(PhoneNum[i]);
  }
  motor12.setSpeed(30);
  motor36.setSpeed(30);
  motor45.setSpeed(30);
  motor78.setSpeed(30);
  motor90.setSpeed(30);
  Serial.begin(9600);
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
    motor78.step(degree);
    motor78.step(-degree);

    break;
    case 9 :
    motor90.step(degree);
    motor90.step(-degree);
    break;
    }
}
void loop() {
 int i;
 int p_l=sizeof(PhoneNum)/sizeof(int);
 delay(3000);
 for(i=0;i<p_l;i++)
 {
  checkNumb(PhoneNum[i]);
 }
 exit(0);
}
