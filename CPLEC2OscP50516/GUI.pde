void setupGUI()
      {
              //controlP5.setAutoDraw(false);
              
              int locX=20,locY=140,diff=35;
              int blockwidth=120;
              int blockheight=diff-1;
              controlP5= new ControlP5(this);
              controlP5.setFont(myHelvetica12);
              if (Imode)
                  {
                  controlP5.addSlider("Structure Hue",0,360,Hue,locX,40,blockwidth*2,blockheight);              
                  controlP5.addSlider("Structure Saturation",0,100,Saturation,locX,40+diff,blockwidth*2,blockheight);              
                  controlP5.addSlider("Structure Brightness",0,100,Brightness,locX,40+2*diff,blockwidth*2,blockheight);
                  }
              locY+=diff;
              
              controlP5.addToggle("Show Data",locX,locY,blockwidth,blockheight);
              controlP5.controller("Show Data").setColorForeground(#63FF63);
              
              controlP5.addButton("METADATA",1,width-locX-blockwidth,locY,blockwidth,blockheight);
              controlP5.controller("METADATA").setColorForeground(#63FF63);
                      
              locY+=diff;
              
              controlP5.addButton("Python",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("Python").setColorForeground(#FF6363);
              
              controlP5.addButton("STRUCTURE",1,width-locX-blockwidth,locY,blockwidth,blockheight);
              controlP5.controller("STRUCTURE").setColorForeground(#FF6363);
            
                  
              locY+=diff;
              
              controlP5.addButton("ObjectiveC",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("ObjectiveC").setColorForeground(#63FF63);
              
              controlP5.addButton("SNAPSHOT",1,width-locX-blockwidth,locY,blockwidth,blockheight);
              controlP5.controller("SNAPSHOT").setColorForeground(#63FF63);
              
              locY+=diff;
              
              controlP5.addButton("Java",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("Java").setColorForeground(#63FFFF);
              locY+=diff;
              
              controlP5.addButton("JavaScript",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("JavaScript").setColorForeground(#6363FF);
              locY+=diff;
              
              controlP5.addButton("Ruby",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("Ruby").setColorForeground(#FF63FF);
              locY+=diff;
              locY+=diff;
              controlP5.addButton("Reset",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("Reset").setColorForeground(#63FFFF);
              locY+=diff;
              if ( Imode)
                  {
                  controlP5.addButton("View 1",1,locX,locY,blockwidth,blockheight);
                  controlP5.controller("View 1").setColorForeground(#6363FF);
                  locY+=diff;
                  controlP5.addButton("View 2",1,locX,locY,blockwidth,blockheight);
                  controlP5.controller("View 2").setColorForeground(#6363FF);
                  locY+=diff;
                  controlP5.addButton("View 3",1,locX,locY,blockwidth,blockheight);
                  controlP5.controller("View 3").setColorForeground(#6363FF);
                  locY+=diff;
                  controlP5.addButton("View 4",1,locX,locY,blockwidth,blockheight);
                  controlP5.controller("View 4").setColorForeground(#6363FF);
                  }
                  
              locY+=2*diff;
              if ( !Imode)
                  locY+=3*diff;
              controlP5.addButton("i/o mode",1,locX,locY,blockwidth,blockheight);
              controlP5.controller("i/o mode").setColorForeground(#FF0000);
                           
              controlP5.setAutoDraw(false);

        }  

void drawGUI() 
      {
        currCameraMatrix = new PMatrix3D(g3.camera);
        camera();
        controlP5.draw();
        g3.camera = currCameraMatrix;
      }


void controlEvent(ControlEvent theEvent) {
  
                 
                if(theEvent.isController()) {
                   
                  print("control event from : "+theEvent.controller().name());
                  println(", value : "+theEvent.controller().value());
                   
                   if(theEvent.controller().name()=="METADATA") {
                                                              metadataFlag=!metadataFlag;
                                                              }
                   if(theEvent.controller().name()=="STRUCTURE") {
                                                              structureFlag=!structureFlag;
                                                              }
                   if(theEvent.controller().name()=="SNAPSHOT") {
                                                              saveFrame("snapshot.tif");
                                                              println("snap shot taken");
                                                              }                                           
                   if(theEvent.controller().name()=="Python") {
                                                              pythonFlag=!pythonFlag;
                                                              }
                   
                   if(theEvent.controller().name()=="ObjectiveC") {
                                                              objectiveCFlag=!objectiveCFlag;
                                                              }
                                                              
                   if(theEvent.controller().name()=="Java") {
                                                              javaFlag=!javaFlag;
                                                              }
                   
                   if(theEvent.controller().name()=="JavaScript") {
                                                              javaScriptFlag=!javaScriptFlag;
                                                              }
                   
                   if(theEvent.controller().name()=="Ruby") {
                                                              rubyFlag=!rubyFlag;
                                                              }
                   if( Imode)                                           
                     {
                       if(theEvent.controller().name()=="Structure Hue") {
                                                                Hue= theEvent.controller().value();
                                                                }
                     if(theEvent.controller().name()=="Structure Saturation") {
                                                                Saturation=theEvent.controller().value();
                                                                }
                     if(theEvent.controller().name()=="Structure Brightness") {
                                                                Brightness=theEvent.controller().value();
                                                              }      
                     }                                        
                   if(theEvent.controller().name()=="Reset") {
                                                              cam.reset();
                                                              }      
                   if( Imode)
                      {                   
                       if(theEvent.controller().name()=="View 1") {
                                                                  
                                                                  cam.setRotations(-radians(90),0,0);
                                                                  cam.lookAt(0,0,500,500,2000);
                                                                  }       
                       if(theEvent.controller().name()=="View 2") {
                                                                  cam.setRotations(-radians(45),-radians(45),0);
                                                                  cam.lookAt(0,0,800,400,2000);
                                                                  }
                       if(theEvent.controller().name()=="View 3") {
                                                                  cam.setRotations(-radians(45),-radians(45),0);
                                                                  cam.lookAt(-125,75,342,300,3000);
                                                                  }          
                       if(theEvent.controller().name()=="View 4") {
                                                                  
                                                                  cam.lookAt(0,0,500,1000,3000);
                                                                  }   
                                                              
                      }                                      
                   if(theEvent.controller().name()=="i/o mode") {
                                                                         Imode=!Imode;                                                 
                                                                        }                                                     
                   if(theEvent.controller().name()=="Show Data") {
                                                                 if(theEvent.controller().value()==1)
                                                                   {
                                                                   pythonFlag= false;
                                                                   objectiveCFlag= false;
                                                                   javaFlag= false;
                                                                   javaScriptFlag= false;
                                                                   rubyFlag= false;
                                                              
                                                                   } 
                                                                   else
                                                                  {
                                                                    pythonFlag= true;

                                                                   objectiveCFlag= true;
                                                                   javaFlag= true;
                                                                   javaScriptFlag= true;
                                                                   rubyFlag= true;
                                                                    }                  
                                                                 }
                }
}
