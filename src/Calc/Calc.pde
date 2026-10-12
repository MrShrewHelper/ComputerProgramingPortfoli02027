// David Madden | Sept14 2026 | Calculator
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[]numButtons = new Button[10];
Button[]opButtons = new Button[12];

void setup() {
  size(500, 600);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = '0';
  left = true;
  newEntry = true;

  numButtons[0] = new Button(100.0, 425.0, '0');
  numButtons[1] = new Button(100.0, 200.0, '1');
  numButtons[2] = new Button(175.0, 200.0, '2');
  numButtons[3] = new Button(250.0, 200.0, '3');
  numButtons[4] = new Button(100.0, 275.0, '4');
  numButtons[5] = new Button(175.0, 275.0, '5');
  numButtons[6] = new Button(250.0, 275.0, '6');
  numButtons[7] = new Button(100.0, 350.0, '7');
  numButtons[8] = new Button(175.0, 350.0, '8');
  numButtons[9] = new Button(250.0, 350.0, '9');
  opButtons[0] = new Button(400.0, 200.0, '+');
  opButtons[1] = new Button(400.0, 300.0, '-');
  opButtons[2] = new Button(400.0, 400.0, 'X');
  opButtons[3] = new Button(400.0, 500.0, '÷');
  opButtons[4] = new Button(100.0, 500.0, '±');
  opButtons[5] = new Button(325.0, 500.0, 'C');
  opButtons[6] = new Button(250.0, 500.0, '.');
  opButtons[7] = new Button(175.0, 500.0, '=');
  opButtons[8] = new Button(175.0, 425.0, ' ');
  opButtons[9] = new Button(250.0, 425.0, ' ');
  opButtons[10] = new Button(325.0, 200.0, ' ');
  opButtons[11] = new Button(325.0, 275.0, ' ');
}

void draw () {
  background(255);
  updateDisplay();
  for (int i = 0; i< numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i< opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  rectMode (CENTER);
  textAlign (CENTER);
}

void updateDisplay () {
  // Background shape
  rectMode(CENTER);
  fill(#8D9987);
  rect(250, 100, 400, 50, 20);

  //Overlay text
  fill(255);
  textAlign(RIGHT);
  text(displayVal, 250, 100);
}


void mouseReleased() {
  //update display button mouse click
  if( key == '1') {
  println("You hit 1" + keyCode);
  handleEvent('1', true);
  println("You hit 2" + keyCode);
  handleEvent('2', true);} 
  for (int i = 0; i < numButtons.length; i ++) {
    if (numButtons[i].hover == true) {
      String digit = str(numButtons[i].val);
      handleEvent(numButtons[i].val, true);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
    }
    if (left) {
      l= float(displayVal);
    } else {
      r = float(displayVal);
    }
  }

  for (int i = 0; i< opButtons.length; i++) {
    if (opButtons[i].hover==true) {
      displayVal += str(opButtons[i].val);
      String digt = str(numButtons[i].val);
    
    if (newEntry || displayVal.equals("0.0")) {
        displayVal = digt;
        newEntry = false;
      } else {
        displayVal += digt;
      }
  }
  }

  printState();

  for (int i= 0; i < opButtons.length; i++) {
    if (opButtons [i].hover) {
      char clicked = opButtons[i].val;
      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'X' || clicked == '÷');
     else if(clicked == 'C') {
    displayVal = "0.0";
    }
  }
  }
}
void printState() {
  println(
    "l:" + l +
    "|r:" + r +
    "|result:" + result +
    "| left:" + left +
    "|op:" + op +
    "|display:" + displayVal
    );
}
void performCalc() {
  if (op == '+') {
    result =l + r;
  } else if (op == '-') {
    result =l - r;
  } else if (op == '÷') {
    result =l / r;
  } else if (op == 'X') {
    result =l * r;
  } else return;

  displayVal = str(result);
  l = result;
  r =0.0;
  left = true;
  newEntry = true;
}
void keyPressed() {
if(key == '1') {
println("You pressed 1" + keyCode);
handleEvent('1', true);
}
}
void handleEvent(char val, boolean isNum) {
if(isNum) {
  String digit = str(val);
//stuff
} else {
//other stuff
}
}
