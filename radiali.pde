  
PrintWriter output,output2;

  
byte[] data = {};
int dataLength = 160;

boolean writeFile =true;
float time = 0;
float radius = 70;
void setup() 
{
  size(160 , 160);
  background(255);
  frameRate(60);
 
  if (writeFile) output = createWriter("positions.txt");
  if (writeFile) output2 = createWriter("positions.dat");
  if (writeFile) output.println("center:"+(float)width/2+","+(float)height/2);
  data = new byte[dataLength];
  frameRate(30);
}

void draw() {
  background(255);
  
  if (writeFile) output.println("time:"+time);
  u(time);
  time=time+0.10;
  if (writeFile) saveBytes("bins/pos"+time+".bin", data);
  data = new byte[dataLength];
  //if (time>5) exit();
  //saveFrame("line"+time+".png");
}

void u(float t) 
{
  int index = 0;
  //c.width=700;
  float p=t*50;
  for(int i=0;i++<80;)
  {
    p+=10+Math.sin((i+t*7)/12.74)*9;
    float q=p/127.4;
      
    color(0);
    line((float)width/2, (float)height/2, width/2+(float)Math.sin(q)*radius, height/2+(float)Math.cos(q)*radius);
    short x1 = (short)(width/2+(float)Math.sin(q)*radius);
    short y1 = (short)(height/2+(float)Math.cos(q)*radius);
    if (x1>255 || y1>255) exit();
    //if (index<1000)
    {
      //data[index++]=(byte)(x1>>8);
      data[index++]=(byte)(x1>>0);
      //data[index++]=(byte)(y1>>8);
      data[index++]=(byte)(y1>>0);
    }
    println("Position: "+x1+" "+ y1);
    if (writeFile) output.println("Position: "+x1+" "+ y1);
   
    
  }
  //x.stroke();
}

void keyPressed() {
  if (writeFile) output.flush(); // Writes the remaining data to the file
  if (writeFile) output.close(); // Finishes the file
   if (writeFile) saveBytes("pos.bin", data);
   if (writeFile) output.close();
  exit(); // Stops the program
}
