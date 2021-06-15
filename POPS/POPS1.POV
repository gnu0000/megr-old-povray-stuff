#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"

light_source {<-31, 11, -90> color White}
light_source {< 31, 12, -20> color White}

camera
   {
   location  <1, 1.3, -2>
   look_at   <0, .5,   0>
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
   texture {MathB}
   }


#declare Pop = union
   {
   object {Pop1}
   object {Pop2}
   object {Pop3}

   bounded_by {box {<-.3, 0, -.3> <.3, 1.3, .3>}}
   }

object
   {
   Pop
   }
