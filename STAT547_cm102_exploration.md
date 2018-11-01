STAT 547 Class Meeting 02 Worksheet
================

``` r
suppressPackageStartupMessages(library(tidyverse))
library(gapminder)
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

## Resources

Today’s lesson has been drawn from the following resources:

1.  Mostly [stat545.com: character
    data](http://stat545.com/block028_character-data.html)
      - See the [“Resources”
        section](http://stat545.com/block028_character-data.html#resources)
        for a more comprehensive listing of resources based on the
        character problem you’re facing.
2.  [Older stat545
    notes](http://stat545.com/block022_regular-expression.html)
3.  [r4ds: strings](https://r4ds.had.co.nz/strings.html).
4.  [`stringr`
    vignette](https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html)

## Basic String Manipulation

**Goal**: Go over some basic functionality of `stringr`.

There’s that famous sentence about the quick brown fox that contains all
letters of the alphabet, although I don’t quite remember the sentence.
Demo: Check to see if it’s in the `sentences` data. Try:

`str_detect(string, pattern)`  
`str_subset(string, pattern)`

``` r
sentences #vector of strings
```

    ##   [1] "The birch canoe slid on the smooth planks."               
    ##   [2] "Glue the sheet to the dark blue background."              
    ##   [3] "It's easy to tell the depth of a well."                   
    ##   [4] "These days a chicken leg is a rare dish."                 
    ##   [5] "Rice is often served in round bowls."                     
    ##   [6] "The juice of lemons makes fine punch."                    
    ##   [7] "The box was thrown beside the parked truck."              
    ##   [8] "The hogs were fed chopped corn and garbage."              
    ##   [9] "Four hours of steady work faced us."                      
    ##  [10] "Large size in stockings is hard to sell."                 
    ##  [11] "The boy was there when the sun rose."                     
    ##  [12] "A rod is used to catch pink salmon."                      
    ##  [13] "The source of the huge river is the clear spring."        
    ##  [14] "Kick the ball straight and follow through."               
    ##  [15] "Help the woman get back to her feet."                     
    ##  [16] "A pot of tea helps to pass the evening."                  
    ##  [17] "Smoky fires lack flame and heat."                         
    ##  [18] "The soft cushion broke the man's fall."                   
    ##  [19] "The salt breeze came across from the sea."                
    ##  [20] "The girl at the booth sold fifty bonds."                  
    ##  [21] "The small pup gnawed a hole in the sock."                 
    ##  [22] "The fish twisted and turned on the bent hook."            
    ##  [23] "Press the pants and sew a button on the vest."            
    ##  [24] "The swan dive was far short of perfect."                  
    ##  [25] "The beauty of the view stunned the young boy."            
    ##  [26] "Two blue fish swam in the tank."                          
    ##  [27] "Her purse was full of useless trash."                     
    ##  [28] "The colt reared and threw the tall rider."                
    ##  [29] "It snowed, rained, and hailed the same morning."          
    ##  [30] "Read verse out loud for pleasure."                        
    ##  [31] "Hoist the load to your left shoulder."                    
    ##  [32] "Take the winding path to reach the lake."                 
    ##  [33] "Note closely the size of the gas tank."                   
    ##  [34] "Wipe the grease off his dirty face."                      
    ##  [35] "Mend the coat before you go out."                         
    ##  [36] "The wrist was badly strained and hung limp."              
    ##  [37] "The stray cat gave birth to kittens."                     
    ##  [38] "The young girl gave no clear response."                   
    ##  [39] "The meal was cooked before the bell rang."                
    ##  [40] "What joy there is in living."                             
    ##  [41] "A king ruled the state in the early days."                
    ##  [42] "The ship was torn apart on the sharp reef."               
    ##  [43] "Sickness kept him home the third week."                   
    ##  [44] "The wide road shimmered in the hot sun."                  
    ##  [45] "The lazy cow lay in the cool grass."                      
    ##  [46] "Lift the square stone over the fence."                    
    ##  [47] "The rope will bind the seven books at once."              
    ##  [48] "Hop over the fence and plunge in."                        
    ##  [49] "The friendly gang left the drug store."                   
    ##  [50] "Mesh mire keeps chicks inside."                           
    ##  [51] "The frosty air passed through the coat."                  
    ##  [52] "The crooked maze failed to fool the mouse."               
    ##  [53] "Adding fast leads to wrong sums."                         
    ##  [54] "The show was a flop from the very start."                 
    ##  [55] "A saw is a tool used for making boards."                  
    ##  [56] "The wagon moved on well oiled wheels."                    
    ##  [57] "March the soldiers past the next hill."                   
    ##  [58] "A cup of sugar makes sweet fudge."                        
    ##  [59] "Place a rosebush near the porch steps."                   
    ##  [60] "Both lost their lives in the raging storm."               
    ##  [61] "We talked of the slide show in the circus."               
    ##  [62] "Use a pencil to write the first draft."                   
    ##  [63] "He ran half way to the hardware store."                   
    ##  [64] "The clock struck to mark the third period."               
    ##  [65] "A small creek cut across the field."                      
    ##  [66] "Cars and busses stalled in snow drifts."                  
    ##  [67] "The set of china hit, the floor with a crash."            
    ##  [68] "This is a grand season for hikes on the road."            
    ##  [69] "The dune rose from the edge of the water."                
    ##  [70] "Those words were the cue for the actor to leave."         
    ##  [71] "A yacht slid around the point into the bay."              
    ##  [72] "The two met while playing on the sand."                   
    ##  [73] "The ink stain dried on the finished page."                
    ##  [74] "The walled town was seized without a fight."              
    ##  [75] "The lease ran out in sixteen weeks."                      
    ##  [76] "A tame squirrel makes a nice pet."                        
    ##  [77] "The horn of the car woke the sleeping cop."               
    ##  [78] "The heart beat strongly and with firm strokes."           
    ##  [79] "The pearl was worn in a thin silver ring."                
    ##  [80] "The fruit peel was cut in thick slices."                  
    ##  [81] "The Navy attacked the big task force."                    
    ##  [82] "See the cat glaring at the scared mouse."                 
    ##  [83] "There are more than two factors here."                    
    ##  [84] "The hat brim was wide and too droopy."                    
    ##  [85] "The lawyer tried to lose his case."                       
    ##  [86] "The grass curled around the fence post."                  
    ##  [87] "Cut the pie into large parts."                            
    ##  [88] "Men strive but seldom get rich."                          
    ##  [89] "Always close the barn door tight."                        
    ##  [90] "He lay prone and hardly moved a limb."                    
    ##  [91] "The slush lay deep along the street."                     
    ##  [92] "A wisp of cloud hung in the blue air."                    
    ##  [93] "A pound of sugar costs more than eggs."                   
    ##  [94] "The fin was sharp and cut the clear water."               
    ##  [95] "The play seems dull and quite stupid."                    
    ##  [96] "Bail the boat, to stop it from sinking."                  
    ##  [97] "The term ended in late June that year."                   
    ##  [98] "A tusk is used to make costly gifts."                     
    ##  [99] "Ten pins were set in order."                              
    ## [100] "The bill as paid every third week."                       
    ## [101] "Oak is strong and also gives shade."                      
    ## [102] "Cats and dogs each hate the other."                       
    ## [103] "The pipe began to rust while new."                        
    ## [104] "Open the crate but don't break the glass."                
    ## [105] "Add the sum to the product of these three."               
    ## [106] "Thieves who rob friends deserve jail."                    
    ## [107] "The ripe taste of cheese improves with age."              
    ## [108] "Act on these orders with great speed."                    
    ## [109] "The hog crawled under the high fence."                    
    ## [110] "Move the vat over the hot fire."                          
    ## [111] "The bark of the pine tree was shiny and dark."            
    ## [112] "Leaves turn brown and yellow in the fall."                
    ## [113] "The pennant waved when the wind blew."                    
    ## [114] "Split the log with a quick, sharp blow."                  
    ## [115] "Burn peat after the logs give out."                       
    ## [116] "He ordered peach pie with ice cream."                     
    ## [117] "Weave the carpet on the right hand side."                 
    ## [118] "Hemp is a weed found in parts of the tropics."            
    ## [119] "A lame back kept his score low."                          
    ## [120] "We find joy in the simplest things."                      
    ## [121] "Type out three lists of orders."                          
    ## [122] "The harder he tried the less he got done."                
    ## [123] "The boss ran the show with a watchful eye."               
    ## [124] "The cup cracked and spilled its contents."                
    ## [125] "Paste can cleanse the most dirty brass."                  
    ## [126] "The slang word for raw whiskey is booze."                 
    ## [127] "It caught its hind paw in a rusty trap."                  
    ## [128] "The wharf could be seen at the farther shore."            
    ## [129] "Feel the heat of the weak dying flame."                   
    ## [130] "The tiny girl took off her hat."                          
    ## [131] "A cramp is no small danger on a swim."                    
    ## [132] "He said the same phrase thirty times."                    
    ## [133] "Pluck the bright rose without leaves."                    
    ## [134] "Two plus seven is less than ten."                         
    ## [135] "The glow deepened in the eyes of the sweet girl."         
    ## [136] "Bring your problems to the wise chief."                   
    ## [137] "Write a fond note to the friend you cherish."             
    ## [138] "Clothes and lodging are free to new men."                 
    ## [139] "We frown when events take a bad turn."                    
    ## [140] "Port is a strong wine with s smoky taste."                
    ## [141] "The young kid jumped the rusty gate."                     
    ## [142] "Guess the results from the first scores."                 
    ## [143] "A salt pickle tastes fine with ham."                      
    ## [144] "The just claim got the right verdict."                    
    ## [145] "These thistles bend in a high wind."                      
    ## [146] "Pure bred poodles have curls."                            
    ## [147] "The tree top waved in a graceful way."                    
    ## [148] "The spot on the blotter was made by green ink."           
    ## [149] "Mud was spattered on the front of his white shirt."       
    ## [150] "The cigar burned a hole in the desk top."                 
    ## [151] "The empty flask stood on the tin tray."                   
    ## [152] "A speedy man can beat this track mark."                   
    ## [153] "He broke a new shoelace that day."                        
    ## [154] "The coffee stand is too high for the couch."              
    ## [155] "The urge to write short stories is rare."                 
    ## [156] "The pencils have all been used."                          
    ## [157] "The pirates seized the crew of the lost ship."            
    ## [158] "We tried to replace the coin but failed."                 
    ## [159] "She sewed the torn coat quite neatly."                    
    ## [160] "The sofa cushion is red and of light weight."             
    ## [161] "The jacket hung on the back of the wide chair."           
    ## [162] "At that high level the air is pure."                      
    ## [163] "Drop the two when you add the figures."                   
    ## [164] "A filing case is now hard to buy."                        
    ## [165] "An abrupt start does not win the prize."                  
    ## [166] "Wood is best for making toys and blocks."                 
    ## [167] "The office paint was a dull sad tan."                     
    ## [168] "He knew the skill of the great young actress."            
    ## [169] "A rag will soak up spilled water."                        
    ## [170] "A shower of dirt fell from the hot pipes."                
    ## [171] "Steam hissed from the broken valve."                      
    ## [172] "The child almost hurt the small dog."                     
    ## [173] "There was a sound of dry leaves outside."                 
    ## [174] "The sky that morning was clear and bright blue."          
    ## [175] "Torn scraps littered the stone floor."                    
    ## [176] "Sunday is the best part of the week."                     
    ## [177] "The doctor cured him with these pills."                   
    ## [178] "The new girl was fired today at noon."                    
    ## [179] "They felt gay when the ship arrived in port."             
    ## [180] "Add the store's account to the last cent."                
    ## [181] "Acid burns holes in wool cloth."                          
    ## [182] "Fairy tales should be fun to write."                      
    ## [183] "Eight miles of woodland burned to waste."                 
    ## [184] "The third act was dull and tired the players."            
    ## [185] "A young child should not suffer fright."                  
    ## [186] "Add the column and put the sum here."                     
    ## [187] "We admire and love a good cook."                          
    ## [188] "There the flood mark is ten inches."                      
    ## [189] "He carved a head from the round block of marble."         
    ## [190] "She has st smart way of wearing clothes."                 
    ## [191] "The fruit of a fig tree is apple-shaped."                 
    ## [192] "Corn cobs can be used to kindle a fire."                  
    ## [193] "Where were they when the noise started."                  
    ## [194] "The paper box is full of thumb tacks."                    
    ## [195] "Sell your gift to a buyer at a good gain."                
    ## [196] "The tongs lay beside the ice pail."                       
    ## [197] "The petals fall with the next puff of wind."              
    ## [198] "Bring your best compass to the third class."              
    ## [199] "They could laugh although they were sad."                 
    ## [200] "Farmers came in to thresh the oat crop."                  
    ## [201] "The brown house was on fire to the attic."                
    ## [202] "The lure is used to catch trout and flounder."            
    ## [203] "Float the soap on top of the bath water."                 
    ## [204] "A blue crane is a tall wading bird."                      
    ## [205] "A fresh start will work such wonders."                    
    ## [206] "The club rented the rink for the fifth night."            
    ## [207] "After the dance they went straight home."                 
    ## [208] "The hostess taught the new maid to serve."                
    ## [209] "He wrote his last novel there at the inn."                
    ## [210] "Even the worst will beat his low score."                  
    ## [211] "The cement had dried when he moved it."                   
    ## [212] "The loss of the second ship was hard to take."            
    ## [213] "The fly made its way along the wall."                     
    ## [214] "Do that with a wooden stick."                             
    ## [215] "Lire wires should be kept covered."                       
    ## [216] "The large house had hot water taps."                      
    ## [217] "It is hard to erase blue or red ink."                     
    ## [218] "Write at once or you may forget it."                      
    ## [219] "The doorknob was made of bright clean brass."             
    ## [220] "The wreck occurred by the bank on Main Street."           
    ## [221] "A pencil with black lead writes best."                    
    ## [222] "Coax a young calf to drink from a bucket."                
    ## [223] "Schools for ladies teach charm and grace."                
    ## [224] "The lamp shone with a steady green flame."                
    ## [225] "They took the axe and the saw to the forest."             
    ## [226] "The ancient coin was quite dull and worn."                
    ## [227] "The shaky barn fell with a loud crash."                   
    ## [228] "Jazz and swing fans like fast music."                     
    ## [229] "Rake the rubbish up and then burn it."                    
    ## [230] "Slash the gold cloth into fine ribbons."                  
    ## [231] "Try to have the court decide the case."                   
    ## [232] "They are pushed back each time they attack."              
    ## [233] "He broke his ties with groups of former friends."         
    ## [234] "They floated on the raft to sun their white backs."       
    ## [235] "The map had an X that meant nothing."                     
    ## [236] "Whitings are small fish caught in nets."                  
    ## [237] "Some ads serve to cheat buyers."                          
    ## [238] "Jerk the rope and the bell rings weakly."                 
    ## [239] "A waxed floor makes us lose balance."                     
    ## [240] "Madam, this is the best brand of corn."                   
    ## [241] "On the islands the sea breeze is soft and mild."          
    ## [242] "The play began as soon as we sat down."                   
    ## [243] "This will lead the world to more sound and fury"          
    ## [244] "Add salt before you fry the egg."                         
    ## [245] "The rush for funds reached its peak Tuesday."             
    ## [246] "The birch looked stark white and lonesome."               
    ## [247] "The box is held by a bright red snapper."                 
    ## [248] "To make pure ice, you freeze water."                      
    ## [249] "The first worm gets snapped early."                       
    ## [250] "Jump the fence and hurry up the bank."                    
    ## [251] "Yell and clap as the curtain slides back."                
    ## [252] "They are men nho walk the middle of the road."            
    ## [253] "Both brothers wear the same size."                        
    ## [254] "In some forin or other we need fun."                      
    ## [255] "The prince ordered his head chopped off."                 
    ## [256] "The houses are built of red clay bricks."                 
    ## [257] "Ducks fly north but lack a compass."                      
    ## [258] "Fruit flavors are used in fizz drinks."                   
    ## [259] "These pills do less good than others."                    
    ## [260] "Canned pears lack full flavor."                           
    ## [261] "The dark pot hung in the front closet."                   
    ## [262] "Carry the pail to the wall and spill it there."           
    ## [263] "The train brought our hero to the big town."              
    ## [264] "We are sure that one war is enough."                      
    ## [265] "Gray paint stretched for miles around."                   
    ## [266] "The rude laugh filled the empty room."                    
    ## [267] "High seats are best for football fans."                   
    ## [268] "Tea served from the brown jug is tasty."                  
    ## [269] "A dash of pepper spoils beef stew."                       
    ## [270] "A zestful food is the hot-cross bun."                     
    ## [271] "The horse trotted around the field at a brisk pace."      
    ## [272] "Find the twin who stole the pearl necklace."              
    ## [273] "Cut the cord that binds the box tightly."                 
    ## [274] "The red tape bound the smuggled food."                    
    ## [275] "Look in the corner to find the tan shirt."                
    ## [276] "The cold drizzle will halt the bond drive."               
    ## [277] "Nine men were hired to dig the ruins."                    
    ## [278] "The junk yard had a mouldy smell."                        
    ## [279] "The flint sputtered and lit a pine torch."                
    ## [280] "Soak the cloth and drown the sharp odor."                 
    ## [281] "The shelves were bare of both jam or crackers."           
    ## [282] "A joy to every child is the swan boat."                   
    ## [283] "All sat frozen and watched the screen."                   
    ## [284] "ii cloud of dust stung his tender eyes."                  
    ## [285] "To reach the end he needs much courage."                  
    ## [286] "Shape the clay gently into block form."                   
    ## [287] "The ridge on a smooth surface is a bump or flaw."         
    ## [288] "Hedge apples may stain your hands green."                 
    ## [289] "Quench your thirst, then eat the crackers."               
    ## [290] "Tight curls get limp on rainy days."                      
    ## [291] "The mute muffled the high tones of the horn."             
    ## [292] "The gold ring fits only a pierced ear."                   
    ## [293] "The old pan was covered with hard fudge."                 
    ## [294] "Watch the log float in the wide river."                   
    ## [295] "The node on the stalk of wheat grew daily."               
    ## [296] "The heap of fallen leaves was set on fire."               
    ## [297] "Write fast, if you want to finish early."                 
    ## [298] "His shirt was clean but one button was gone."             
    ## [299] "The barrel of beer was a brew of malt and hops."          
    ## [300] "Tin cans are absent from store shelves."                  
    ## [301] "Slide the box into that empty space."                     
    ## [302] "The plant grew large and green in the window."            
    ## [303] "The beam dropped down on the workmen's head."             
    ## [304] "Pink clouds floated JTith the breeze."                    
    ## [305] "She danced like a swan, tall and graceful."               
    ## [306] "The tube was blown and the tire flat and useless."        
    ## [307] "It is late morning on the old wall clock."                
    ## [308] "Let's all join as we sing the last chorus."               
    ## [309] "The last switch cannot be turned off."                    
    ## [310] "The fight will end in just six minutes."                  
    ## [311] "The store walls were lined with colored frocks."          
    ## [312] "The peace league met to discuss their plans."             
    ## [313] "The rise to fame of a person takes luck."                 
    ## [314] "Paper is scarce, so write with much care."                
    ## [315] "The quick fox jumped on the sleeping cat."                
    ## [316] "The nozzle of the fire hose was bright brass."            
    ## [317] "Screw the round cap on as tight as needed."               
    ## [318] "Time brings us many changes."                             
    ## [319] "The purple tie was ten years old."                        
    ## [320] "Men think and plan and sometimes act."                    
    ## [321] "Fill the ink jar with sticky glue."                       
    ## [322] "He smoke a big pipe with strong contents."                
    ## [323] "We need grain to keep our mules healthy."                 
    ## [324] "Pack the records in a neat thin case."                    
    ## [325] "The crunch of feet in the snow was the only sound."       
    ## [326] "The copper bowl shone in the sun's rays."                 
    ## [327] "Boards will warp unless kept dry."                        
    ## [328] "The plush chair leaned against the wall."                 
    ## [329] "Glass will clink when struck by metal."                   
    ## [330] "Bathe and relax in the cool green grass."                 
    ## [331] "Nine rows of soldiers stood in line."                     
    ## [332] "The beach is dry and shallow at low tide."                
    ## [333] "The idea is to sew both edges straight."                  
    ## [334] "The kitten chased the dog down the street."               
    ## [335] "Pages bound in cloth make a book."                        
    ## [336] "Try to trace the fine lines of the painting."             
    ## [337] "Women form less than half of the group."                  
    ## [338] "The zones merge in the central part of town."             
    ## [339] "A gem in the rough needs work to polish."                 
    ## [340] "Code is used when secrets are sent."                      
    ## [341] "Most of the new is easy for us to hear."                  
    ## [342] "He used the lathe to make brass objects."                 
    ## [343] "The vane on top of the pole revolved in the wind."        
    ## [344] "Mince pie is a dish served to children."                  
    ## [345] "The clan gathered on each dull night."                    
    ## [346] "Let it burn, it gives us warmth and comfort."             
    ## [347] "A castle built from sand fails to endure."                
    ## [348] "A child's wit saved the day for us."                      
    ## [349] "Tack the strip of carpet to the worn floor."              
    ## [350] "Next Tuesday we must vote."                               
    ## [351] "Pour the stew from the pot into the plate."               
    ## [352] "Each penny shone like new."                               
    ## [353] "The man went to the woods to gather sticks."              
    ## [354] "The dirt piles were lines along the road."                
    ## [355] "The logs fell and tumbled into the clear stream."         
    ## [356] "Just hoist it up and take it away,"                       
    ## [357] "A ripe plum is fit for a king's palate."                  
    ## [358] "Our plans right now are hazy."                            
    ## [359] "Brass rings are sold by these natives."                   
    ## [360] "It takes a good trap to capture a bear."                  
    ## [361] "Feed the white mouse some flower seeds."                  
    ## [362] "The thaw came early and freed the stream."                
    ## [363] "He took the lead and kept it the whole distance."         
    ## [364] "The key you designed will fit the lock."                  
    ## [365] "Plead to the council to free the poor thief."             
    ## [366] "Better hash is made of rare beef."                        
    ## [367] "This plank was made for walking on."                      
    ## [368] "The lake sparkled in the red hot sun."                    
    ## [369] "He crawled with care along the ledge."                    
    ## [370] "Tend the sheep while the dog wanders."                    
    ## [371] "It takes a lot of help to finish these."                  
    ## [372] "Mark the spot with a sign painted red."                   
    ## [373] "Take two shares as a fair profit."                        
    ## [374] "The fur of cats goes by many names."                      
    ## [375] "North winds bring colds and fevers."                      
    ## [376] "He asks no person to vouch for him."                      
    ## [377] "Go now and come here later."                              
    ## [378] "A sash of gold silk will trim her dress."                 
    ## [379] "Soap can wash most dirt away."                            
    ## [380] "That move means the game is over."                        
    ## [381] "He wrote down a long list of items."                      
    ## [382] "A siege will crack the strong defense."                   
    ## [383] "Grape juice and water mix well."                          
    ## [384] "Roads are paved with sticky tar."                         
    ## [385] "Fake &ones shine but cost little."                        
    ## [386] "The drip of the rain made a pleasant sound."              
    ## [387] "Smoke poured out of every crack."                         
    ## [388] "Serve the hot rum to the tired heroes."                   
    ## [389] "Much of the story makes good sense."                      
    ## [390] "The sun came up to light the eastern sky."                
    ## [391] "Heave the line over the port side."                       
    ## [392] "A lathe cuts and trims any wood."                         
    ## [393] "It's a dense crowd in two distinct ways."                 
    ## [394] "His hip struck the knee of the next player."              
    ## [395] "The stale smell of old beer lingers."                     
    ## [396] "The desk was firm on the shaky floor."                    
    ## [397] "It takes heat to bring out the odor."                     
    ## [398] "Beef is scarcer than some lamb."                          
    ## [399] "Raise the sail and steer the ship northward."             
    ## [400] "The cone costs five cents on Mondays."                    
    ## [401] "A pod is what peas always grow in."                       
    ## [402] "Jerk the dart from the cork target."                      
    ## [403] "No cement will hold hard wood."                           
    ## [404] "We now have a new base for shipping."                     
    ## [405] "The list of names is carved around the base."             
    ## [406] "The sheep were led home by a dog."                        
    ## [407] "Three for a dime, the young peddler cried."               
    ## [408] "The sense of smell is better than that of touch."         
    ## [409] "No hardship seemed to keep him sad."                      
    ## [410] "Grace makes up for lack of beauty."                       
    ## [411] "Nudge gently but wake her now."                           
    ## [412] "The news struck doubt into restless minds."               
    ## [413] "Once we stood beside the shore."                          
    ## [414] "A chink in the wall allowed a draft to blow."             
    ## [415] "Fasten two pins on each side."                            
    ## [416] "A cold dip restores health and zest."                     
    ## [417] "He takes the oath of office each March."                  
    ## [418] "The sand drifts over the sill of the old house."          
    ## [419] "The point of the steel pen was bent and twisted."         
    ## [420] "There is a lag between thought and act."                  
    ## [421] "Seed is needed to plant the spring corn."                 
    ## [422] "Draw the chart with heavy black lines."                   
    ## [423] "The boy owed his pal thirty cents."                       
    ## [424] "The chap slipped into the crowd and was lost."            
    ## [425] "Hats are worn to tea and not to dinner."                  
    ## [426] "The ramp led up to the wide highway."                     
    ## [427] "Beat the dust from the rug onto the lawn."                
    ## [428] "Say it slow!y but make it ring clear."                    
    ## [429] "The straw nest housed five robins."                       
    ## [430] "Screen the porch with woven straw mats."                  
    ## [431] "This horse will nose his way to the finish."              
    ## [432] "The dry wax protects the deep scratch."                   
    ## [433] "He picked up the dice for a second roll."                 
    ## [434] "These coins will be needed to pay his debt."              
    ## [435] "The nag pulled the frail cart along."                     
    ## [436] "Twist the valve and release hot steam."                   
    ## [437] "The vamp of the shoe had a gold buckle."                  
    ## [438] "The smell of burned rags itches my nose."                 
    ## [439] "Xew pants lack cuffs and pockets."                        
    ## [440] "The marsh will freeze when cold enough."                  
    ## [441] "They slice the sausage thin with a knife."                
    ## [442] "The bloom of the rose lasts a few days."                  
    ## [443] "A gray mare walked before the colt."                      
    ## [444] "Breakfast buns are fine with a hot drink."                
    ## [445] "Bottles hold four kinds of rum."                          
    ## [446] "The man wore a feather in his felt hat."                  
    ## [447] "He wheeled the bike past. the winding road."              
    ## [448] "Drop the ashes on the worn old rug."                      
    ## [449] "The desk and both chairs were painted tan."               
    ## [450] "Throw out the used paper cup and plate."                  
    ## [451] "A clean neck means a neat collar."                        
    ## [452] "The couch cover and hall drapes were blue."               
    ## [453] "The stems of the tall glasses cracked and broke."         
    ## [454] "The wall phone rang loud and often."                      
    ## [455] "The clothes dried on a thin wooden rack."                 
    ## [456] "Turn on the lantern which gives us light."                
    ## [457] "The cleat sank deeply into the soft turf."                
    ## [458] "The bills were mailed promptly on the tenth of the month."
    ## [459] "To have is better than to wait and hope."                 
    ## [460] "The price is fair for a good antique clock."              
    ## [461] "The music played on while they talked."                   
    ## [462] "Dispense with a vest on a day like this."                 
    ## [463] "The bunch of grapes was pressed into wine."               
    ## [464] "He sent the figs, but kept the ripe cherries."            
    ## [465] "The hinge on the door creaked with old age."              
    ## [466] "The screen before the fire kept in the sparks."           
    ## [467] "Fly by night, and you waste little time."                 
    ## [468] "Thick glasses helped him read the print."                 
    ## [469] "Birth and death mark the limits of life."                 
    ## [470] "The chair looked strong but had no bottom."               
    ## [471] "The kite flew wildly in the high wind."                   
    ## [472] "A fur muff is stylish once more."                         
    ## [473] "The tin box held priceless stones."                       
    ## [474] "We need an end of all such matter."                       
    ## [475] "The case was puzzling to the old and wise."               
    ## [476] "The bright lanterns were gay on the dark lawn."           
    ## [477] "We don't get much money but we have fun."                 
    ## [478] "The youth drove with zest, but little skill."             
    ## [479] "Five years he lived with a shaggy dog."                   
    ## [480] "A fence cuts through the corner lot."                     
    ## [481] "The way to save money is not to spend much."              
    ## [482] "Shut the hatch before the waves push it in."              
    ## [483] "The odor of spring makes young hearts jump."              
    ## [484] "Crack the walnut with your sharp side teeth."             
    ## [485] "He offered proof in the form of a lsrge chart."           
    ## [486] "Send the stuff in a thick paper bag."                     
    ## [487] "A quart of milk is water for the most part."              
    ## [488] "They told wild tales to frighten him."                    
    ## [489] "The three story house was built of stone."                
    ## [490] "In the rear of the ground floor was a large passage."     
    ## [491] "A man in a blue sweater sat at the desk."                 
    ## [492] "Oats are a food eaten by horse and man."                  
    ## [493] "Their eyelids droop for want. of sleep."                  
    ## [494] "The sip of tea revives his tired friend."                 
    ## [495] "There are many ways to do these things."                  
    ## [496] "Tuck the sheet under the edge of the mat."                
    ## [497] "A force equal to that would move the earth."              
    ## [498] "We like to see clear weather."                            
    ## [499] "The work of the tailor is seen on each side."             
    ## [500] "Take a chance and win a china doll."                      
    ## [501] "Shake the dust from your shoes, stranger."                
    ## [502] "She was kind to sick old people."                         
    ## [503] "The dusty bench stood by the stone wall."                 
    ## [504] "The square wooden crate was packed to be shipped."        
    ## [505] "We dress to suit the weather of most days."               
    ## [506] "Smile when you say nasty words."                          
    ## [507] "A bowl of rice is free with chicken stew."                
    ## [508] "The water in this well is a source of good health."       
    ## [509] "Take shelter in this tent, but keep still."               
    ## [510] "That guy is the writer of a few banned books."            
    ## [511] "The little tales they tell are false."                    
    ## [512] "The door was barred, locked, and bolted as well."         
    ## [513] "Ripe pears are fit for a queen's table."                  
    ## [514] "A big wet stain was on the round carpet."                 
    ## [515] "The kite dipped and swayed, but stayed aloft."            
    ## [516] "The pleasant hours fly by much too soon."                 
    ## [517] "The room was crowded with a wild mob."                    
    ## [518] "This strong arm shall shield your honor."                 
    ## [519] "She blushed when he gave her a white orchid."             
    ## [520] "The beetle droned in the hot June sun."                   
    ## [521] "Press the pedal with your left foot."                     
    ## [522] "Neat plans fail without luck."                            
    ## [523] "The black trunk fell from the landing."                   
    ## [524] "The bank pressed for payment of the debt."                
    ## [525] "The theft of the pearl pin was kept secret."              
    ## [526] "Shake hands with this friendly child."                    
    ## [527] "The vast space stretched into the far distance."          
    ## [528] "A rich farm is rare in this sandy waste."                 
    ## [529] "His wide grin earned many friends."                       
    ## [530] "Flax makes a fine brand of paper."                        
    ## [531] "Hurdle the pit with the aid of a long pole."              
    ## [532] "A strong bid may scare your partner stiff."               
    ## [533] "Even a just cause needs power to win."                    
    ## [534] "Peep under the tent and see the clowns."                  
    ## [535] "The leaf drifts along with a slow spin."                  
    ## [536] "Cheap clothes are flashy but don??????t last."            
    ## [537] "A thing of small note can cause despair."                 
    ## [538] "Flood the mails with requests for this book."             
    ## [539] "A thick coat of black paint covered all."                 
    ## [540] "The pencil was cut to be sharp at both ends."             
    ## [541] "Those last words were a strong statement."                
    ## [542] "He wrote his name boldly at the top of tile sheet."       
    ## [543] "Dill pickles are sour but taste fine."                    
    ## [544] "Down that road is the way to the grain farmer."           
    ## [545] "Either mud or dust are found at all times."               
    ## [546] "The best method is to fix it in place with clips."        
    ## [547] "If you mumble your speech will be lost."                  
    ## [548] "At night the alarm roused him from a deep sleep."         
    ## [549] "Read just what the meter says."                           
    ## [550] "Fill your pack with bright trinkets for the poor."        
    ## [551] "The small red neon lamp went out."                        
    ## [552] "Clams are small, round, soft, and tasty."                 
    ## [553] "The fan whirled its round blades softly."                 
    ## [554] "The line where the edges join was clean."                 
    ## [555] "Breathe deep and smell the piny air."                     
    ## [556] "It matters not if he reads these words or those."         
    ## [557] "A brown leather bag hung from its strap."                 
    ## [558] "A toad and a frog are hard to tell apart."                
    ## [559] "A white silk jacket goes with any shoes."                 
    ## [560] "A break in the dam almost caused a flood."                
    ## [561] "Paint the sockets in the wall dull green."                
    ## [562] "The child crawled into the dense grass."                  
    ## [563] "Bribes fail where honest men work."                       
    ## [564] "Trample the spark, else the flames will spread."          
    ## [565] "The hilt. of the sword was carved with fine designs."     
    ## [566] "A round hole was drilled through the thin board."         
    ## [567] "Footprints showed the path he took up the beach."         
    ## [568] "She was waiting at my front lawn."                        
    ## [569] "A vent near the edge brought in fresh air."               
    ## [570] "Prod the old mule with a crooked stick."                  
    ## [571] "It is a band of steel three inches wide."                 
    ## [572] "The pipe ran almost the length of the ditch."             
    ## [573] "It was hidden from sight by a mass of leaves and shrubs." 
    ## [574] "The weight. of the package was seen on the high scale."   
    ## [575] "Wake and rise, and step into the green outdoors."         
    ## [576] "The green light in the brown box flickered."              
    ## [577] "The brass tube circled the high wall."                    
    ## [578] "The lobes of her ears were pierced to hold rings."        
    ## [579] "Hold the hammer near the end to drive the nail."          
    ## [580] "Next Sunday is the twelfth of the month."                 
    ## [581] "Every word and phrase he speaks is true."                 
    ## [582] "He put his last cartridge into the gun and fired."        
    ## [583] "They took their kids from the public school."             
    ## [584] "Drive the screw straight into the wood."                  
    ## [585] "Keep the hatch tight and the watch constant."             
    ## [586] "Sever the twine with a quick snip of the knife."          
    ## [587] "Paper will dry out when wet."                             
    ## [588] "Slide the catch back and open the desk."                  
    ## [589] "Help the weak to preserve their strength."                
    ## [590] "A sullen smile gets few friends."                         
    ## [591] "Stop whistling and watch the boys march."                 
    ## [592] "Jerk the cord, and out tumbles the gold."                 
    ## [593] "Slidc the tray across the glass top."                     
    ## [594] "The cloud moved in a stately way and was gone."           
    ## [595] "Light maple makes for a swell room."                      
    ## [596] "Set the piece here and say nothing."                      
    ## [597] "Dull stories make her laugh."                             
    ## [598] "A stiff cord will do to fasten your shoe."                
    ## [599] "Get the trust fund to the bank early."                    
    ## [600] "Choose between the high road and the low."                
    ## [601] "A plea for funds seems to come again."                    
    ## [602] "He lent his coat to the tall gaunt stranger."             
    ## [603] "There is a strong chance it will happen once more."       
    ## [604] "The duke left the park in a silver coach."                
    ## [605] "Greet the new guests and leave quickly."                  
    ## [606] "When the frost has come it is time for turkey."           
    ## [607] "Sweet words work better than fierce."                     
    ## [608] "A thin stripe runs down the middle."                      
    ## [609] "A six comes up more often than a ten."                    
    ## [610] "Lush fern grow on the lofty rocks."                       
    ## [611] "The ram scared the school children off."                  
    ## [612] "The team with the best timing looks good."                
    ## [613] "The farmer swapped his horse for a brown ox."             
    ## [614] "Sit on the perch and tell the others what to do."         
    ## [615] "A steep trail is painful for our feet."                   
    ## [616] "The early phase of life moves fast."                      
    ## [617] "Green moss grows on the northern side."                   
    ## [618] "Tea in thin china has a sweet taste."                     
    ## [619] "Pitch the straw through the door of the stable."          
    ## [620] "The latch on the beck gate needed a nail."                
    ## [621] "The goose was brought straight from the old market."      
    ## [622] "The sink is the thing in which we pile dishes."           
    ## [623] "A whiff of it will cure the most stubborn cold."          
    ## [624] "The facts don\u0092t always show who is right."           
    ## [625] "She flaps her cape as she parades the street."            
    ## [626] "The loss of the cruiser was a blow to the fleet."         
    ## [627] "Loop the braid to the left and then over."                
    ## [628] "Plead with the lawyer to drop the lost cause."            
    ## [629] "Calves thrive on tender spring grass."                    
    ## [630] "Post no bills on this office wall."                       
    ## [631] "Tear a thin sheet from the yellow pad."                   
    ## [632] "A cruise in warm waters in a sleek yacht is fun."         
    ## [633] "A streak of color ran down the left edge."                
    ## [634] "It was done before the boy could see it."                 
    ## [635] "Crouch before you jump or miss the mark."                 
    ## [636] "Pack the kits and don\u0092t forget the salt."            
    ## [637] "The square peg will settle in the round hole."            
    ## [638] "Fine soap saves tender skin."                             
    ## [639] "Poached eggs and tea must suffice."                       
    ## [640] "Bad nerves are jangled by a door slam."                   
    ## [641] "Ship maps are different from those for planes."           
    ## [642] "Dimes showered down from all sides."                      
    ## [643] "They sang the same tunes at each party."                  
    ## [644] "The sky in the west is tinged with orange red."           
    ## [645] "The pods of peas ferment in bare fields."                 
    ## [646] "The horse balked and threw the tall rider."               
    ## [647] "The hitch between the horse and cart broke."              
    ## [648] "Pile the coal high in the shed corner."                   
    ## [649] "The gold vase is both rare and costly."                   
    ## [650] "The knife was hung inside its bright sheath."             
    ## [651] "The rarest spice comes from the far East."                
    ## [652] "The roof should be tilted at a sharp slant."              
    ## [653] "A smatter of French is worse than none."                  
    ## [654] "The mule trod the treadmill day and night."               
    ## [655] "The aim of the contest is to raise a great fund."         
    ## [656] "To send it. now in large amounts is bad."                 
    ## [657] "There is a fine hard tang in salty air."                  
    ## [658] "Cod is the main business of the north shore."             
    ## [659] "The slab was hewn from heavy blocks of slat\u0092e."      
    ## [660] "Dunk the stale biscuits into strong drink."               
    ## [661] "Hang tinsel from both branches."                          
    ## [662] "Cap the jar with a tight brass cover."                    
    ## [663] "The poor boy missed the boat again."                      
    ## [664] "Be sure to set the lamp firmly in the hole."              
    ## [665] "Pick a card and slip it. under the pack."                 
    ## [666] "A round mat will cover the dull spot."                    
    ## [667] "The first part of the plan needs changing."               
    ## [668] "The good book informs of what we ought to know."          
    ## [669] "The mail comes in three batches per day."                 
    ## [670] "You cannot brew tea in a cold pot."                       
    ## [671] "Dots of light betrayed the black cat."                    
    ## [672] "Put the chart on the mantel and tack it down."            
    ## [673] "The night shift men rate extra pay."                      
    ## [674] "The red paper brightened the dim stage."                  
    ## [675] "See the player scoot to third base."                      
    ## [676] "Slide the bill between the two leaves."                   
    ## [677] "Many hands help get the job done."                        
    ## [678] "We don't like to admit our small faults."                 
    ## [679] "No doubt about the way the wind blows."                   
    ## [680] "Dig deep in the earth for pirate's gold."                 
    ## [681] "The steady drip is worse than a drenching rain."          
    ## [682] "A flat pack takes less luggage space."                    
    ## [683] "Green ice frosted the punch bowl."                        
    ## [684] "A stuffed chair slipped from the moving van."             
    ## [685] "The stitch will serve but needs to be shortened."         
    ## [686] "A thin book fits in the side pocket."                     
    ## [687] "The gloss on top made it unfit to read."                  
    ## [688] "The hail pattered on the burnt brown grass."              
    ## [689] "Seven seals were stamped on great sheets."                
    ## [690] "Our troops are set to strike heavy blows."                
    ## [691] "The store was jammed before the sale could start."        
    ## [692] "It was a bad error on the part of the new judge."         
    ## [693] "One step more and the board will collapse."               
    ## [694] "Take the match and strike it against your shoe."          
    ## [695] "The pot boiled, but the contents failed to jell."         
    ## [696] "The baby puts his right foot in his mouth."               
    ## [697] "The bombs left most of the town in ruins."                
    ## [698] "Stop and stare at the hard working man."                  
    ## [699] "The streets are narrow and full of sharp turns."          
    ## [700] "The pup jerked the leash as he saw a feline shape."       
    ## [701] "Open your book to the first page."                        
    ## [702] "Fish evade the net, and swim off."                        
    ## [703] "Dip the pail once and let it settle."                     
    ## [704] "Will you please answer that phone."                       
    ## [705] "The big red apple fell to the ground."                    
    ## [706] "The curtain rose and the show was on."                    
    ## [707] "The young prince became heir to the throne."              
    ## [708] "He sent the boy on a short errand."                       
    ## [709] "Leave now and you will arrive on time."                   
    ## [710] "The corner store was robbed last night."                  
    ## [711] "A gold ring will please most any girl."                   
    ## [712] "The long journey home took a year."                       
    ## [713] "She saw a cat in the neighbor's house."                   
    ## [714] "A pink shell was found on the sandy beach."               
    ## [715] "Small children came to see him."                          
    ## [716] "The grass and bushes were wet with dew."                  
    ## [717] "The blind man counted his old coins."                     
    ## [718] "A severe storm tore down the barn."                       
    ## [719] "She called his name many times."                          
    ## [720] "When you hear the bell, come quickly."

``` r
fox <- str_subset(sentences, pattern = "fox")
fox #only one sentence contains this word
```

    ## [1] "The quick fox jumped on the sleeping cat."

``` r
He <- str_subset(sentences, pattern = "He")
He #several sentences with this word (note: case-sensitive)
```

    ##  [1] "Help the woman get back to her feet."              
    ##  [2] "Her purse was full of useless trash."              
    ##  [3] "He ran half way to the hardware store."            
    ##  [4] "He lay prone and hardly moved a limb."             
    ##  [5] "He ordered peach pie with ice cream."              
    ##  [6] "Hemp is a weed found in parts of the tropics."     
    ##  [7] "He said the same phrase thirty times."             
    ##  [8] "He broke a new shoelace that day."                 
    ##  [9] "He knew the skill of the great young actress."     
    ## [10] "He carved a head from the round block of marble."  
    ## [11] "He wrote his last novel there at the inn."         
    ## [12] "He broke his ties with groups of former friends."  
    ## [13] "Hedge apples may stain your hands green."          
    ## [14] "He smoke a big pipe with strong contents."         
    ## [15] "He used the lathe to make brass objects."          
    ## [16] "He took the lead and kept it the whole distance."  
    ## [17] "He crawled with care along the ledge."             
    ## [18] "He asks no person to vouch for him."               
    ## [19] "He wrote down a long list of items."               
    ## [20] "Heave the line over the port side."                
    ## [21] "He takes the oath of office each March."           
    ## [22] "He picked up the dice for a second roll."          
    ## [23] "He wheeled the bike past. the winding road."       
    ## [24] "He sent the figs, but kept the ripe cherries."     
    ## [25] "He offered proof in the form of a lsrge chart."    
    ## [26] "He wrote his name boldly at the top of tile sheet."
    ## [27] "He put his last cartridge into the gun and fired." 
    ## [28] "Help the weak to preserve their strength."         
    ## [29] "He lent his coat to the tall gaunt stranger."      
    ## [30] "He sent the boy on a short errand."

Not quite the sentence I was thinking of. How many words does it
contain? Use `str_split(string, pattern)`, noting its output
    (list).

``` r
str_split(fox, pattern = " ")[[1]]
```

    ## [1] "The"      "quick"    "fox"      "jumped"   "on"       "the"     
    ## [7] "sleeping" "cat."

``` r
str_split(fox, pattern = " ")[[1]] %>% length()
```

    ## [1] 8

``` r
str_split(sentences, pattern = " ") %>% head()
```

    ## [[1]]
    ## [1] "The"     "birch"   "canoe"   "slid"    "on"      "the"     "smooth" 
    ## [8] "planks."
    ## 
    ## [[2]]
    ## [1] "Glue"        "the"         "sheet"       "to"          "the"        
    ## [6] "dark"        "blue"        "background."
    ## 
    ## [[3]]
    ## [1] "It's"  "easy"  "to"    "tell"  "the"   "depth" "of"    "a"     "well."
    ## 
    ## [[4]]
    ## [1] "These"   "days"    "a"       "chicken" "leg"     "is"      "a"      
    ## [8] "rare"    "dish."  
    ## 
    ## [[5]]
    ## [1] "Rice"   "is"     "often"  "served" "in"     "round"  "bowls."
    ## 
    ## [[6]]
    ## [1] "The"    "juice"  "of"     "lemons" "makes"  "fine"   "punch."

Exercise: does this sentence contain all letters of the alphabet? Hints:

  - Split by `""`.
  - Consider putting all in lowercase with `str_to_lower()`.
  - Use the base R `table()` function.

<!-- end list -->

``` r
fox %>% 
  str_split("") %>% 
  `[[`(1) %>% #subset contents of first vector
  str_to_lower() %>% 
  table()
```

    ## .
    ##   . a c d e f g h i j k l m n o p q s t u x 
    ## 7 1 1 2 1 5 1 1 2 2 1 1 1 1 2 2 2 1 1 3 2 1

Working in a data frame? `tidyr` has its own version of this. Here’s an
example from Resource 1, with the fruit data:

``` r
tibble(fruit)
```

    ## # A tibble: 80 x 1
    ##    fruit       
    ##    <chr>       
    ##  1 apple       
    ##  2 apricot     
    ##  3 avocado     
    ##  4 banana      
    ##  5 bell pepper 
    ##  6 bilberry    
    ##  7 blackberry  
    ##  8 blackcurrant
    ##  9 blood orange
    ## 10 blueberry   
    ## # ... with 70 more rows

``` r
tibble(fruit) %>%
  separate(fruit, into = c("pre", "post"), sep = " ")
```

    ## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 69 rows [1,
    ## 2, 3, 4, 6, 7, 8, 10, 11, 12, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, ...].

    ## # A tibble: 80 x 2
    ##    pre          post  
    ##    <chr>        <chr> 
    ##  1 apple        <NA>  
    ##  2 apricot      <NA>  
    ##  3 avocado      <NA>  
    ##  4 banana       <NA>  
    ##  5 bell         pepper
    ##  6 bilberry     <NA>  
    ##  7 blackberry   <NA>  
    ##  8 blackcurrant <NA>  
    ##  9 blood        orange
    ## 10 blueberry    <NA>  
    ## # ... with 70 more rows

Demo: we can substitute, too. Replace the word “fox” with “giraffe”
using `str_replace(string, pattern, replacement)`:

``` r
fox %>% 
    str_replace(pattern = "fox", replacement = "giraffe")
```

    ## [1] "The quick giraffe jumped on the sleeping cat."

Know the position you want to extract/replace? Try `str_sub()`.

`str_pad()` extends each string to a minimum
    length:

``` r
fruit %>% head
```

    ## [1] "apple"       "apricot"     "avocado"     "banana"      "bell pepper"
    ## [6] "bilberry"

``` r
fruit %>% 
    str_pad(width=7, side="right", pad="$") %>% 
    head()
```

    ## [1] "apple$$"     "apricot"     "avocado"     "banana$"     "bell pepper"
    ## [6] "bilberry"

`str_length()` (Not the same as
    `length()`\!)

``` r
str_length(fruit) #number of characters in each entry
```

    ##  [1]  5  7  7  6 11  8 10 12 12  9 11 10 12 10  9  6 12 10 10  7  9  8  7
    ## [24]  6  4 11  6  8 10  6  3 10 10  5 10  5  8 11  9  6  6 10  7  5  4  6
    ## [47]  6  9  5  8  9  3  5  6  6  6 12  5  4  9  8  9  4 11  6 17  6  6  8
    ## [70]  9 10 10 11  7 10 10  9  9 10 10

``` r
length(fruit)
```

    ## [1] 80

`str_c()` for concatenating strings. Check the docs for an excellent
explanation using a
    matrix.

``` r
words
```

    ##   [1] "a"           "able"        "about"       "absolute"    "accept"     
    ##   [6] "account"     "achieve"     "across"      "act"         "active"     
    ##  [11] "actual"      "add"         "address"     "admit"       "advertise"  
    ##  [16] "affect"      "afford"      "after"       "afternoon"   "again"      
    ##  [21] "against"     "age"         "agent"       "ago"         "agree"      
    ##  [26] "air"         "all"         "allow"       "almost"      "along"      
    ##  [31] "already"     "alright"     "also"        "although"    "always"     
    ##  [36] "america"     "amount"      "and"         "another"     "answer"     
    ##  [41] "any"         "apart"       "apparent"    "appear"      "apply"      
    ##  [46] "appoint"     "approach"    "appropriate" "area"        "argue"      
    ##  [51] "arm"         "around"      "arrange"     "art"         "as"         
    ##  [56] "ask"         "associate"   "assume"      "at"          "attend"     
    ##  [61] "authority"   "available"   "aware"       "away"        "awful"      
    ##  [66] "baby"        "back"        "bad"         "bag"         "balance"    
    ##  [71] "ball"        "bank"        "bar"         "base"        "basis"      
    ##  [76] "be"          "bear"        "beat"        "beauty"      "because"    
    ##  [81] "become"      "bed"         "before"      "begin"       "behind"     
    ##  [86] "believe"     "benefit"     "best"        "bet"         "between"    
    ##  [91] "big"         "bill"        "birth"       "bit"         "black"      
    ##  [96] "bloke"       "blood"       "blow"        "blue"        "board"      
    ## [101] "boat"        "body"        "book"        "both"        "bother"     
    ## [106] "bottle"      "bottom"      "box"         "boy"         "break"      
    ## [111] "brief"       "brilliant"   "bring"       "britain"     "brother"    
    ## [116] "budget"      "build"       "bus"         "business"    "busy"       
    ## [121] "but"         "buy"         "by"          "cake"        "call"       
    ## [126] "can"         "car"         "card"        "care"        "carry"      
    ## [131] "case"        "cat"         "catch"       "cause"       "cent"       
    ## [136] "centre"      "certain"     "chair"       "chairman"    "chance"     
    ## [141] "change"      "chap"        "character"   "charge"      "cheap"      
    ## [146] "check"       "child"       "choice"      "choose"      "Christ"     
    ## [151] "Christmas"   "church"      "city"        "claim"       "class"      
    ## [156] "clean"       "clear"       "client"      "clock"       "close"      
    ## [161] "closes"      "clothe"      "club"        "coffee"      "cold"       
    ## [166] "colleague"   "collect"     "college"     "colour"      "come"       
    ## [171] "comment"     "commit"      "committee"   "common"      "community"  
    ## [176] "company"     "compare"     "complete"    "compute"     "concern"    
    ## [181] "condition"   "confer"      "consider"    "consult"     "contact"    
    ## [186] "continue"    "contract"    "control"     "converse"    "cook"       
    ## [191] "copy"        "corner"      "correct"     "cost"        "could"      
    ## [196] "council"     "count"       "country"     "county"      "couple"     
    ## [201] "course"      "court"       "cover"       "create"      "cross"      
    ## [206] "cup"         "current"     "cut"         "dad"         "danger"     
    ## [211] "date"        "day"         "dead"        "deal"        "dear"       
    ## [216] "debate"      "decide"      "decision"    "deep"        "definite"   
    ## [221] "degree"      "department"  "depend"      "describe"    "design"     
    ## [226] "detail"      "develop"     "die"         "difference"  "difficult"  
    ## [231] "dinner"      "direct"      "discuss"     "district"    "divide"     
    ## [236] "do"          "doctor"      "document"    "dog"         "door"       
    ## [241] "double"      "doubt"       "down"        "draw"        "dress"      
    ## [246] "drink"       "drive"       "drop"        "dry"         "due"        
    ## [251] "during"      "each"        "early"       "east"        "easy"       
    ## [256] "eat"         "economy"     "educate"     "effect"      "egg"        
    ## [261] "eight"       "either"      "elect"       "electric"    "eleven"     
    ## [266] "else"        "employ"      "encourage"   "end"         "engine"     
    ## [271] "english"     "enjoy"       "enough"      "enter"       "environment"
    ## [276] "equal"       "especial"    "europe"      "even"        "evening"    
    ## [281] "ever"        "every"       "evidence"    "exact"       "example"    
    ## [286] "except"      "excuse"      "exercise"    "exist"       "expect"     
    ## [291] "expense"     "experience"  "explain"     "express"     "extra"      
    ## [296] "eye"         "face"        "fact"        "fair"        "fall"       
    ## [301] "family"      "far"         "farm"        "fast"        "father"     
    ## [306] "favour"      "feed"        "feel"        "few"         "field"      
    ## [311] "fight"       "figure"      "file"        "fill"        "film"       
    ## [316] "final"       "finance"     "find"        "fine"        "finish"     
    ## [321] "fire"        "first"       "fish"        "fit"         "five"       
    ## [326] "flat"        "floor"       "fly"         "follow"      "food"       
    ## [331] "foot"        "for"         "force"       "forget"      "form"       
    ## [336] "fortune"     "forward"     "four"        "france"      "free"       
    ## [341] "friday"      "friend"      "from"        "front"       "full"       
    ## [346] "fun"         "function"    "fund"        "further"     "future"     
    ## [351] "game"        "garden"      "gas"         "general"     "germany"    
    ## [356] "get"         "girl"        "give"        "glass"       "go"         
    ## [361] "god"         "good"        "goodbye"     "govern"      "grand"      
    ## [366] "grant"       "great"       "green"       "ground"      "group"      
    ## [371] "grow"        "guess"       "guy"         "hair"        "half"       
    ## [376] "hall"        "hand"        "hang"        "happen"      "happy"      
    ## [381] "hard"        "hate"        "have"        "he"          "head"       
    ## [386] "health"      "hear"        "heart"       "heat"        "heavy"      
    ## [391] "hell"        "help"        "here"        "high"        "history"    
    ## [396] "hit"         "hold"        "holiday"     "home"        "honest"     
    ## [401] "hope"        "horse"       "hospital"    "hot"         "hour"       
    ## [406] "house"       "how"         "however"     "hullo"       "hundred"    
    ## [411] "husband"     "idea"        "identify"    "if"          "imagine"    
    ## [416] "important"   "improve"     "in"          "include"     "income"     
    ## [421] "increase"    "indeed"      "individual"  "industry"    "inform"     
    ## [426] "inside"      "instead"     "insure"      "interest"    "into"       
    ## [431] "introduce"   "invest"      "involve"     "issue"       "it"         
    ## [436] "item"        "jesus"       "job"         "join"        "judge"      
    ## [441] "jump"        "just"        "keep"        "key"         "kid"        
    ## [446] "kill"        "kind"        "king"        "kitchen"     "knock"      
    ## [451] "know"        "labour"      "lad"         "lady"        "land"       
    ## [456] "language"    "large"       "last"        "late"        "laugh"      
    ## [461] "law"         "lay"         "lead"        "learn"       "leave"      
    ## [466] "left"        "leg"         "less"        "let"         "letter"     
    ## [471] "level"       "lie"         "life"        "light"       "like"       
    ## [476] "likely"      "limit"       "line"        "link"        "list"       
    ## [481] "listen"      "little"      "live"        "load"        "local"      
    ## [486] "lock"        "london"      "long"        "look"        "lord"       
    ## [491] "lose"        "lot"         "love"        "low"         "luck"       
    ## [496] "lunch"       "machine"     "main"        "major"       "make"       
    ## [501] "man"         "manage"      "many"        "mark"        "market"     
    ## [506] "marry"       "match"       "matter"      "may"         "maybe"      
    ## [511] "mean"        "meaning"     "measure"     "meet"        "member"     
    ## [516] "mention"     "middle"      "might"       "mile"        "milk"       
    ## [521] "million"     "mind"        "minister"    "minus"       "minute"     
    ## [526] "miss"        "mister"      "moment"      "monday"      "money"      
    ## [531] "month"       "more"        "morning"     "most"        "mother"     
    ## [536] "motion"      "move"        "mrs"         "much"        "music"      
    ## [541] "must"        "name"        "nation"      "nature"      "near"       
    ## [546] "necessary"   "need"        "never"       "new"         "news"       
    ## [551] "next"        "nice"        "night"       "nine"        "no"         
    ## [556] "non"         "none"        "normal"      "north"       "not"        
    ## [561] "note"        "notice"      "now"         "number"      "obvious"    
    ## [566] "occasion"    "odd"         "of"          "off"         "offer"      
    ## [571] "office"      "often"       "okay"        "old"         "on"         
    ## [576] "once"        "one"         "only"        "open"        "operate"    
    ## [581] "opportunity" "oppose"      "or"          "order"       "organize"   
    ## [586] "original"    "other"       "otherwise"   "ought"       "out"        
    ## [591] "over"        "own"         "pack"        "page"        "paint"      
    ## [596] "pair"        "paper"       "paragraph"   "pardon"      "parent"     
    ## [601] "park"        "part"        "particular"  "party"       "pass"       
    ## [606] "past"        "pay"         "pence"       "pension"     "people"     
    ## [611] "per"         "percent"     "perfect"     "perhaps"     "period"     
    ## [616] "person"      "photograph"  "pick"        "picture"     "piece"      
    ## [621] "place"       "plan"        "play"        "please"      "plus"       
    ## [626] "point"       "police"      "policy"      "politic"     "poor"       
    ## [631] "position"    "positive"    "possible"    "post"        "pound"      
    ## [636] "power"       "practise"    "prepare"     "present"     "press"      
    ## [641] "pressure"    "presume"     "pretty"      "previous"    "price"      
    ## [646] "print"       "private"     "probable"    "problem"     "proceed"    
    ## [651] "process"     "produce"     "product"     "programme"   "project"    
    ## [656] "proper"      "propose"     "protect"     "provide"     "public"     
    ## [661] "pull"        "purpose"     "push"        "put"         "quality"    
    ## [666] "quarter"     "question"    "quick"       "quid"        "quiet"      
    ## [671] "quite"       "radio"       "rail"        "raise"       "range"      
    ## [676] "rate"        "rather"      "read"        "ready"       "real"       
    ## [681] "realise"     "really"      "reason"      "receive"     "recent"     
    ## [686] "reckon"      "recognize"   "recommend"   "record"      "red"        
    ## [691] "reduce"      "refer"       "regard"      "region"      "relation"   
    ## [696] "remember"    "report"      "represent"   "require"     "research"   
    ## [701] "resource"    "respect"     "responsible" "rest"        "result"     
    ## [706] "return"      "rid"         "right"       "ring"        "rise"       
    ## [711] "road"        "role"        "roll"        "room"        "round"      
    ## [716] "rule"        "run"         "safe"        "sale"        "same"       
    ## [721] "saturday"    "save"        "say"         "scheme"      "school"     
    ## [726] "science"     "score"       "scotland"    "seat"        "second"     
    ## [731] "secretary"   "section"     "secure"      "see"         "seem"       
    ## [736] "self"        "sell"        "send"        "sense"       "separate"   
    ## [741] "serious"     "serve"       "service"     "set"         "settle"     
    ## [746] "seven"       "sex"         "shall"       "share"       "she"        
    ## [751] "sheet"       "shoe"        "shoot"       "shop"        "short"      
    ## [756] "should"      "show"        "shut"        "sick"        "side"       
    ## [761] "sign"        "similar"     "simple"      "since"       "sing"       
    ## [766] "single"      "sir"         "sister"      "sit"         "site"       
    ## [771] "situate"     "six"         "size"        "sleep"       "slight"     
    ## [776] "slow"        "small"       "smoke"       "so"          "social"     
    ## [781] "society"     "some"        "son"         "soon"        "sorry"      
    ## [786] "sort"        "sound"       "south"       "space"       "speak"      
    ## [791] "special"     "specific"    "speed"       "spell"       "spend"      
    ## [796] "square"      "staff"       "stage"       "stairs"      "stand"      
    ## [801] "standard"    "start"       "state"       "station"     "stay"       
    ## [806] "step"        "stick"       "still"       "stop"        "story"      
    ## [811] "straight"    "strategy"    "street"      "strike"      "strong"     
    ## [816] "structure"   "student"     "study"       "stuff"       "stupid"     
    ## [821] "subject"     "succeed"     "such"        "sudden"      "suggest"    
    ## [826] "suit"        "summer"      "sun"         "sunday"      "supply"     
    ## [831] "support"     "suppose"     "sure"        "surprise"    "switch"     
    ## [836] "system"      "table"       "take"        "talk"        "tape"       
    ## [841] "tax"         "tea"         "teach"       "team"        "telephone"  
    ## [846] "television"  "tell"        "ten"         "tend"        "term"       
    ## [851] "terrible"    "test"        "than"        "thank"       "the"        
    ## [856] "then"        "there"       "therefore"   "they"        "thing"      
    ## [861] "think"       "thirteen"    "thirty"      "this"        "thou"       
    ## [866] "though"      "thousand"    "three"       "through"     "throw"      
    ## [871] "thursday"    "tie"         "time"        "to"          "today"      
    ## [876] "together"    "tomorrow"    "tonight"     "too"         "top"        
    ## [881] "total"       "touch"       "toward"      "town"        "trade"      
    ## [886] "traffic"     "train"       "transport"   "travel"      "treat"      
    ## [891] "tree"        "trouble"     "true"        "trust"       "try"        
    ## [896] "tuesday"     "turn"        "twelve"      "twenty"      "two"        
    ## [901] "type"        "under"       "understand"  "union"       "unit"       
    ## [906] "unite"       "university"  "unless"      "until"       "up"         
    ## [911] "upon"        "use"         "usual"       "value"       "various"    
    ## [916] "very"        "video"       "view"        "village"     "visit"      
    ## [921] "vote"        "wage"        "wait"        "walk"        "wall"       
    ## [926] "want"        "war"         "warm"        "wash"        "waste"      
    ## [931] "watch"       "water"       "way"         "we"          "wear"       
    ## [936] "wednesday"   "wee"         "week"        "weigh"       "welcome"    
    ## [941] "well"        "west"        "what"        "when"        "where"      
    ## [946] "whether"     "which"       "while"       "white"       "who"        
    ## [951] "whole"       "why"         "wide"        "wife"        "will"       
    ## [956] "win"         "wind"        "window"      "wish"        "with"       
    ## [961] "within"      "without"     "woman"       "wonder"      "wood"       
    ## [966] "word"        "work"        "world"       "worry"       "worse"      
    ## [971] "worth"       "would"       "write"       "wrong"       "year"       
    ## [976] "yes"         "yesterday"   "yet"         "you"         "young"

``` r
str_c(words[1:4], words[5:8], sep=" & ")
```

    ## [1] "a & accept"        "able & account"    "about & achieve"  
    ## [4] "absolute & across"

``` r
str_c(words[3:4], words[5:8], sep=" & ") #note recycling because of vectorization
```

    ## [1] "about & accept"     "absolute & account" "about & achieve"   
    ## [4] "absolute & across"

``` r
str_c(words[3:4], words[5:8], sep=" & ", collapse=", ") #now it's a vector of length 1
```

    ## [1] "about & accept, absolute & account, about & achieve, absolute & across"

There’s a (more limited) `tidyr` version. Straight from Resource 1:

``` r
fruit
```

    ##  [1] "apple"             "apricot"           "avocado"          
    ##  [4] "banana"            "bell pepper"       "bilberry"         
    ##  [7] "blackberry"        "blackcurrant"      "blood orange"     
    ## [10] "blueberry"         "boysenberry"       "breadfruit"       
    ## [13] "canary melon"      "cantaloupe"        "cherimoya"        
    ## [16] "cherry"            "chili pepper"      "clementine"       
    ## [19] "cloudberry"        "coconut"           "cranberry"        
    ## [22] "cucumber"          "currant"           "damson"           
    ## [25] "date"              "dragonfruit"       "durian"           
    ## [28] "eggplant"          "elderberry"        "feijoa"           
    ## [31] "fig"               "goji berry"        "gooseberry"       
    ## [34] "grape"             "grapefruit"        "guava"            
    ## [37] "honeydew"          "huckleberry"       "jackfruit"        
    ## [40] "jambul"            "jujube"            "kiwi fruit"       
    ## [43] "kumquat"           "lemon"             "lime"             
    ## [46] "loquat"            "lychee"            "mandarine"        
    ## [49] "mango"             "mulberry"          "nectarine"        
    ## [52] "nut"               "olive"             "orange"           
    ## [55] "pamelo"            "papaya"            "passionfruit"     
    ## [58] "peach"             "pear"              "persimmon"        
    ## [61] "physalis"          "pineapple"         "plum"             
    ## [64] "pomegranate"       "pomelo"            "purple mangosteen"
    ## [67] "quince"            "raisin"            "rambutan"         
    ## [70] "raspberry"         "redcurrant"        "rock melon"       
    ## [73] "salal berry"       "satsuma"           "star fruit"       
    ## [76] "strawberry"        "tamarillo"         "tangerine"        
    ## [79] "ugli fruit"        "watermelon"

``` r
fruit_df <- tibble(
  fruit1 = fruit[1:4],
  fruit2 = fruit[5:8]
)
fruit_df
```

    ## # A tibble: 4 x 2
    ##   fruit1  fruit2      
    ##   <chr>   <chr>       
    ## 1 apple   bell pepper 
    ## 2 apricot bilberry    
    ## 3 avocado blackberry  
    ## 4 banana  blackcurrant

``` r
fruit_df %>% 
  unite("flavor_combo", fruit1, fruit2, sep = " & ")
```

    ## # A tibble: 4 x 1
    ##   flavor_combo         
    ##   <chr>                
    ## 1 apple & bell pepper  
    ## 2 apricot & bilberry   
    ## 3 avocado & blackberry 
    ## 4 banana & blackcurrant

## Exercise: Populate your Participation Repo

So, you don’t want to manually make 12 folders for your participation
repo. I hear you. Let’s do that by making a character vector with
entries `"cm101"`, `"cm102"`, …, `"cm112"`.

(If you’ve already done this, it’s still a useful exercise\!)

### Make Folders

Let’s make those folders\!

1.  Make a character vector with entries `"01"`, `"02"`, …, `12` with
    `str_pad()`.

<!-- end list -->

``` r
(num <- str_pad(1:12, width = 2, side = "left", pad = "0")) #coerces numeric vector to characters
```

    ##  [1] "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"

2.  Use `str_c()` to combine `"/cm1"` with the numbers:
      - If your system uses “" instead of”/", you might need two
        backslashes.

<!-- end list -->

``` r
(folders <- str_c("/cm1", num))
```

    ##  [1] "/cm101" "/cm102" "/cm103" "/cm104" "/cm105" "/cm106" "/cm107"
    ##  [8] "/cm108" "/cm109" "/cm110" "/cm111" "/cm112"

3.  Use `testthat` to check that each entry of `folders` has ~~5~~ 6
    characters. You might find the base R `all()` function useful.

<!-- end list -->

``` r
test_that("folder names are length 6.", {
    expect_true(all(str_length(folders) == 6))
})
```

4.  BONUS: If applicable, make the folders using `dir.create()`.
      - Note: `dir.create()` requires the full path to be specified. You
        might find the `here::here()` function useful.
      - This code might work (depending on your directory): `for (folder
        in folders) dir.create(here::here(folder))`
      - We’ll learn how to use `purrr` instead of loops next week.

### Make README’s

Now, let’s seed the folders with README’s.

1.  Add `/README.md` to the end of the folder names stored in `folders`:

<!-- end list -->

``` r
(files <- str_c(folders, "/README.md"))
```

    ##  [1] "/cm101/README.md" "/cm102/README.md" "/cm103/README.md"
    ##  [4] "/cm104/README.md" "/cm105/README.md" "/cm106/README.md"
    ##  [7] "/cm107/README.md" "/cm108/README.md" "/cm109/README.md"
    ## [10] "/cm110/README.md" "/cm111/README.md" "/cm112/README.md"

2.  Make a vector of contents to put in each README. Put a title and
    body.
      - Hint: Use `\n` to indicate a new line\! This works in graphs,
        too.

<!-- end list -->

``` r
(contents <- str_c("# Participation\n\n Participation for class meeting ", 1:12))
```

    ##  [1] "# Participation\n\n Participation for class meeting 1" 
    ##  [2] "# Participation\n\n Participation for class meeting 2" 
    ##  [3] "# Participation\n\n Participation for class meeting 3" 
    ##  [4] "# Participation\n\n Participation for class meeting 4" 
    ##  [5] "# Participation\n\n Participation for class meeting 5" 
    ##  [6] "# Participation\n\n Participation for class meeting 6" 
    ##  [7] "# Participation\n\n Participation for class meeting 7" 
    ##  [8] "# Participation\n\n Participation for class meeting 8" 
    ##  [9] "# Participation\n\n Participation for class meeting 9" 
    ## [10] "# Participation\n\n Participation for class meeting 10"
    ## [11] "# Participation\n\n Participation for class meeting 11"
    ## [12] "# Participation\n\n Participation for class meeting 12"

``` r
cat(contents[1]) #concatenate and print output
```

    ## # Participation
    ## 
    ##  Participation for class meeting 1

3.  BONUS: Write the README’s to file using base R’s `write(x, file)`:
      - `for (i in 1:length(files)) write(contents[i], files[i])`
      - There’s a better alternative to a loop using `purrr`. Next
        week’s topic\!
      - This code might not work, depending on your working directory
        and system.

## Regular Expressions (aka regex)

Great resource is
[r4ds](https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions)\!

Premable:

  - Useful for identifying *patterns*, not exact character
    specifications.
  - Hard to read and write\!
  - We’ll focus on finding *matches* (the hardest part). You can also
    use regex to manipulate strings – but we’ll delegate that to [r4ds:
    strings: tools](https://r4ds.had.co.nz/strings.html#tools).

Staying true to Resource 1, let’s work with the gapminder countries:

``` r
library(gapminder)
countries <- levels(gapminder$country)
```

### The “any character”

Find all countries in the gapminder data set with the following pattern:
“i”, followed by any single character, followed by “a”:

``` r
str_subset(countries, pattern = "i.a")
```

    ##  [1] "Argentina"                "Bosnia and Herzegovina"  
    ##  [3] "Burkina Faso"             "Central African Republic"
    ##  [5] "China"                    "Costa Rica"              
    ##  [7] "Dominican Republic"       "Hong Kong, China"        
    ##  [9] "Jamaica"                  "Mauritania"              
    ## [11] "Nicaragua"                "South Africa"            
    ## [13] "Swaziland"                "Taiwan"                  
    ## [15] "Thailand"                 "Trinidad and Tobago"

Here, `.` stands for “any single character”.

But, where’s Italy? Case-sensitive\!

Let’s use `str_view_all()` to see the
matches:

``` r
str_view_all(countries, pattern = "i.a")
```

<!--html_preserve-->

<div id="htmlwidget-fdd47ddcc6c8d2f45a9b" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-fdd47ddcc6c8d2f45a9b">{"x":{"html":"<ul>\n  <li>Afghanistan<\/li>\n  <li>Albania<\/li>\n  <li>Algeria<\/li>\n  <li>Angola<\/li>\n  <li>Argent<span class='match'>ina<\/span><\/li>\n  <li>Australia<\/li>\n  <li>Austria<\/li>\n  <li>Bahrain<\/li>\n  <li>Bangladesh<\/li>\n  <li>Belgium<\/li>\n  <li>Benin<\/li>\n  <li>Bolivia<\/li>\n  <li>Bosnia and Herzegov<span class='match'>ina<\/span><\/li>\n  <li>Botswana<\/li>\n  <li>Brazil<\/li>\n  <li>Bulgaria<\/li>\n  <li>Burk<span class='match'>ina<\/span> Faso<\/li>\n  <li>Burundi<\/li>\n  <li>Cambodia<\/li>\n  <li>Cameroon<\/li>\n  <li>Canada<\/li>\n  <li>Central Afr<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Chad<\/li>\n  <li>Chile<\/li>\n  <li>Ch<span class='match'>ina<\/span><\/li>\n  <li>Colombia<\/li>\n  <li>Comoros<\/li>\n  <li>Congo, Dem. Rep.<\/li>\n  <li>Congo, Rep.<\/li>\n  <li>Costa R<span class='match'>ica<\/span><\/li>\n  <li>Cote d'Ivoire<\/li>\n  <li>Croatia<\/li>\n  <li>Cuba<\/li>\n  <li>Czech Republic<\/li>\n  <li>Denmark<\/li>\n  <li>Djibouti<\/li>\n  <li>Domin<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Ecuador<\/li>\n  <li>Egypt<\/li>\n  <li>El Salvador<\/li>\n  <li>Equatorial Guinea<\/li>\n  <li>Eritrea<\/li>\n  <li>Ethiopia<\/li>\n  <li>Finland<\/li>\n  <li>France<\/li>\n  <li>Gabon<\/li>\n  <li>Gambia<\/li>\n  <li>Germany<\/li>\n  <li>Ghana<\/li>\n  <li>Greece<\/li>\n  <li>Guatemala<\/li>\n  <li>Guinea<\/li>\n  <li>Guinea-Bissau<\/li>\n  <li>Haiti<\/li>\n  <li>Honduras<\/li>\n  <li>Hong Kong, Ch<span class='match'>ina<\/span><\/li>\n  <li>Hungary<\/li>\n  <li>Iceland<\/li>\n  <li>India<\/li>\n  <li>Indonesia<\/li>\n  <li>Iran<\/li>\n  <li>Iraq<\/li>\n  <li>Ireland<\/li>\n  <li>Israel<\/li>\n  <li>Italy<\/li>\n  <li>Jama<span class='match'>ica<\/span><\/li>\n  <li>Japan<\/li>\n  <li>Jordan<\/li>\n  <li>Kenya<\/li>\n  <li>Korea, Dem. Rep.<\/li>\n  <li>Korea, Rep.<\/li>\n  <li>Kuwait<\/li>\n  <li>Lebanon<\/li>\n  <li>Lesotho<\/li>\n  <li>Liberia<\/li>\n  <li>Libya<\/li>\n  <li>Madagascar<\/li>\n  <li>Malawi<\/li>\n  <li>Malaysia<\/li>\n  <li>Mali<\/li>\n  <li>Maur<span class='match'>ita<\/span>nia<\/li>\n  <li>Mauritius<\/li>\n  <li>Mexico<\/li>\n  <li>Mongolia<\/li>\n  <li>Montenegro<\/li>\n  <li>Morocco<\/li>\n  <li>Mozambique<\/li>\n  <li>Myanmar<\/li>\n  <li>Namibia<\/li>\n  <li>Nepal<\/li>\n  <li>Netherlands<\/li>\n  <li>New Zealand<\/li>\n  <li>N<span class='match'>ica<\/span>ragua<\/li>\n  <li>Niger<\/li>\n  <li>Nigeria<\/li>\n  <li>Norway<\/li>\n  <li>Oman<\/li>\n  <li>Pakistan<\/li>\n  <li>Panama<\/li>\n  <li>Paraguay<\/li>\n  <li>Peru<\/li>\n  <li>Philippines<\/li>\n  <li>Poland<\/li>\n  <li>Portugal<\/li>\n  <li>Puerto Rico<\/li>\n  <li>Reunion<\/li>\n  <li>Romania<\/li>\n  <li>Rwanda<\/li>\n  <li>Sao Tome and Principe<\/li>\n  <li>Saudi Arabia<\/li>\n  <li>Senegal<\/li>\n  <li>Serbia<\/li>\n  <li>Sierra Leone<\/li>\n  <li>Singapore<\/li>\n  <li>Slovak Republic<\/li>\n  <li>Slovenia<\/li>\n  <li>Somalia<\/li>\n  <li>South Afr<span class='match'>ica<\/span><\/li>\n  <li>Spain<\/li>\n  <li>Sri Lanka<\/li>\n  <li>Sudan<\/li>\n  <li>Swaz<span class='match'>ila<\/span>nd<\/li>\n  <li>Sweden<\/li>\n  <li>Switzerland<\/li>\n  <li>Syria<\/li>\n  <li>Ta<span class='match'>iwa<\/span>n<\/li>\n  <li>Tanzania<\/li>\n  <li>Tha<span class='match'>ila<\/span>nd<\/li>\n  <li>Togo<\/li>\n  <li>Trin<span class='match'>ida<\/span>d and Tobago<\/li>\n  <li>Tunisia<\/li>\n  <li>Turkey<\/li>\n  <li>Uganda<\/li>\n  <li>United Kingdom<\/li>\n  <li>United States<\/li>\n  <li>Uruguay<\/li>\n  <li>Venezuela<\/li>\n  <li>Vietnam<\/li>\n  <li>West Bank and Gaza<\/li>\n  <li>Yemen, Rep.<\/li>\n  <li>Zambia<\/li>\n  <li>Zimbabwe<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all(countries, pattern = "i.a", match=TRUE)
```

<!--html_preserve-->

<div id="htmlwidget-780f2063cb91dd478405" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-780f2063cb91dd478405">{"x":{"html":"<ul>\n  <li>Argent<span class='match'>ina<\/span><\/li>\n  <li>Bosnia and Herzegov<span class='match'>ina<\/span><\/li>\n  <li>Burk<span class='match'>ina<\/span> Faso<\/li>\n  <li>Central Afr<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Ch<span class='match'>ina<\/span><\/li>\n  <li>Costa R<span class='match'>ica<\/span><\/li>\n  <li>Domin<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Hong Kong, Ch<span class='match'>ina<\/span><\/li>\n  <li>Jama<span class='match'>ica<\/span><\/li>\n  <li>Maur<span class='match'>ita<\/span>nia<\/li>\n  <li>N<span class='match'>ica<\/span>ragua<\/li>\n  <li>South Afr<span class='match'>ica<\/span><\/li>\n  <li>Swaz<span class='match'>ila<\/span>nd<\/li>\n  <li>Ta<span class='match'>iwa<\/span>n<\/li>\n  <li>Tha<span class='match'>ila<\/span>nd<\/li>\n  <li>Trin<span class='match'>ida<\/span>d and Tobago<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Exercise: Canada isn’t the only country with three interspersed “a”’s.
Find the others. Try both `str_view_all()` and
`str_subset()`.

``` r
str_view_all(countries, pattern = "a.a.a", match = TRUE)
```

<!--html_preserve-->

<div id="htmlwidget-246433b6170260eb8ed6" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-246433b6170260eb8ed6">{"x":{"html":"<ul>\n  <li>C<span class='match'>anada<\/span><\/li>\n  <li>M<span class='match'>adaga<\/span>scar<\/li>\n  <li>P<span class='match'>anama<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_subset(countries, pattern = "a.a.a")
```

    ## [1] "Canada"     "Madagascar" "Panama"

Let’s define a handy function:

``` r
str_view_all_match <- function(countries, pattern) {
    str_view_all(countries, pattern, match=TRUE)
}
str_view_all_match(countries, pattern = "i.a")
```

<!--html_preserve-->

<div id="htmlwidget-4d35e78a80ffb676359e" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-4d35e78a80ffb676359e">{"x":{"html":"<ul>\n  <li>Argent<span class='match'>ina<\/span><\/li>\n  <li>Bosnia and Herzegov<span class='match'>ina<\/span><\/li>\n  <li>Burk<span class='match'>ina<\/span> Faso<\/li>\n  <li>Central Afr<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Ch<span class='match'>ina<\/span><\/li>\n  <li>Costa R<span class='match'>ica<\/span><\/li>\n  <li>Domin<span class='match'>ica<\/span>n Republic<\/li>\n  <li>Hong Kong, Ch<span class='match'>ina<\/span><\/li>\n  <li>Jama<span class='match'>ica<\/span><\/li>\n  <li>Maur<span class='match'>ita<\/span>nia<\/li>\n  <li>N<span class='match'>ica<\/span>ragua<\/li>\n  <li>South Afr<span class='match'>ica<\/span><\/li>\n  <li>Swaz<span class='match'>ila<\/span>nd<\/li>\n  <li>Ta<span class='match'>iwa<\/span>n<\/li>\n  <li>Tha<span class='match'>ila<\/span>nd<\/li>\n  <li>Trin<span class='match'>ida<\/span>d and Tobago<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### The escape

What if I wanted to literally search for countries with a period in the
name? Escape with `\`, although R requires a double
escape.

``` r
str_view_all_match(countries, pattern = "\\.") #first backslash escapes the second
```

<!--html_preserve-->

<div id="htmlwidget-df438086bbcff9fbec41" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-df438086bbcff9fbec41">{"x":{"html":"<ul>\n  <li>Congo, Dem<span class='match'>.<\/span> Rep<span class='match'>.<\/span><\/li>\n  <li>Congo, Rep<span class='match'>.<\/span><\/li>\n  <li>Korea, Dem<span class='match'>.<\/span> Rep<span class='match'>.<\/span><\/li>\n  <li>Korea, Rep<span class='match'>.<\/span><\/li>\n  <li>Yemen, Rep<span class='match'>.<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Why does R require a double escape? It does one level of escaping before
“executing” the regex.

  - See `?Quotes`
  - Try searching for “s.” (without quotes) in this document (don’t
    forget to select “Regex”)

### Character Classes

  - `[letters]` matches a single character that’s either l, e, t, …, or
    s.
  - `[^letters]`: anything *but* these letters.

See more at:
<https://r4ds.had.co.nz/strings.html#character-classes-and-alternatives>

Note that not all special characters “work” within `[]`, but some do,
and do not always carry the same meaning (like `^`)\! From said
resource, they are:

> `$` `.` `|` `?` `*` `+` `(` `)` `[` `{`. Unfortunately, a few
> characters have special meaning even inside a character class and must
> be handled with backslash escapes: `]` `\` `^` and `-`.

Exercise: Find all countries with three non-vowels next to each
other.

``` r
str_view_all_match(countries, pattern = "[^aeiou][^aeiou][^aeiou]")
```

<!--html_preserve-->

<div id="htmlwidget-a84694d5620abf170a66" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-a84694d5620abf170a66">{"x":{"html":"<ul>\n  <li><span class='match'>Afg<\/span>hanistan<\/li>\n  <li><span class='match'>Alb<\/span>ania<\/li>\n  <li><span class='match'>Alg<\/span>eria<\/li>\n  <li><span class='match'>Ang<\/span>ola<\/li>\n  <li><span class='match'>Arg<\/span>entina<\/li>\n  <li>Au<span class='match'>str<\/span>alia<\/li>\n  <li>Au<span class='match'>str<\/span>ia<\/li>\n  <li>Ba<span class='match'>ngl<\/span>adesh<\/li>\n  <li>Bosnia a<span class='match'>nd <\/span>Herzegovina<\/li>\n  <li>Bo<span class='match'>tsw<\/span>ana<\/li>\n  <li>Ce<span class='match'>ntr<\/span>a<span class='match'>l A<\/span>frica<span class='match'>n R<\/span>epublic<\/li>\n  <li>Congo<span class='match'>, D<\/span>e<span class='match'>m. <\/span>Rep.<\/li>\n  <li>Congo<span class='match'>, R<\/span>ep.<\/li>\n  <li>Cote<span class='match'> d'<\/span>Ivoire<\/li>\n  <li>Cze<span class='match'>ch <\/span>Republic<\/li>\n  <li>Dominica<span class='match'>n R<\/span>epublic<\/li>\n  <li><span class='match'>Egy<\/span>pt<\/li>\n  <li><span class='match'>El <\/span>Salvador<\/li>\n  <li>Equatoria<span class='match'>l G<\/span>uinea<\/li>\n  <li><span class='match'>Eth<\/span>iopia<\/li>\n  <li>Ho<span class='match'>ng <\/span>Ko<span class='match'>ng,<\/span><span class='match'> Ch<\/span>ina<\/li>\n  <li><span class='match'>Ind<\/span>ia<\/li>\n  <li><span class='match'>Ind<\/span>onesia<\/li>\n  <li><span class='match'>Isr<\/span>ael<\/li>\n  <li>Korea<span class='match'>, D<\/span>e<span class='match'>m. <\/span>Rep.<\/li>\n  <li>Korea<span class='match'>, R<\/span>ep.<\/li>\n  <li>Netherla<span class='match'>nds<\/span><\/li>\n  <li>Ne<span class='match'>w Z<\/span>ealand<\/li>\n  <li>Sao Tome a<span class='match'>nd <\/span>Principe<\/li>\n  <li>Saudi<span class='match'> Ar<\/span>abia<\/li>\n  <li>Slova<span class='match'>k R<\/span>epublic<\/li>\n  <li>Sou<span class='match'>th <\/span><span class='match'>Afr<\/span>ica<\/li>\n  <li><span class='match'>Syr<\/span>ia<\/li>\n  <li>Trinidad a<span class='match'>nd <\/span>Tobago<\/li>\n  <li>Unite<span class='match'>d K<\/span>i<span class='match'>ngd<\/span>om<\/li>\n  <li>Unite<span class='match'>d S<\/span>tates<\/li>\n  <li>We<span class='match'>st <\/span>Ba<span class='match'>nk <\/span>a<span class='match'>nd <\/span>Gaza<\/li>\n  <li>Yeme<span class='match'>n, <\/span>Rep.<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all_match(countries, pattern = "[^aeiou ][^aeiou ][^aeiou ]") #don't want to include ones with spaces
```

<!--html_preserve-->

<div id="htmlwidget-9170cd2eb27c74ce03e0" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-9170cd2eb27c74ce03e0">{"x":{"html":"<ul>\n  <li><span class='match'>Afg<\/span>hanistan<\/li>\n  <li><span class='match'>Alb<\/span>ania<\/li>\n  <li><span class='match'>Alg<\/span>eria<\/li>\n  <li><span class='match'>Ang<\/span>ola<\/li>\n  <li><span class='match'>Arg<\/span>entina<\/li>\n  <li>Au<span class='match'>str<\/span>alia<\/li>\n  <li>Au<span class='match'>str<\/span>ia<\/li>\n  <li>Ba<span class='match'>ngl<\/span>adesh<\/li>\n  <li>Bo<span class='match'>tsw<\/span>ana<\/li>\n  <li>Ce<span class='match'>ntr<\/span>al <span class='match'>Afr<\/span>ican Republic<\/li>\n  <li>Cote <span class='match'>d'I<\/span>voire<\/li>\n  <li><span class='match'>Egy<\/span>pt<\/li>\n  <li><span class='match'>Eth<\/span>iopia<\/li>\n  <li>Hong Ko<span class='match'>ng,<\/span> China<\/li>\n  <li><span class='match'>Ind<\/span>ia<\/li>\n  <li><span class='match'>Ind<\/span>onesia<\/li>\n  <li><span class='match'>Isr<\/span>ael<\/li>\n  <li>Netherla<span class='match'>nds<\/span><\/li>\n  <li>South <span class='match'>Afr<\/span>ica<\/li>\n  <li><span class='match'>Syr<\/span>ia<\/li>\n  <li>United Ki<span class='match'>ngd<\/span>om<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Or

  - Use `|` to denote “or”.
  - “And” is implied otherwise, and has precedence.
  - Use parentheses to indicate precedence.

Beer or bear?

``` r
c("bear", "beer", "bar") %>% 
    str_view_all_match(pattern = "bee|ar") #finds "bee" or "ar"
```

<!--html_preserve-->

<div id="htmlwidget-cc42fbb4baa1e35d053c" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-cc42fbb4baa1e35d053c">{"x":{"html":"<ul>\n  <li>be<span class='match'>ar<\/span><\/li>\n  <li><span class='match'>bee<\/span>r<\/li>\n  <li>b<span class='match'>ar<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
c("bear", "beer", "bar") %>% 
    str_view_all_match(pattern = "be(e|a)r") #finds be-r, where - is "e" or "a"
```

<!--html_preserve-->

<div id="htmlwidget-62bd84ffcb140fed6052" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-62bd84ffcb140fed6052">{"x":{"html":"<ul>\n  <li><span class='match'>bear<\/span><\/li>\n  <li><span class='match'>beer<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Quantifiers/Repetition

The handy ones are:

  - `*` for 0 or more
  - `+` for 1 or more
  - `?` for 0 or 1

See list at <https://r4ds.had.co.nz/strings.html#repetition>

Find all countries that have any number of o’s (but at least 1)
following
r:

``` r
str_view_all_match(countries, "ro+")
```

<!--html_preserve-->

<div id="htmlwidget-06a6708a464c7c12ba7f" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-06a6708a464c7c12ba7f">{"x":{"html":"<ul>\n  <li>Came<span class='match'>roo<\/span>n<\/li>\n  <li>Como<span class='match'>ro<\/span>s<\/li>\n  <li>C<span class='match'>ro<\/span>atia<\/li>\n  <li>Monteneg<span class='match'>ro<\/span><\/li>\n  <li>Mo<span class='match'>ro<\/span>cco<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all_match(countries, "ro*")
```

<!--html_preserve-->

<div id="htmlwidget-dd027bb86bd9dbe054c7" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-dd027bb86bd9dbe054c7">{"x":{"html":"<ul>\n  <li>Alge<span class='match'>r<\/span>ia<\/li>\n  <li>A<span class='match'>r<\/span>gentina<\/li>\n  <li>Aust<span class='match'>r<\/span>alia<\/li>\n  <li>Aust<span class='match'>r<\/span>ia<\/li>\n  <li>Bah<span class='match'>r<\/span>ain<\/li>\n  <li>Bosnia and He<span class='match'>r<\/span>zegovina<\/li>\n  <li>B<span class='match'>r<\/span>azil<\/li>\n  <li>Bulga<span class='match'>r<\/span>ia<\/li>\n  <li>Bu<span class='match'>r<\/span>kina Faso<\/li>\n  <li>Bu<span class='match'>r<\/span>undi<\/li>\n  <li>Came<span class='match'>roo<\/span>n<\/li>\n  <li>Cent<span class='match'>r<\/span>al Af<span class='match'>r<\/span>ican Republic<\/li>\n  <li>Como<span class='match'>ro<\/span>s<\/li>\n  <li>Cote d'Ivoi<span class='match'>r<\/span>e<\/li>\n  <li>C<span class='match'>ro<\/span>atia<\/li>\n  <li>Denma<span class='match'>r<\/span>k<\/li>\n  <li>Ecuado<span class='match'>r<\/span><\/li>\n  <li>El Salvado<span class='match'>r<\/span><\/li>\n  <li>Equato<span class='match'>r<\/span>ial Guinea<\/li>\n  <li>E<span class='match'>r<\/span>it<span class='match'>r<\/span>ea<\/li>\n  <li>F<span class='match'>r<\/span>ance<\/li>\n  <li>Ge<span class='match'>r<\/span>many<\/li>\n  <li>G<span class='match'>r<\/span>eece<\/li>\n  <li>Hondu<span class='match'>r<\/span>as<\/li>\n  <li>Hunga<span class='match'>r<\/span>y<\/li>\n  <li>I<span class='match'>r<\/span>an<\/li>\n  <li>I<span class='match'>r<\/span>aq<\/li>\n  <li>I<span class='match'>r<\/span>eland<\/li>\n  <li>Is<span class='match'>r<\/span>ael<\/li>\n  <li>Jo<span class='match'>r<\/span>dan<\/li>\n  <li>Ko<span class='match'>r<\/span>ea, Dem. Rep.<\/li>\n  <li>Ko<span class='match'>r<\/span>ea, Rep.<\/li>\n  <li>Libe<span class='match'>r<\/span>ia<\/li>\n  <li>Madagasca<span class='match'>r<\/span><\/li>\n  <li>Mau<span class='match'>r<\/span>itania<\/li>\n  <li>Mau<span class='match'>r<\/span>itius<\/li>\n  <li>Monteneg<span class='match'>ro<\/span><\/li>\n  <li>Mo<span class='match'>ro<\/span>cco<\/li>\n  <li>Myanma<span class='match'>r<\/span><\/li>\n  <li>Nethe<span class='match'>r<\/span>lands<\/li>\n  <li>Nica<span class='match'>r<\/span>agua<\/li>\n  <li>Nige<span class='match'>r<\/span><\/li>\n  <li>Nige<span class='match'>r<\/span>ia<\/li>\n  <li>No<span class='match'>r<\/span>way<\/li>\n  <li>Pa<span class='match'>r<\/span>aguay<\/li>\n  <li>Pe<span class='match'>r<\/span>u<\/li>\n  <li>Po<span class='match'>r<\/span>tugal<\/li>\n  <li>Pue<span class='match'>r<\/span>to Rico<\/li>\n  <li>Sao Tome and P<span class='match'>r<\/span>incipe<\/li>\n  <li>Saudi A<span class='match'>r<\/span>abia<\/li>\n  <li>Se<span class='match'>r<\/span>bia<\/li>\n  <li>Sie<span class='match'>r<\/span><span class='match'>r<\/span>a Leone<\/li>\n  <li>Singapo<span class='match'>r<\/span>e<\/li>\n  <li>South Af<span class='match'>r<\/span>ica<\/li>\n  <li>S<span class='match'>r<\/span>i Lanka<\/li>\n  <li>Switze<span class='match'>r<\/span>land<\/li>\n  <li>Sy<span class='match'>r<\/span>ia<\/li>\n  <li>T<span class='match'>r<\/span>inidad and Tobago<\/li>\n  <li>Tu<span class='match'>r<\/span>key<\/li>\n  <li>U<span class='match'>r<\/span>uguay<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all_match(countries, "ro?")
```

<!--html_preserve-->

<div id="htmlwidget-2d2c216b1fb1a6518ee5" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-2d2c216b1fb1a6518ee5">{"x":{"html":"<ul>\n  <li>Alge<span class='match'>r<\/span>ia<\/li>\n  <li>A<span class='match'>r<\/span>gentina<\/li>\n  <li>Aust<span class='match'>r<\/span>alia<\/li>\n  <li>Aust<span class='match'>r<\/span>ia<\/li>\n  <li>Bah<span class='match'>r<\/span>ain<\/li>\n  <li>Bosnia and He<span class='match'>r<\/span>zegovina<\/li>\n  <li>B<span class='match'>r<\/span>azil<\/li>\n  <li>Bulga<span class='match'>r<\/span>ia<\/li>\n  <li>Bu<span class='match'>r<\/span>kina Faso<\/li>\n  <li>Bu<span class='match'>r<\/span>undi<\/li>\n  <li>Came<span class='match'>ro<\/span>on<\/li>\n  <li>Cent<span class='match'>r<\/span>al Af<span class='match'>r<\/span>ican Republic<\/li>\n  <li>Como<span class='match'>ro<\/span>s<\/li>\n  <li>Cote d'Ivoi<span class='match'>r<\/span>e<\/li>\n  <li>C<span class='match'>ro<\/span>atia<\/li>\n  <li>Denma<span class='match'>r<\/span>k<\/li>\n  <li>Ecuado<span class='match'>r<\/span><\/li>\n  <li>El Salvado<span class='match'>r<\/span><\/li>\n  <li>Equato<span class='match'>r<\/span>ial Guinea<\/li>\n  <li>E<span class='match'>r<\/span>it<span class='match'>r<\/span>ea<\/li>\n  <li>F<span class='match'>r<\/span>ance<\/li>\n  <li>Ge<span class='match'>r<\/span>many<\/li>\n  <li>G<span class='match'>r<\/span>eece<\/li>\n  <li>Hondu<span class='match'>r<\/span>as<\/li>\n  <li>Hunga<span class='match'>r<\/span>y<\/li>\n  <li>I<span class='match'>r<\/span>an<\/li>\n  <li>I<span class='match'>r<\/span>aq<\/li>\n  <li>I<span class='match'>r<\/span>eland<\/li>\n  <li>Is<span class='match'>r<\/span>ael<\/li>\n  <li>Jo<span class='match'>r<\/span>dan<\/li>\n  <li>Ko<span class='match'>r<\/span>ea, Dem. Rep.<\/li>\n  <li>Ko<span class='match'>r<\/span>ea, Rep.<\/li>\n  <li>Libe<span class='match'>r<\/span>ia<\/li>\n  <li>Madagasca<span class='match'>r<\/span><\/li>\n  <li>Mau<span class='match'>r<\/span>itania<\/li>\n  <li>Mau<span class='match'>r<\/span>itius<\/li>\n  <li>Monteneg<span class='match'>ro<\/span><\/li>\n  <li>Mo<span class='match'>ro<\/span>cco<\/li>\n  <li>Myanma<span class='match'>r<\/span><\/li>\n  <li>Nethe<span class='match'>r<\/span>lands<\/li>\n  <li>Nica<span class='match'>r<\/span>agua<\/li>\n  <li>Nige<span class='match'>r<\/span><\/li>\n  <li>Nige<span class='match'>r<\/span>ia<\/li>\n  <li>No<span class='match'>r<\/span>way<\/li>\n  <li>Pa<span class='match'>r<\/span>aguay<\/li>\n  <li>Pe<span class='match'>r<\/span>u<\/li>\n  <li>Po<span class='match'>r<\/span>tugal<\/li>\n  <li>Pue<span class='match'>r<\/span>to Rico<\/li>\n  <li>Sao Tome and P<span class='match'>r<\/span>incipe<\/li>\n  <li>Saudi A<span class='match'>r<\/span>abia<\/li>\n  <li>Se<span class='match'>r<\/span>bia<\/li>\n  <li>Sie<span class='match'>r<\/span><span class='match'>r<\/span>a Leone<\/li>\n  <li>Singapo<span class='match'>r<\/span>e<\/li>\n  <li>South Af<span class='match'>r<\/span>ica<\/li>\n  <li>S<span class='match'>r<\/span>i Lanka<\/li>\n  <li>Switze<span class='match'>r<\/span>land<\/li>\n  <li>Sy<span class='match'>r<\/span>ia<\/li>\n  <li>T<span class='match'>r<\/span>inidad and Tobago<\/li>\n  <li>Tu<span class='match'>r<\/span>key<\/li>\n  <li>U<span class='match'>r<\/span>uguay<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Find all countries that have exactly two e’s next two each
other:

``` r
str_view_all_match(countries, "e{2}")
```

<!--html_preserve-->

<div id="htmlwidget-5995893cafe63bd171e1" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-5995893cafe63bd171e1">{"x":{"html":"<ul>\n  <li>Gr<span class='match'>ee<\/span>ce<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Exercise: Find all countries that have either “a” or “e”, twice in a row
(with a changeover allowed, such as “ae” or
“ea”):

``` r
str_view_all_match(countries, pattern="(ea)|(ae)")
```

<!--html_preserve-->

<div id="htmlwidget-6b1f2a4e709878fbd8b9" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-6b1f2a4e709878fbd8b9">{"x":{"html":"<ul>\n  <li>Equatorial Guin<span class='match'>ea<\/span><\/li>\n  <li>Eritr<span class='match'>ea<\/span><\/li>\n  <li>Guin<span class='match'>ea<\/span><\/li>\n  <li>Guin<span class='match'>ea<\/span>-Bissau<\/li>\n  <li>Isr<span class='match'>ae<\/span>l<\/li>\n  <li>Kor<span class='match'>ea<\/span>, Dem. Rep.<\/li>\n  <li>Kor<span class='match'>ea<\/span>, Rep.<\/li>\n  <li>New Z<span class='match'>ea<\/span>land<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all_match(countries, pattern="(a|e){2}")
```

<!--html_preserve-->

<div id="htmlwidget-760b8a654944a0191e0a" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-760b8a654944a0191e0a">{"x":{"html":"<ul>\n  <li>Equatorial Guin<span class='match'>ea<\/span><\/li>\n  <li>Eritr<span class='match'>ea<\/span><\/li>\n  <li>Gr<span class='match'>ee<\/span>ce<\/li>\n  <li>Guin<span class='match'>ea<\/span><\/li>\n  <li>Guin<span class='match'>ea<\/span>-Bissau<\/li>\n  <li>Isr<span class='match'>ae<\/span>l<\/li>\n  <li>Kor<span class='match'>ea<\/span>, Dem. Rep.<\/li>\n  <li>Kor<span class='match'>ea<\/span>, Rep.<\/li>\n  <li>New Z<span class='match'>ea<\/span>land<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Position indicators

  - `^` corresponds to the **beginning** of the line.
  - `$` corresponds to the **end** of the line.

Countries that end in
“land”:

``` r
str_view_all_match(countries, pattern = "land$")
```

<!--html_preserve-->

<div id="htmlwidget-9b531c96b51a17fae887" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-9b531c96b51a17fae887">{"x":{"html":"<ul>\n  <li>Fin<span class='match'>land<\/span><\/li>\n  <li>Ice<span class='match'>land<\/span><\/li>\n  <li>Ire<span class='match'>land<\/span><\/li>\n  <li>New Zea<span class='match'>land<\/span><\/li>\n  <li>Po<span class='match'>land<\/span><\/li>\n  <li>Swazi<span class='match'>land<\/span><\/li>\n  <li>Switzer<span class='match'>land<\/span><\/li>\n  <li>Thai<span class='match'>land<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all_match(countries, pattern = "$")
```

<!--html_preserve-->

<div id="htmlwidget-edb8c76e4af95fd92263" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-edb8c76e4af95fd92263">{"x":{"html":"<ul>\n  <li>Afghanistan<span class='match'><\/span><\/li>\n  <li>Albania<span class='match'><\/span><\/li>\n  <li>Algeria<span class='match'><\/span><\/li>\n  <li>Angola<span class='match'><\/span><\/li>\n  <li>Argentina<span class='match'><\/span><\/li>\n  <li>Australia<span class='match'><\/span><\/li>\n  <li>Austria<span class='match'><\/span><\/li>\n  <li>Bahrain<span class='match'><\/span><\/li>\n  <li>Bangladesh<span class='match'><\/span><\/li>\n  <li>Belgium<span class='match'><\/span><\/li>\n  <li>Benin<span class='match'><\/span><\/li>\n  <li>Bolivia<span class='match'><\/span><\/li>\n  <li>Bosnia and Herzegovina<span class='match'><\/span><\/li>\n  <li>Botswana<span class='match'><\/span><\/li>\n  <li>Brazil<span class='match'><\/span><\/li>\n  <li>Bulgaria<span class='match'><\/span><\/li>\n  <li>Burkina Faso<span class='match'><\/span><\/li>\n  <li>Burundi<span class='match'><\/span><\/li>\n  <li>Cambodia<span class='match'><\/span><\/li>\n  <li>Cameroon<span class='match'><\/span><\/li>\n  <li>Canada<span class='match'><\/span><\/li>\n  <li>Central African Republic<span class='match'><\/span><\/li>\n  <li>Chad<span class='match'><\/span><\/li>\n  <li>Chile<span class='match'><\/span><\/li>\n  <li>China<span class='match'><\/span><\/li>\n  <li>Colombia<span class='match'><\/span><\/li>\n  <li>Comoros<span class='match'><\/span><\/li>\n  <li>Congo, Dem. Rep.<span class='match'><\/span><\/li>\n  <li>Congo, Rep.<span class='match'><\/span><\/li>\n  <li>Costa Rica<span class='match'><\/span><\/li>\n  <li>Cote d'Ivoire<span class='match'><\/span><\/li>\n  <li>Croatia<span class='match'><\/span><\/li>\n  <li>Cuba<span class='match'><\/span><\/li>\n  <li>Czech Republic<span class='match'><\/span><\/li>\n  <li>Denmark<span class='match'><\/span><\/li>\n  <li>Djibouti<span class='match'><\/span><\/li>\n  <li>Dominican Republic<span class='match'><\/span><\/li>\n  <li>Ecuador<span class='match'><\/span><\/li>\n  <li>Egypt<span class='match'><\/span><\/li>\n  <li>El Salvador<span class='match'><\/span><\/li>\n  <li>Equatorial Guinea<span class='match'><\/span><\/li>\n  <li>Eritrea<span class='match'><\/span><\/li>\n  <li>Ethiopia<span class='match'><\/span><\/li>\n  <li>Finland<span class='match'><\/span><\/li>\n  <li>France<span class='match'><\/span><\/li>\n  <li>Gabon<span class='match'><\/span><\/li>\n  <li>Gambia<span class='match'><\/span><\/li>\n  <li>Germany<span class='match'><\/span><\/li>\n  <li>Ghana<span class='match'><\/span><\/li>\n  <li>Greece<span class='match'><\/span><\/li>\n  <li>Guatemala<span class='match'><\/span><\/li>\n  <li>Guinea<span class='match'><\/span><\/li>\n  <li>Guinea-Bissau<span class='match'><\/span><\/li>\n  <li>Haiti<span class='match'><\/span><\/li>\n  <li>Honduras<span class='match'><\/span><\/li>\n  <li>Hong Kong, China<span class='match'><\/span><\/li>\n  <li>Hungary<span class='match'><\/span><\/li>\n  <li>Iceland<span class='match'><\/span><\/li>\n  <li>India<span class='match'><\/span><\/li>\n  <li>Indonesia<span class='match'><\/span><\/li>\n  <li>Iran<span class='match'><\/span><\/li>\n  <li>Iraq<span class='match'><\/span><\/li>\n  <li>Ireland<span class='match'><\/span><\/li>\n  <li>Israel<span class='match'><\/span><\/li>\n  <li>Italy<span class='match'><\/span><\/li>\n  <li>Jamaica<span class='match'><\/span><\/li>\n  <li>Japan<span class='match'><\/span><\/li>\n  <li>Jordan<span class='match'><\/span><\/li>\n  <li>Kenya<span class='match'><\/span><\/li>\n  <li>Korea, Dem. Rep.<span class='match'><\/span><\/li>\n  <li>Korea, Rep.<span class='match'><\/span><\/li>\n  <li>Kuwait<span class='match'><\/span><\/li>\n  <li>Lebanon<span class='match'><\/span><\/li>\n  <li>Lesotho<span class='match'><\/span><\/li>\n  <li>Liberia<span class='match'><\/span><\/li>\n  <li>Libya<span class='match'><\/span><\/li>\n  <li>Madagascar<span class='match'><\/span><\/li>\n  <li>Malawi<span class='match'><\/span><\/li>\n  <li>Malaysia<span class='match'><\/span><\/li>\n  <li>Mali<span class='match'><\/span><\/li>\n  <li>Mauritania<span class='match'><\/span><\/li>\n  <li>Mauritius<span class='match'><\/span><\/li>\n  <li>Mexico<span class='match'><\/span><\/li>\n  <li>Mongolia<span class='match'><\/span><\/li>\n  <li>Montenegro<span class='match'><\/span><\/li>\n  <li>Morocco<span class='match'><\/span><\/li>\n  <li>Mozambique<span class='match'><\/span><\/li>\n  <li>Myanmar<span class='match'><\/span><\/li>\n  <li>Namibia<span class='match'><\/span><\/li>\n  <li>Nepal<span class='match'><\/span><\/li>\n  <li>Netherlands<span class='match'><\/span><\/li>\n  <li>New Zealand<span class='match'><\/span><\/li>\n  <li>Nicaragua<span class='match'><\/span><\/li>\n  <li>Niger<span class='match'><\/span><\/li>\n  <li>Nigeria<span class='match'><\/span><\/li>\n  <li>Norway<span class='match'><\/span><\/li>\n  <li>Oman<span class='match'><\/span><\/li>\n  <li>Pakistan<span class='match'><\/span><\/li>\n  <li>Panama<span class='match'><\/span><\/li>\n  <li>Paraguay<span class='match'><\/span><\/li>\n  <li>Peru<span class='match'><\/span><\/li>\n  <li>Philippines<span class='match'><\/span><\/li>\n  <li>Poland<span class='match'><\/span><\/li>\n  <li>Portugal<span class='match'><\/span><\/li>\n  <li>Puerto Rico<span class='match'><\/span><\/li>\n  <li>Reunion<span class='match'><\/span><\/li>\n  <li>Romania<span class='match'><\/span><\/li>\n  <li>Rwanda<span class='match'><\/span><\/li>\n  <li>Sao Tome and Principe<span class='match'><\/span><\/li>\n  <li>Saudi Arabia<span class='match'><\/span><\/li>\n  <li>Senegal<span class='match'><\/span><\/li>\n  <li>Serbia<span class='match'><\/span><\/li>\n  <li>Sierra Leone<span class='match'><\/span><\/li>\n  <li>Singapore<span class='match'><\/span><\/li>\n  <li>Slovak Republic<span class='match'><\/span><\/li>\n  <li>Slovenia<span class='match'><\/span><\/li>\n  <li>Somalia<span class='match'><\/span><\/li>\n  <li>South Africa<span class='match'><\/span><\/li>\n  <li>Spain<span class='match'><\/span><\/li>\n  <li>Sri Lanka<span class='match'><\/span><\/li>\n  <li>Sudan<span class='match'><\/span><\/li>\n  <li>Swaziland<span class='match'><\/span><\/li>\n  <li>Sweden<span class='match'><\/span><\/li>\n  <li>Switzerland<span class='match'><\/span><\/li>\n  <li>Syria<span class='match'><\/span><\/li>\n  <li>Taiwan<span class='match'><\/span><\/li>\n  <li>Tanzania<span class='match'><\/span><\/li>\n  <li>Thailand<span class='match'><\/span><\/li>\n  <li>Togo<span class='match'><\/span><\/li>\n  <li>Trinidad and Tobago<span class='match'><\/span><\/li>\n  <li>Tunisia<span class='match'><\/span><\/li>\n  <li>Turkey<span class='match'><\/span><\/li>\n  <li>Uganda<span class='match'><\/span><\/li>\n  <li>United Kingdom<span class='match'><\/span><\/li>\n  <li>United States<span class='match'><\/span><\/li>\n  <li>Uruguay<span class='match'><\/span><\/li>\n  <li>Venezuela<span class='match'><\/span><\/li>\n  <li>Vietnam<span class='match'><\/span><\/li>\n  <li>West Bank and Gaza<span class='match'><\/span><\/li>\n  <li>Yemen, Rep.<span class='match'><\/span><\/li>\n  <li>Zambia<span class='match'><\/span><\/li>\n  <li>Zimbabwe<span class='match'><\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Countries that start with
“Ca”:

``` r
str_view_all_match(countries, pattern = "^Ca")
```

<!--html_preserve-->

<div id="htmlwidget-5d45ce991a366c638261" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-5d45ce991a366c638261">{"x":{"html":"<ul>\n  <li><span class='match'>Ca<\/span>mbodia<\/li>\n  <li><span class='match'>Ca<\/span>meroon<\/li>\n  <li><span class='match'>Ca<\/span>nada<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Countries without a vowel? The word should start with a non-vowel,
continue as a non-vowel, and
end:

``` r
str_view_all_match(countries, "^[^aeiouAEIOU]*$")
```

<!--html_preserve-->

<div id="htmlwidget-5c92e75e1514dbeef8f4" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-5c92e75e1514dbeef8f4">{"x":{"html":"<ul>\n  <li><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
# "^" inside square brackets means 'not'
# "^" outside squares brackets means 'start of'
```

### Groups

We can refer to parentheses
groups:

``` r
str_view_all(c("abad", "abbd"), pattern="(a)(b)\\1")
```

<!--html_preserve-->

<div id="htmlwidget-77d34813eeebc6539401" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-77d34813eeebc6539401">{"x":{"html":"<ul>\n  <li><span class='match'>aba<\/span>d<\/li>\n  <li>abbd<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
str_view_all(c("abad", "abbd"), pattern="(a)(b)\\2")
```

<!--html_preserve-->

<div id="htmlwidget-8042ab2ded51ffa12e55" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-8042ab2ded51ffa12e55">{"x":{"html":"<ul>\n  <li>abad<\/li>\n  <li><span class='match'>abb<\/span>d<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Note that the parentheses are first resolved, THEN referred to. NOT
re-executed.

``` r
str_view_all(c("bananas"), "(.)(.)\\1\\2.*\\1\\2")
```

<!--html_preserve-->

<div id="htmlwidget-47098e4013fff51b1dfe" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-47098e4013fff51b1dfe">{"x":{"html":"<ul>\n  <li>bananas<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

We can refer to them later in the search,
too:

``` r
str_view_all(c("bananas", "Who can? Bananas can."), "(.)(.)\\1\\2.*\\1\\2")
```

<!--html_preserve-->

<div id="htmlwidget-1bc6a7b3d0bc8a10a51d" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-1bc6a7b3d0bc8a10a51d">{"x":{"html":"<ul>\n  <li>bananas<\/li>\n  <li>Who can? B<span class='match'>ananas can<\/span>.<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
#found "a" then "n". then it will search for (a) followed by (n).
# then search for any character, any number of times.
# then search for (a) followed by (n)
# doesn't do (B)(a) because there are no matches, so it stops that search
```

## Final Exercises

Convert `words` to pig latin, which involves:

1.  Make the first letter the last letter
      - Get the first letter with `str_sub(string, start, end)`.
2.  Remove the first letter from `words`.
      - Hint: leave the `end` argument blank.
3.  Add “ay” to the end of the word.
      - Use `str_c()`.

<!-- end list -->

``` r
#
```

Find all countries that end in
“y”

``` r
str_view_all_match(countries, pattern = "y$")
```

<!--html_preserve-->

<div id="htmlwidget-665bb176fd0395696cbc" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-665bb176fd0395696cbc">{"x":{"html":"<ul>\n  <li>German<span class='match'>y<\/span><\/li>\n  <li>Hungar<span class='match'>y<\/span><\/li>\n  <li>Ital<span class='match'>y<\/span><\/li>\n  <li>Norwa<span class='match'>y<\/span><\/li>\n  <li>Paragua<span class='match'>y<\/span><\/li>\n  <li>Turke<span class='match'>y<\/span><\/li>\n  <li>Urugua<span class='match'>y<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Find all countries that have the same letter repeated twice (like
“Greece”, which has
“ee”).

``` r
str_view_all_match(countries, pattern = "(.)\\1")
```

<!--html_preserve-->

<div id="htmlwidget-c4dcb9ada967dc428f0f" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-c4dcb9ada967dc428f0f">{"x":{"html":"<ul>\n  <li>Camer<span class='match'>oo<\/span>n<\/li>\n  <li>Gr<span class='match'>ee<\/span>ce<\/li>\n  <li>Guinea-Bi<span class='match'>ss<\/span>au<\/li>\n  <li>Moro<span class='match'>cc<\/span>o<\/li>\n  <li>Phili<span class='match'>pp<\/span>ines<\/li>\n  <li>Sie<span class='match'>rr<\/span>a Leone<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Find all countries that end in two
vowels.

``` r
str_view_all_match(countries, pattern = "[aeiou][aeiou]$")
```

<!--html_preserve-->

<div id="htmlwidget-e17f7318ad26dccd6a86" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-e17f7318ad26dccd6a86">{"x":{"html":"<ul>\n  <li>Alban<span class='match'>ia<\/span><\/li>\n  <li>Alger<span class='match'>ia<\/span><\/li>\n  <li>Austral<span class='match'>ia<\/span><\/li>\n  <li>Austr<span class='match'>ia<\/span><\/li>\n  <li>Boliv<span class='match'>ia<\/span><\/li>\n  <li>Bulgar<span class='match'>ia<\/span><\/li>\n  <li>Cambod<span class='match'>ia<\/span><\/li>\n  <li>Colomb<span class='match'>ia<\/span><\/li>\n  <li>Croat<span class='match'>ia<\/span><\/li>\n  <li>Equatorial Guin<span class='match'>ea<\/span><\/li>\n  <li>Eritr<span class='match'>ea<\/span><\/li>\n  <li>Ethiop<span class='match'>ia<\/span><\/li>\n  <li>Gamb<span class='match'>ia<\/span><\/li>\n  <li>Guin<span class='match'>ea<\/span><\/li>\n  <li>Guinea-Biss<span class='match'>au<\/span><\/li>\n  <li>Ind<span class='match'>ia<\/span><\/li>\n  <li>Indones<span class='match'>ia<\/span><\/li>\n  <li>Liber<span class='match'>ia<\/span><\/li>\n  <li>Malays<span class='match'>ia<\/span><\/li>\n  <li>Mauritan<span class='match'>ia<\/span><\/li>\n  <li>Mongol<span class='match'>ia<\/span><\/li>\n  <li>Mozambiq<span class='match'>ue<\/span><\/li>\n  <li>Namib<span class='match'>ia<\/span><\/li>\n  <li>Nicarag<span class='match'>ua<\/span><\/li>\n  <li>Niger<span class='match'>ia<\/span><\/li>\n  <li>Roman<span class='match'>ia<\/span><\/li>\n  <li>Saudi Arab<span class='match'>ia<\/span><\/li>\n  <li>Serb<span class='match'>ia<\/span><\/li>\n  <li>Sloven<span class='match'>ia<\/span><\/li>\n  <li>Somal<span class='match'>ia<\/span><\/li>\n  <li>Syr<span class='match'>ia<\/span><\/li>\n  <li>Tanzan<span class='match'>ia<\/span><\/li>\n  <li>Tunis<span class='match'>ia<\/span><\/li>\n  <li>Zamb<span class='match'>ia<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Find all countries that start with two non-vowels. How is this different
from finding all countries that end in *at least* two non-vowels? Hint:
Syria.

``` r
countries %>% 
    str_to_lower() %>% 
    str_view_all_match(pattern = "^[^aeiou][^aeiou]")
```

<!--html_preserve-->

<div id="htmlwidget-b0e08917baad730c3a96" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-b0e08917baad730c3a96">{"x":{"html":"<ul>\n  <li><span class='match'>br<\/span>azil<\/li>\n  <li><span class='match'>ch<\/span>ad<\/li>\n  <li><span class='match'>ch<\/span>ile<\/li>\n  <li><span class='match'>ch<\/span>ina<\/li>\n  <li><span class='match'>cr<\/span>oatia<\/li>\n  <li><span class='match'>cz<\/span>ech republic<\/li>\n  <li><span class='match'>dj<\/span>ibouti<\/li>\n  <li><span class='match'>fr<\/span>ance<\/li>\n  <li><span class='match'>gh<\/span>ana<\/li>\n  <li><span class='match'>gr<\/span>eece<\/li>\n  <li><span class='match'>my<\/span>anmar<\/li>\n  <li><span class='match'>ph<\/span>ilippines<\/li>\n  <li><span class='match'>rw<\/span>anda<\/li>\n  <li><span class='match'>sl<\/span>ovak republic<\/li>\n  <li><span class='match'>sl<\/span>ovenia<\/li>\n  <li><span class='match'>sp<\/span>ain<\/li>\n  <li><span class='match'>sr<\/span>i lanka<\/li>\n  <li><span class='match'>sw<\/span>aziland<\/li>\n  <li><span class='match'>sw<\/span>eden<\/li>\n  <li><span class='match'>sw<\/span>itzerland<\/li>\n  <li><span class='match'>sy<\/span>ria<\/li>\n  <li><span class='match'>th<\/span>ailand<\/li>\n  <li><span class='match'>tr<\/span>inidad and tobago<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Find all countries that have either “oo” or “cc” in
them.

``` r
str_view_all_match(countries, "YOUR_REGEX_HERE")
```

<!--html_preserve-->

<div id="htmlwidget-87781c8b4ee8bf30d12a" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-87781c8b4ee8bf30d12a">{"x":{"html":"<ul>\n  <li><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->
