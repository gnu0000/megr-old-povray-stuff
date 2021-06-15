#include "colors.inc"  
#include "shapes.inc"  
#include "textures.inc"
#include "stones.inc"

camera 
   {
   location  <-1, 0, -25>
   direction <0.0, 0.0, 7.5>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <-1,   0,   0>
   }

light_source {<10, 10,  -20> color White}


declare wing = difference
   {
   box 
      {<0, 0, 0> <7/8, 7/8, .1> translate <7/64, 7/64, 0>}
   cylinder 
      {<1/4, 1/4, -1> <1/4, 1/4, 2> 4.5/16}
   cylinder 
      {<1, 1, -1> <1, 1, 2> 3/4}
   texture
      {
      pigment {Green}
      finish 
         {
         specular 1.0
         roughness 0.05
         ambient 0.2
         diffuse 0.8
         }
      }
   }

declare tear = union
   {
   cylinder 
      {<0, 0, 0> <0, 0, .1> 9/64 translate <9/64, 9/64, 0>}
   box 
      {<0, 0, 0> <9/64, 9/64, .1> }

   translate <1/8, 1/8, 0>

   texture
      {
      pigment {White}
      finish 
         {
         specular 1.0
         roughness 0.05
         ambient 0.2
         diffuse 0.8
         }
      }
   }

declare corner = union
   {
   object {wing }
   object {tear}
   translate <-1/32, -1/32, 0>
   }


#declare mask = height_field 
   {
   gif "bit.gif" 
   }

#declare words = intersection /*union*/
   {
   box {<.001, -.01, .001> <.75, 0, .48>}

   height_field 
      {
      gif "cloverlf.gif"
      scale <1, 50, 1> 
      translate <0, -5, 0> 
//      inverse
      }
   finish {ambient .8}
   pigment {White}
   bounded_by {box {<.001, -.02, .001> <.75, 0, .48>}}
   }


declare CloverLogo = union
   {
   object {corner rotate <0, 0, 0>}
   object {corner rotate <0, 0, 90>}
   object {corner rotate <0, 0, -90>}
   object 
      {
      words  
      rotate <-90, 0, 0>
      scale <4, 1.6, 2>
      translate <-3.1, -.9, 0>
//      translate <.02, .08, 0>
      translate <.0, .09, 0>
      }
   }



object
   {
   CloverLogo
   }

