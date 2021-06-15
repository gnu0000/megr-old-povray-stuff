#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones.inc"

/***************************************************************************/

#declare GlassWing = texture
   {
    pigment {SpringGreen}
//    finish  {Metal}
//   pigment {color red 0.8 green 1 blue 0.55 filter 0.85}
   finish 
      {
      ambient 0.3
      diffuse 0.1
      specular 0.8
      reflection 0.15
      refraction 0.9
      ior 1.45
      roughness 0.0003
      phong 1 phong_size 400
      }
   }

declare wing = difference
   {
   box {<0, 0, -.1> <7/8, 7/8, .1> translate <7/64, 7/64, 0>}
   cylinder {<1/4, 1/4, -1> <1/4, 1/4, 2> 4.5/16}
   cylinder {<1, 1, -1> <1, 1, 2> 3/4}
   texture  {GlassWing}
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
   object {wing }
   object {tear}
//   translate <-1/32, -1/32, 0>
   translate <-1/16, -1/16, 0>
   }

declare CloverLogo = union
   {
   object {corner rotate <0, 0, 0>}
   object {corner rotate <0, 0, 90>}
   object {corner rotate <0, 0, -90>}
   object {corner rotate <0, 0, 180>}
// scale  <1, 1, 2>
   }


camera 
   {
   location  <0.0,  .8, -6>
   direction <0.0, 0.0, 2.9>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }


light_source { <1, 5, -50.0> colour White }
light_source { <50, 80, -20.0> colour White }
light_source { <-50, 15, -10.0> colour White }


sphere
   {
   <0, 0, 0> 1000
   texture
      {
      finish  {ambient 1 diffuse 0}
      pigment {color White}
      }
   }

object
   {
   CloverLogo
   rotate <0, clock * 180, 0>
   }

