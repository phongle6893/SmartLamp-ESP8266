
#include <ESP8266WiFi.h>
#include <WiFiClient.h> 
#include <ESP8266WebServer.h>
#include <Firebase.h>
#include <FirebaseArduino.h>

bool flag = false;
bool flag2 = false;
#define FIREBASE_HOST "smartlamp-2a6ac.firebaseio.com"
#define FIREBASE_AUTH ""
/* Set these to your desired credentials. */
const char *ssid = "nkansksdAS";
const char *password = "12345678";

ESP8266WebServer server(80);

/* Just a little test message.  Go to http://192.168.4.1 in a web browser
 * connected to this access point to see it.
 */

void setup() {
  pinMode(13,OUTPUT);
	delay(1000);
	Serial.begin(115200);
	Serial.println();
	Serial.print("Configuring access point...");
	/* You can remove the password parameter if you want the AP to be open. */
	WiFi.softAP(ssid, password);

	IPAddress myIP = WiFi.softAPIP();
	Serial.print("AP IP address: ");
	Serial.println(myIP);
    server.on("/change", []() {
    String ssid2 = server.arg("ssid");
    String password2 = server.arg("pass");
    Serial.print("vo roi ne ");
    WiFi.begin((const char*)ssid2.c_str(), (const char*)password2.c_str());
    server.send(200, "text/plain", "Connected to "+ ssid2);
  });
  WiFi.disconnect(true);
    server.begin();
    

   

}

void loop() {

  if(WiFi.status()== WL_CONNECTED && flag2 == false){
       Serial.println("Okie");
       Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
       flag = true;
       flag2 = true;
    }
  if(flag == true){
        if(Firebase.getInt("/Pods-SI-234/LEDStatus")){
        digitalWrite(13,HIGH);
    }else
    {
      digitalWrite(13,LOW);
    }
  }
	server.handleClient();

}





