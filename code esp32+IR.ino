#include <Wire.h>
#include <FirebaseESP32.h>

//network connection
 // Firebase host
#define FIREBASE_AUTH "GsI6LCQUnaQdcRLlR6vIJX80R8j3BOcVkEONRAan" //Firebase Auth code
#define FIREBASE_HOST "smart-parking-397c4-default-rtdb.asia-southeast1.firebasedatabase.app/"
#define WIFI_SSID "osama"
#define PASSWORD "WEhessien2312000"
//uint8_t arr[4];
FirebaseData fd;

int sensorOne =18;
int sensorTwo =19;
int sensorThree =22;
int sensorFour =23;


//المتغيرات المنطقية
bool sensOneValue = digitalRead(sensorOne);
bool sensTwoValue = digitalRead(sensorTwo);
bool sensThreeValue = digitalRead(sensorThree);
bool sensFourValue = digitalRead(sensorFour);

int data;
void setup() {
pinMode(sensorOne,INPUT);
pinMode(sensorTwo,INPUT);
pinMode(sensorThree,INPUT);
pinMode(sensorFour,INPUT);  
  Serial.begin(115200);
WiFi.begin( WIFI_SSID, PASSWORD);
   Serial.print("Connecting");
   while (WiFi.status() != WL_CONNECTED) {
     Serial.print(".");
     delay(500);
     
     Serial.println();
   Serial.println("Connected to");
   Serial.println(WiFi.localIP());
   Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
   Firebase.reconnectWiFi(true);
   delay(2000);

}
}

void loop() {
 
  // put your main code here, to run repeatedly:
  
 if(digitalRead(sensorOne)==LOW){
   Firebase.setBool(fd,"/Sensor/sensorOne",0);
 }
else 

{
Firebase.setBool(fd,"/Sensor/sensorOne",1);  
}
if(digitalRead(sensorTwo)==LOW){
   Firebase.setBool(fd,"/Sensor/sensorTwo",0);
 }
else 

{
Firebase.setBool(fd,"/Sensor/sensorTwo",1);  
}
if(digitalRead(sensorThree)==LOW){
   Firebase.setBool(fd,"/Sensor/sensorThree",0);
 }
else 

{
Firebase.setBool(fd,"/Sensor/sensorThree",1);  
}
if(digitalRead(sensorFour)==LOW){
   Firebase.setBool(fd,"/Sensor/sensorFour",0);
 }
else 

{
Firebase.setBool(fd,"/Sensor/sensorFour",1);  
}
 
}

 /*
  if(digitalRead(sensorOne)==LOW){
if(Firebase.setInt(fd,"/sensorOne",sensOneValue)){
       
        delay(500);
        }else{
          Serial.println(fd.errorReason());
}    
Serial.println("OneUnavailable");
delay(1000);
  }
else{
if(Firebase.setInt(fd,"/sensorOne",False)){
       
        delay(500);
        }else{
          Serial.println(fd.errorReason());
}      
Serial.println("OneAvailable");
delay(1000);
}
if(digitalRead(sensorTwo)==LOW){
  if(Firebase.setInt(fd,"/sensorTwo",12)){
       
        delay(500);
        }else{
          Serial.println(fd.errorReason());
}    
Serial.println("Two unavailable");
delay(1000);
  }
else{
Serial.println("Two available");
delay(1000);
}
if(digitalRead(sensorThree)==LOW){
  if(Firebase.setInt(fd,"/sensorThree",1)){
        
        delay(500);
        }else{
          Serial.println(fd.errorReason());
}    
Serial.println("Three unavailable");
delay(1000);
  }
else{
Serial.println("Three available");
delay(1000);
}
if(digitalRead(sensorFour)==LOW){
  if(Firebase.setInt(fd,"/sensorFour",0)){
        
        delay(500);
        }else{
          Serial.println(fd.errorReason());
}    
Serial.println("Four unavailable");
delay(1000);
  }
else{
Serial.println("Four available");
delay(1000);
}

  } */  
