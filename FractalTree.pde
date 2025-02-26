private double fractionLength = .8;
private int smallestBranch = 12;
private double branchAngle = .15;  
public void setup()
{  
  size(640,480);   
  noLoop();
}
public void draw()
{  
  background(#B9EAE6);  
  stroke(#D1A050);  //trunk
  line(320,480,320,380); //trunk of tree
  stroke (0, 255, 0); //color of branch
  drawBranches(320, 380, 100, 3*Math.PI/2); //draws the v branches
  //look at lightning assignment for click
}
public void mousePressed(){
  redraw();
}

public void drawBranches(int x,int y, double branchLength, double angle)
{  
   double angle1, angle2;  
   int endX1, endY1, endX2, endY2;
   angle1 = angle + branchAngle; //creates v shape of branches
   angle2 = angle - branchAngle;
   branchLength = branchLength * fractionLength; //shorter length of new branch
   endX1 = (int)(branchLength * Math.cos(angle1)+x);
   endY1 = (int)(branchLength * Math.sin(angle1)+y);
   endX2 = (int)(branchLength * Math.cos(angle2)+x);
   endY2 = (int)(branchLength * Math.sin(angle2)+y);
   line (x, y, endX1, endY1);
   line (x, y, endX2, endY2);
   if (branchLength > smallestBranch){
     drawBranches(endX1, endY1, branchLength, angle1+(Math.random() * .3)-.1 );
     drawBranches(endX2, endY2, branchLength, angle2-(Math.random() * .3)-.1 );
   }
}
