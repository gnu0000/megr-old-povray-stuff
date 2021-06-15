/*
 * Table.inc
 *
 * Craig Fitzgerald 5/95
 *
 * Exports: WorkTable
 *
 * This is your standard fold-up work table
 * The units are in inches.
 * The origin is at the left-bottom-front of the table
 * Size 72" wide, 30" deep, 30" tall
 */


#declare TubeTex = texture  
   {
   pigment {Brown}
   finish
      {
      ambient    0.2
      diffuse    0.7
      brilliance 6
      reflection 0.25
      phong      0.75
      phong_size 80
      }
   }


#declare TableTopSlab = union
   {
   union
      {
      cylinder {<0,  0, 0>  <0,  .75, 0>  1.5}
      cylinder {<69, 0, 0>  <69, .75, 0>  1.5}
      cylinder {<0,  0, 27> <0,  .75, 27> 1.5}
      cylinder {<69, 0, 27> <69, .75, 27> 1.5}
      translate <1.5, 0, 1.5>
      }
   box {<1.5, 0, 0> <70.5, .75, 30>}
   box {<0, 0, 1.5> <72, .75, 28.5>}
   bounded_by {box {<0, 0, 0> <72, .75, 30>}}
   }


#declare TableTop = object
   {
   TableTopSlab
   texture {Rosewood rotate <0, 90, 0> scale <8, 8, 8>}
   }


#declare TableTopSupport = difference
   {
   object {TableTopSlab scale <68/72, 2, 26/30>}
   object {TableTopSlab scale <67.5/72, 2.1, 25.5/30> translate <.25, -.05, .25>}
   texture {TubeTex}
   }


#declare TableLegTube = union
   {                                       
   cylinder {<   0,   0, 0> <   0,     3, 0> .5}  // 1st foot
   cylinder {<  22,   0, 0> <  22,     3, 0> .5}  // 2nd foor
   cylinder {< 2.5, 5.5, 0> <19.5,   5.5, 0> .5}  // connector bar
   cylinder {< 6.5, 5.5, 0> < 6.5, 29.25, 0> .5}  // ver bar 1
   cylinder {<15.5, 5.5, 0> <15.5, 29.25, 0> .5}  // ver bar 2
   intersection                                   // rounded corner 1
      {
      torus  {2.5, .5 rotate x*90}
      box {<-3, 0, -.5> <0, 3, .5>}
      translate <2.5, 3, 0>
      }
   intersection                                   // rounded corner 1
      {
      torus  {2.5, .5 rotate x*90}
      box {<0, 0, -.5> <3, 3, .5>}
      translate <19.5, 3, 0>
      }
   texture {TubeTex}
   bounded_by {box {<-.5, -.5, -.5> <22.5, 29.25, .5>}}
   }


#declare TableLegCaps = union
   {
   cylinder {<   0,   0, 0> <   0,   1.3, 0> 5/8} // 1st foot cap
   cylinder {<  22,   0, 0> <  22,   1.3, 0> 5/8} // 2nd foor cap
   texture {TubeTex pigment {NewTan}}
   }


#declare TableLegs = union
   {
   object {TableLegTube}
   object {TableLegCaps}
   }


#declare LegSupport = union
   {
   box {<0, -.375, -.375> <10, .375, .375>}
   box {<0, -.375, -.125> <8,  .375, .125> rotate <0, 150, 0>}
   box {<0, -.375, -.125> <8,  .375, .125> rotate <0, 210, 0>}
   box {<-.1, -.75, -.75> <.1, .75,  .75>}
   translate <-10, 0, 0>
   rotate <0, 0, 45>
   texture {TubeTex}
   }

   
#declare WorkTable = union
   {
   object {TableTop         translate <0, 29.25, 0>}
   object {TableTopSupport  translate <2, 27.75, 2>}
   object {TableLegs  rotate <0, -90, 0> translate <4, 0, 4>}
   object {TableLegs  rotate <0, -90, 0> translate <68, 0, 4>}
   object {LegSupport                    translate <16, 29.25, 15>}
   object {LegSupport rotate <0, 180, 0> translate <72-4-12, 29.25, 15>}
   bounded_by {box {<0, 0, 0> <72, 30, 30>}}
   }

