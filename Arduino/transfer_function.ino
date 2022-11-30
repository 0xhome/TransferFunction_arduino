//Initialize Variables
int u = 0;
int yk_1 = 0;
int yk_2 = 0;
int uk_1 = 0;
int uk_2 = 0;

float y = 0; //Output Variable

void setup() {
  Serial.begin(9600);
}

void loop() {
  u = analogRead(A0); //Read Analog Value

  float u_terms = 1*u - 2.001*uk_1 + 1*uk_2;
  float y_terms = 2.002*yk_1 - 1*yk_2;
  y = u_terms + y_terms;

  uk_2 = uk_1;  //Input 2 time step in the past
  uk_1 = u;    //Input 1 time step in the past
  
  yk_2 = yk_1;  //Output 2 time step in the past
  yk_1 = y;    //Output 1 time step in the past
  
  Serial.println(y);
  delay(1000);

}
