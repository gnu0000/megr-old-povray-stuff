#include "colors.inc"  
#include "shapes.inc"  
#include "textures.inc"
#include "stones.inc"

#include "axis.inc"

#declare steps = 50

max_trace_level 2                  // Use for faster debugging only!
//max_trace_level 4                  // This should be enough for these shapes


/***************************************************************************/

declare wing = difference
   {
   box 
      {<0, 0, -.1> <7/8, 7/8, .1> translate <7/64, 7/64, 0>}
   cylinder 
      {<1/4, 1/4, -1> <1/4, 1/4, 2> 4.5/16}
   cylinder 
      {<1, 1, -1> <1, 1, 2> 3/4}
   texture
      {
      pigment {Green}
      finish  {Metal}
      }
   }

declare tear = union
   {
   cylinder 
      {<0, 0, -.1> <0, 0, .1> 9/64 translate <9/64, 9/64, 0>}
   box 
      {<0, 0, -.1> <9/64, 9/64, .1> }
   translate <1/8, 1/8, 0>
   texture
      {
      pigment {White}
      finish  {Metal}
      }
   }

declare corner = union
   {
   object {wing }
   object {tear}
   translate <-1/32, -1/32, 0>
   }

declare CloverLogo = union
   {
   object {corner rotate <0, 0, 0>}
   object {corner rotate <0, 0, 90>}
   object {corner rotate <0, 0, -90>}
   object {corner rotate <0, 0, 180>}
   scale  <1, 1, 2>
   }

/***************************************************************************/

declare GimballArm = intersection
   {
   sphere {<0, 0, 0> 1}
   sphere {<0, 0, 0> .95 inverse}
   plane {x,  .05}
   plane {x, -.05 inverse}
   }

declare Gimball = union
   {
   object {GimballArm rotate <0, 0,  0>}
   object {GimballArm rotate <0, 90, 0>}
   object {GimballArm rotate <0, 0,  90>}
   texture {Stone18}
   }

/***************************************************************************/
declare Floor1 = texture {Stone8 finish { ambient .1 } scale 0.5}
declare Floor2 = texture {Stone13 finish { phong .3 } scale .2  }

/***************************************************************************/

/*
 * set clock from 0 to 100
 */
camera 
   {
//   location  <.25, 0, -5>
   location  <2, 1.5, -2>
   direction <0.0, 0.0, 1.2>
   up        <0.0, 1.0, 0>
   right     <8/5, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source {<10, 10,  -20> color White}
light_source {<-10, 120,  -30> color White}


plane 
   { y, -1.25
   texture 
      {
      tiles {texture {Floor1} tile2 texture {Floor2}}
      }
   }

object 
   {
   Gimball
   scale     <1.1, 1.1, 1.1>
   texture {Stone18}
   rotate <0, 0, clock * 90 / steps>
   }

object 
   {
   Gimball
   scale     <1.2, 1.2, 1.2>
   texture {Stone18 translate <50, 0, 0>}
   rotate <clock * 90 / steps, 0, 0>
   }

object
   {
   CloverLogo
   rotate <0, clock * 90 / steps, 0>
   }

