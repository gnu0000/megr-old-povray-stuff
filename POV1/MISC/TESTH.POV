
#include "Colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "Textures.inc"
#include "shapes.inc"


/**********************************************************************/
/*                                                                    */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
define {@BarRadius=0.1}
define {@RingWidth=0.2}
define {@RingThickness=0.1}
define {@RingRadius=1}

define {@z=@RingRadius-@RingThickness}
define {@s=@RingWidth/2}


/**********************************************************************/
/*                                                                    */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
camera 
   {
   location  <-2.5 1.5 -6.5>
   direction <0 0 3.2>
   right     <1.1 0 0>
   up        <0 1 0>
   look_at   <0 0 0>
   }

object {light_source {<-10 3 -20> color red 1 green 1 blue 1 }}

object 
   {
   plane {<0 0 1> 0}
   texture 
      {
      mandel <-1.19499  -1.19499+0.0172  0.29543  0.29543+0.0129> 256
      color_map
         {
         [0  .4  color Red color Blue]
         [.4 .6 color Blue color Yellow]
         [.6 .8 color Yellow color Orange]
         [.8  1  color Blue color Green]
         }
      ambient 0.6
      diffuse 0.8
      scale <8 8 8>
      }
   rotate <90 0 0>
   translate <0 -10 0>
   }

/**********************************************************************/
/*                                                                    */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#declare ring = object
   {
   difference
      {       
      intersection
         {
         sphere  {<0 0 0>  @RingRadius}
         plane   {<1 0 0>  @s}
         plane   {<1 0 0>  -@s inverse}
         }
      sphere {<0 0 0> @z}
      }
   }

#declare c1 = color red 0  green  0  blue .7
#declare c2 = color red .7 green  .8 blue 1

#declare unitbar = object
   {
   box {<0 0 0> <1 1 1>} 
   texture
      {
      ambient 0.6
      diffuse 0.7
      specular 0.8
      reflection 0.15
      roughness 0.01
      phong 1 phong_size 400
      metallic
      gradient <1 0 0>
      color_map
         {
         [ 0   .05 color c1 color c1]
         [.05  .25 color c1 color c2]
         [.25  .45 color c2 color c1]
         [.45  .55 color c1 color c1]
         [.55  .75 color c1 color c2]
         [.75  .95 color c2 color c1]
         [.95  1   color c1 color c1]
         }
      }
   }


#declare bar = object
   {
   unitbar
   scale <@RingRadius*2-0.05 @s/2 @s/2>
   translate <-@RingRadius+0.025 -@s/4 -@s/4>
   }


/**********************************************************************/
/*                                                                    */
/*                                                                    */
/*                                                                    */
/**********************************************************************/


/*--- the gyro ---*/
object { ring                   texture {diffuse 0.8 Stone18 ambient 0.8 scale <.3 .3 .3>}}
object { ring rotate <0  90  0> texture {diffuse 0.8 Stone18 ambient 0.8 scale <.3 .3 .3>}}
object { ring rotate <0  0  90> texture {diffuse 0.8 Stone18 ambient 0.8 scale <.3 .3 .3>}}

/*--- the supports ---*/
object { box {<-@s -@s -@s> <@s @s @s> texture {diffuse 0.8 Stone18 ambient 0.8 scale <.3 .3 .3>}}}
object { bar  rotate <0  0   0>}
object { bar  rotate <0  90  0>}
object { bar  rotate <0  0  90>}


