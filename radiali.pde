  
PrintWriter output;
boolean writeFile =true;
float time = 0;
float radius = 100;
void setup() {
  size(320, 256);
  background(102);
 frameRate(60);
 
 if (writeFile) output = createWriter("positions.txt");
 if (writeFile) output.println("center:"+(float)width/2+","+(float)height/2);
}

void draw() {
  background(102);
  
  if (writeFile) output.println("time:"+time);
  u(time);
  time=time+0.01;
}

void u(float t) 
{
  //c.width=700;
  float p=t*50;
  for(int i=0;i++<80;)
  {
    p+=10+Math.sin((i+t*7)/12.74)*9;
    float q=p/127.4;
    line((float)width/2, (float)height/2, width/2+(float)Math.sin(q)*radius, height/2+(float)Math.cos(q)*radius);
    if (writeFile) output.println("Position: "+width/2+(float)Math.sin(q)*radius+" "+ height/2+(float)Math.cos(q)*radius);
  }
  //x.stroke();
}

void keyPressed() {
  if (writeFile) output.flush(); // Writes the remaining data to the file
  if (writeFile) output.close(); // Finishes the file
  exit(); // Stops the program
}
