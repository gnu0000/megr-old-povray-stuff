#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones1.inc"

/***************************************************************************/

declare wing = difference
   {
   box {<0, 0, -.125> <7/8, 7/8, .125> translate <7/64, 7/64, 0>}
   cylinder {<1/4, 1/4, -1> <1/4, 1/4, 2> 4.5/16}
   cylinder {<1, 1, -1> <1, 1, 2> 3/4}
   texture  
      {
      pigment {Red}
      finish  {Metal ambient 0.2}
      }
   }

declare tear = union
   {
   sphere {<5/32, 5/32, 0> 5/32}
   cone {<0,0,0>, 0  <5/64, 5/64, 0>, .1105}
   texture
      {
      pigment {White}
      finish  {Metal ambient 0.2}
      }
   translate <1/8, 1/8, 0>
   }


declare corner = union
   {
   object {wing}
   object {tear}
   translate <-1/16, -1/16, 0>
   }

declare CloverLogo = union
   {
   object {corner rotate <0, 0, 0>}
   object {corner rotate <0, 0, 90>}
   object {corner rotate <0, 0, -90>}
   object {corner rotate <0, 0, 180>}
   }

/***************************************************************************/

declare GimballArm = intersection
   {
   sphere {<0, 0, 0> 1}
   sphere {<0, 0, 0> .95 inverse}
   plane {x,  .05}
   plane {x, -.05 inverse}
   cylinder {<0, -1.1, 0> <0, 1.1, 0> .1 inverse}
   cylinder {<0, 0, -1.1> <0, 0, 1.1> .1 inverse}
   }

declare GimballCap = intersection
   {
   cylinder {<0, .94, 0> <0, 1.01, 0> .1}
   cylinder {<0, .93, 0> <0, 1.02, 0> .07 inverse}
   texture
      {
      pigment {White}
      finish  {Metal}
      }
   }

declare GimballBody = union
   {
   object {GimballArm rotate <0, 0,  0>}
   object {GimballArm rotate <0, 90, 0>}
   object {GimballArm rotate <0, 0,  90>}
   texture {T_Stone18 scale <.1, .1, .1>}
   }

declare Gimball = union
   {
   object {GimballBody}
   object {GimballCap rotate <0,   0, 0>}
   object {GimballCap rotate <90,  0, 0>}
   object {GimballCap rotate <180, 0, 0>}
   object {GimballCap rotate <270, 0, 0>}
   object {GimballCap rotate <0, 0, 90 >}
   object {GimballCap rotate <0, 0, 270>}
   }

/***************************************************************************/

camera 
   {
   location  <.5,  .8, -6>
   direction <0.0, 0.0, 2>
   up        <0.0, 1.0, 0>
   right     <8/5, 0.0, 0>
   look_at   <0,   0,   0>
   }

light_source { <1, 5, -50.0> colour White }
light_source { <50, 80, -20.0> colour White }
light_source { <-50, 15, -10.0> colour White }

union 
   {
   plane {z, 2.53 rotate -45*y }
   plane {z, 2.53 rotate +45*y }

   pigment { LightGray }
   finish 
      {
      ambient 0.25
      diffuse 0.75
      reflection 0.4
      }
   }


object 
   { 
   Hexagon
   rotate 90.0*z
   scale <1.2, 2.5, 1.2>
   translate -4.1*y
   pigment 
      {
      Sapphire_Agate
      quick_color Red
      }
   finish 
      {
      ambient 0.2
      diffuse 0.75
      reflection 0.85
      }
   }


object 
   {
   Gimball
   scale     <1.1, 1.1, 1.1>
   texture {T_Stone18}
   rotate <0, 0, clock * 90 >
   }

object 
   {
   Gimball
   scale     <1.2, 1.2, 1.2>
   texture {T_Stone18 translate <50, 0, 0>}
   rotate <0, 90 , 0> 
   rotate <clock * 90 , 0, 0>
   }

object
   {
   CloverLogo
   rotate <0, clock * 180, 0>
   }

