#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71,   7, -90> color White}
light_source {< 31,  12, -20> color White}
light_source {< 31, -20, -50> color White}
light_source {<-31, -20, -50> color White}

camera 
   {
   location  <0,    3,    -25>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    -1,   0>
   }

#declare r = 12.7324

#declare BAMS = union
   {
   object {char_B scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 0, 0>} 
   object {char_A scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 1, 0>} 
   object {char_M scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 2, 0>} 
   object {char_S scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 3, 0>} 
   rotate <0, 22.8 * 1.5, 0>      
   translate <0, -2.5, 0>
   scale <1, 8/5, 1>
   }

#declare BAMS2 = union
   {
   object {BAMS translate <0, 0, 0>}
   object {BAMS translate <.0001, .0001, .0001>}
   }

#declare BC = color red .67 green .1665 blue .1341


#declare BAMSTexture = texture
   {
//   pigment 
//      {
//      bozo
//      turbulence 0.5
//      octaves 1
//      scale 0.2
//      color_map 
//         {
//         [0,   0.75 color red 1 filter 0.5 color red 1 filter 1]
//         [0.75, 1   color Clear            color Clear]
//         }
//      }
//   finish {ambient 0.15  diffuse 0.7}
//   scale <3, 3, 3>

   pigment 
      {
      gradient y
      turbulence 2.5
      octaves 2
      color_map 
         {
         [0,   0.6 color BC color BC]
         [0.6, 1   color Clear  color Clear]
         }
      }
   finish
      {
      metallic
      reflection 0.65
      }
   }


intersection
   {
   object {BAMS2}
   sphere {<0, 0, 0> r+0.5}
   sphere {<0, 0, 0> r-0.5 inverse}
   texture {BAMSTexture}

   bounded_by { box {<-10, -4.1, -r-1> <10, 4.1, 0>}}
   }


/* Ground plane */
plane 
   {
   y, -4
   texture 
      {
      finish { crand 0.2 }
      pigment { RichBlue }
      scale <2, 2, 2>
      }
   }

// Sky sphere 
sphere 
   { <0, 0, 0>, 10000
   pigment 
      {
      bozo
      turbulence 0.5
      colour_map 
         {
         [0.0 0.6   colour rgb <.5, .5, 1> color rgb <.5, .5, 1>]
         [0.6 0.8   colour rgb <.5, .5, 1> color White]
         [0.8 1.001 colour White           color rgb <.8, .8, .8>]
         }
      scale <1000.0, 500.0, 1000.0>
      quick_color red 0.5 green 0.5 blue 1.0
      }
   finish 
      {
      Luminous
      ambient 0.8
      diffuse 0.0
      }
   }

//cylinder { <100, 0, -r> <-100, 0, -r> .05 texture {MathG}}
//cylinder { <0, 100, -r> <0, -100, -r> .05 texture {MathG}}
//cylinder { <0, 0, 100> <0, 0, -100>   .05 texture {MathG}}
//cylinder { <100, 4, -r> <-100, 4, -r> .05 texture {MathR}}
//cylinder { <100, -4, -r> <-100, -4, -r> .05 texture {MathR}}

