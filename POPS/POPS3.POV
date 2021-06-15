#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"

light_source {<-31, 11, -90> color White}
light_source {< 31, 12, -20> color White}

camera
   {
   location  <-1+.75, .1, -2>
   look_at   <0+.75, .5,   0>
   }

#declare Pop1 = union
   {
   cylinder {<0, 0, 0> <0, 1, 0> .04}
   cylinder {<-.25, .5, 0> <.25, .5, 0> .04}
   cylinder {<0, .5, -.25> <0, .5, .25> .04}
   sphere   {<0, .5, -.25> .04}
   sphere   {<0, .5,  .25> .04}
   sphere   {<-.25, .5, 0> .04}
   sphere   {< .25, .5, 0> .04}

   texture {MathR}
   }
        
#declare Pop2 = union
   {
   box {<-.1, 0, -.1> <.1, .02, .1>}
   texture {MathG}
   }


#declare Pop3 = union
   {
   sphere {<0, 1, 0> .25}
   texture {Green_Glass}
   }


#declare Pop = union
   {
   object {Pop1}
   object {Pop2}
   object {Pop3}

   bounded_by {box {<-.3, 0, -.3> <.3, 1.3, .3>}}
   }


#declare xx=.75
#declare PopLine = union
   {
   object {Pop translate <xx*0, 0, 0>}
   object {Pop translate <xx*1, 0, 0>}
   object {Pop translate <xx*2, 0, 0>}
   object {Pop translate <xx*3, 0, 0>}
   object {Pop translate <xx*4, 0, 0>}
   object {Pop translate <xx*5, 0, 0>}
   object {Pop translate <xx*6, 0, 0>}
   object {Pop translate <xx*7, 0, 0>}
   object {Pop translate <xx*8, 0, 0>}
   object {Pop translate <xx*9, 0, 0>}
   }

#declare PopGrid = union
   {
   object {PopLine translate <0, 0, xx*0>}
   object {PopLine translate <0, 0, xx*1>}
   object {PopLine translate <0, 0, xx*2>}
   object {PopLine translate <0, 0, xx*3>}
   object {PopLine translate <0, 0, xx*4>}
   object {PopLine translate <0, 0, xx*5>}
   object {PopLine translate <0, 0, xx*6>}
   object {PopLine translate <0, 0, xx*7>}
   object {PopLine translate <0, 0, xx*8>}
   object {PopLine translate <0, 0, xx*9>}
   }

object
   {
   PopGrid
   }
