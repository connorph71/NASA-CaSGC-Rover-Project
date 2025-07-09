char guiInput = 'a';

const int RW1 = 13;           //right motors input 1
const int RW2 = 12;           //right motors input 2
const int PWMR = 11;           //speed control for right motors

const int PWML = 10;          //speed control for left motors
const int LW2 = 9;           //left motors input 2
const int LW1 = 8;           //left motors input 1

const int LPIN = 2;
const int switchPin = 7;

const int driveTime = 20;      // milliseconds it takes to move
const int turnTime = 8;        // milliseconds it takes to turn

const int motorSpeed = 255;
bool light = false;

void setup() {
  // put your setup code here, to run once:
  pinMode(switchPin, INPUT_PULLUP);   //set this as a pullup to sense whether the switch is flipped

  //set the motor control pins as outputs
  pinMode(RW1, OUTPUT);
  pinMode(RW2, OUTPUT);
  pinMode(PWMR, OUTPUT);

  pinMode(LW1, OUTPUT);
  pinMode(LW2, OUTPUT);
  pinMode(PWML, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(switchPin) == LOW)
  {
    if(Serial.available())
    {
      guiInput = Serial.read();

      if(guiInput == 'f')
      {
        forward(RW1, RW2, motorSpeed, PWMR);
        forward(LW1, LW2, motorSpeed, PWML);
        delay(750); // time the wheel will spend spinning (milliseconds)
        stopAll();
      } else if(guiInput == 'b')
      {
        backward(RW1, RW2, motorSpeed, PWMR);
        backward(LW1, LW2, motorSpeed, PWML);
        delay(750); // time the wheel will spend spinning (milliseconds)
        stopAll();
      }else if (guiInput == 'r')
      {
        right(255);
      }else if (guiInput == 'l')
      {
        left(255);
  //    }else if (guiInput == 'p')
  //    {
  //      
      }else if (guiInput == 't')
      {
        toggleLight();
      } else
      {
        stopAll();
      }
    }
  }
}


//Movement functions
void forward(int front, int back, int moveSpeed, int power)
{
  digitalWrite(front, HIGH);
  digitalWrite(back, LOW);
  digitalWrite(power, moveSpeed);
}
void backward(int front, int back, int moveSpeed, int power)
{
  digitalWrite(front, LOW);
  digitalWrite(back, HIGH);
  digitalWrite(power, moveSpeed);
}
void right(int motorSpeed)
{
  backward(RW1, RW2, motorSpeed, PWMR);
  forward(LW1, LW2, motorSpeed, PWML);
  delay(500); // time the wheel will spend spinning (milliseconds)
  stopAll();
}
void left(int motorSpeed)
{
  forward(RW1, RW2, motorSpeed, PWMR);
  backward(LW1, LW2, motorSpeed, PWML);
  delay(500); // time the wheel will spend spinning (milliseconds)
  stopAll();
}

//void picture()
//{
//  
//}
void toggleLight()
{
  if(!light)
  {
  digitalWrite(LPIN, HIGH);
  light = true;
  }
  else
  {
    digitalWrite(LPIN, LOW);
    light = false;
  }
}
void stopAll()
{
  digitalWrite(RW1, LOW);
  digitalWrite(RW2, LOW);
  digitalWrite(LW1, LOW);
  digitalWrite(LW2, LOW);
}
