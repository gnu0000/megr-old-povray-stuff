#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones1.inc"


light_source { <0, 0, 0> colour White }

global_settings { ambient_light rgb<1, 0, 0> }


#declare Z_Stone18 = 
   texture
      {
      pigment  {color SeaGreen}
      finish   {ambient .2 diffuse 0.6 crand 0.03}
      }
   texture 
      {
      T_Grnt22  scale <1.5, 0.7, 0.5> rotate <0, 0, 40>  
      finish {ambient .2}
      }
   texture 
      {
      T_Grnt20a scale <2.5, 2, 0.5>   rotate <0, 0, -50> 
      finish {ambient .2}
      }
   texture 
      {
      T_Crack4  scale <0.7, 1, 1>     rotate <10, 0, -20>
      finish {ambient .2 phong 1.0 phong_size 90}
      }



camera 
   {
   location  <.5,  .8, -6>
   direction <0.0, 0.0, 1.2>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

#declare CountO=0
#while (CountO < 180)

   #declare Count=0
   #while (Count < 3.14159 * 2)
      object
         {
         sphere {<2 * sin (Count), 2 * cos(Count), 0> .25}
         texture {Z_Stone18 scale <3, 3, 3>}
         rotate <0, CountO, 0>
         }
         #declare Count = Count + 3.14159/15
   #end

   #declare CountO = CountO + 20
#end

