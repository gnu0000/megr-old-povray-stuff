/*
 * EBS - Info Tech animation
 *
 * This is a scene file / script for generating an animation
 *
 * bla bla bla...
 *
 *
 *
 *
 *
 * External Variables used:
 *  @Step - 1 thru 5
 *  @z    - 00 thru # depending on step
 *
 * Internal Variables used that you can change
 *  @boxHeight=   height of bar box around basin
 *  @boxWidth=    width of bar box around basin
 *  @postRadius=  radius of bars
 *
 * Internal variables based on @Step and @z
 *  @lookz - look at z position
 *  @looky - look at y position
 *  @EBSht - height of EBS letters varies from 0 to 10.5
 *  @rot   - rotation of EBS letters           0 to 360
 *  @lens  - lense length                     1.2 to ~1
 *  @xloc  - x location of camera             -28 to -38 to thousands
 *  @yloc  - y location of camera             28 to 8 to hundreds
 *  @zloc  - z location of camera             -30 to -hundreds
 *  @phase - causes wave motions in water     0 to 1
 */

assert {@step 7$@step}   // make sure @step param was on cmd line and <6

#include "Shapes.inc"
#include "Alphabet.inc"
#include "Alphobj.inc"
#include "Colors.inc"
#include "Textures.inc"
#include "Stones.inc"


// you may change these
//
define {@boxHeight=25           }
define {@boxWidth=15            }
define {@postRadius=2           }
define {@stumpHeight=@postRadius}

//
// you may not change these
//
define {@rot=0      @lookz=0  @looky=0 
        @EBSht=10.5 @lens=1.2 @zloc=-30}



/* --- Step 1 Curve (as letters rise) ---
 * call with @step=1 
 * and @z= from 0 to 15
 */ 
define {@step~1 ? @xloc=-28-10*sin(@z/15*pi); // curve camera in a semicircle
                  @yloc=18+10*cos(@z/15*pi);  //
                  @EBSht=@z/2;                // raise up EBS letters
                  @phase=(@z/8)%1}            // animate water ripples

/* --- Step 2 Watch Raise (as letters rise) ---
 * call with @step=2
 * and @z= from 0 to 5
 */
define {@step~2 ? @xloc=-26+@z*2;             // slide camera in front of basin
                  @yloc=8;                    //
                  @EBSht=8+@z/2;              // continue raising EBS letters
                  @phase=(@z/8)%1}            // animate water ripples


/* --- Step 3: Watch Rotate (as letters rotate) ---
 * call with @step=3
 * and @z= from 0 to 17
 */
define {@step~3 ? @xloc=-14+@z*2;             //  slide camera in front of basin
                  @yloc=8;                    //
                  @EBSht=10.5;                //
                  @rot=@z*20;                 // start rotating EBS letters
                  @phase=((@z+6)/8)%1}        // animate water ripples


/* --- Step 4: Accelerate ---
 * call with @step=4
 * and @z= from 0 to 36
 */
define {@step~4 ? @xloc=20+2*(@z+1)^2;        // accelerate camera in x dir
                  @yloc=8+2*(@z/4)^2;         // accel camera slowly in y
                  @zloc=-30-(@z)^2;           // accel camera med in z
                  @rot=@z*20;                 // continue EBS rotations
                  @phase=(@z/8)%1}            // continue ripples


/* --- Step 5: Change View (turn view to the right) ---
 * call with @step=5
 * and @z= from 37 to 57
 */
define {@step~5 ? @xloc=20+2*(@z+1)^2;        // continue x acceleration
                  @yloc=8+2*(@z/4)^2;         // continue y acceleration
                  @zloc=-30-(@z)^2;           // continue z acceleration
                  @rot=@z*20;                 // continue EBS rotations
                  @lens=1.2-(@z-36)/100;      // wide angle lens slowly
                  @lookz=500*(@z-36)}         // shift look at pos in z dir

/* --- Step 6: test ---*/
define {@step~6 ? @xloc=-10;
                  @yloc=9;
                  @zloc=-34
                  @rot=0}



#declare YPost = object
   {
   intersection {Disk_Y}
   texture {color Gray90 reflection 0.5}
   bounded_by{box{<-1.001 -1.001 -1.001> <1.001 1.001 1.001>}}
   scale     <@postRadius @boxHeight/2 @postRadius>
   translate <0 @boxHeight/2 0>
   }

#declare Cap = object 
   {
   quadric {Sphere}
   texture {color Gray90 reflection 0.5}
   scale <@postRadius*3 @postRadius*3 @postRadius*3>
   }

#declare YStump = object
   {
   intersection {Disk_Y}
   texture {color Gray90 reflection 0.5}
   bounded_by{box{<-1.001 -1.001 -1.001> <1.001 1.001 1.001>}}
   scale     <@postRadius+1 @stumpHeight @postRadius+1>
   translate <0 @stumpHeight/2 0>
   }


/*--- camera ---*/
camera 
   { 
   location  <@xloc @yloc @zloc>
   direction <0 0 @lens>
   up        <0 1 0>
   right     <1 0 0>
   look_at   <0 @looky+8 @lookz>
   }


/*--- light ---*/
object {light_source { <21000 68000 -60000> color White }}


/*--- sky ---*/
object 
   {
   quadric { Sphere scale <1 1 1> }
   texture 
      {
      gradient <0 1 0>
      color_map 
         {
         [0 .05 color Black color Black]
	      [.05 .1 color Black color Violet]
	      [.1 .2 color Violet color CadetBlue]
	      [.2 .3 color CadetBlue color Violet]
	      [.3 .4 color Violet color Black]
	      [.4 1 color Black color Black]
         }
      scale <.1 2 .1>
      translate <0 -2 0>
      ambient .6
      diffuse 0
      turbulence .1
      }
   scale <300000 300000 300000>
   rotate <35 0 0> rotate <0 0 25>
   }

/*--- floor ---*/
object 
   {
   plane { <0 1 0> -5000 }
   texture {color Blue reflection 0.3}
   }


//fog {color White 30000}


composite
   {
   /*--- ring ---*/
   object 
      {
      intersection
         {
         intersection {Disk_Y scale <13 1 13>}
         quadric {Cylinder_Y scale <8.5 1 8.5> inverse}
         }
      texture {Stone13}
      }

   /*--- water ---*/
   object 
      {
      intersection {Disk_Y}
      texture {Water  phase @phase}
      scale <9 .25 9>
      }

   /*--- water bottom ---*/
   object 
      {
      intersection {Disk_Y}
      texture {color Blue}
      scale <9 .1 9>
      }

   /*--- GNU letters ---*/
   object 
      {
      LetterG 
      texture {Stone22  scale <.40 .40 .40>} 
      translate <-2.5 0.0 -0.5>
      rotate <0.0 @rot 0.0>
      translate <2.5 0.0 0.5>
      translate <-8.5 -5.5+@EBSht 0> 
      }

   object 
      {
      LetterN 
      texture {Stone22  scale <.40 .40 .40>} 
      translate <-2.5 0.0 -0.5>
      rotate <0.0 @rot 0.0>
      translate <2.5 0.0 0.5>
      translate <-2.5 -5.5+@EBSht 0> 
      }

   object 
      {
      LetterU 
      texture {Stone22  scale <.40 .40 .40>} 
      translate <-2.5 0.0 -0.5>
      rotate <0.0 @rot 0.0>
      translate <2.5 0.0 0.5>
      translate < 3.5 -5.5+@EBSht 0> 
      }


   /*--- Box around basin---*/
   object {YPost translate <@boxWidth  0  @boxWidth> }
   object {YPost translate <-@boxWidth 0  @boxWidth> }
   object {YPost translate <@boxWidth  0  -@boxWidth>}
   object {YPost translate <-@boxWidth 0  -@boxWidth>}

   object {Cap   translate <@boxWidth  @boxHeight @boxWidth> }
   object {Cap   translate <@boxWidth  @boxHeight -@boxWidth>}
   object {Cap   translate <-@boxWidth @boxHeight @boxWidth> }
   object {Cap   translate <-@boxWidth @boxHeight -@boxWidth>}

   object {YStump translate <@boxWidth  0  @boxWidth> }
   object {YStump translate <-@boxWidth 0  @boxWidth> }
   object {YStump translate <@boxWidth  0  -@boxWidth>}
   object {YStump translate <-@boxWidth 0  -@boxWidth>}

   bounded_by
      {
      box
         {
         <-@boxWidth-@postRadius*3 -0.01 -@boxWidth-@postRadius*3>
         <@boxWidth+@postRadius*3 @boxHeight+@postRadius*3 @boxWidth+@postRadius*3>
         }
      }
   } // end composite

object 
   {
   plane {<0 1 0> 0}
//   texture {Grnt22 scale <20 20 20>}
   texture {Blood_Marble scale <20 20 20>}
   }
