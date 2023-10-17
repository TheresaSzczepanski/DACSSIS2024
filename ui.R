##UI for Dashboard
library(shinydashboard)


ui <- dashboardPage(
  skin = "blue",
  title = "Student Data Dashboard",
  dashboardHeader( 
    title = span(img(src="rtcps_seal_blue.png", width = 50, align = "left"), 
                 "Rising Tide MCAS Curriculum Data Dashboard"),
    titleWidth = 650),
  dashboardSidebar(
    sidebarMenu(
      #menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Science", tabName = "science", icon = icon("microscope"),
               menuSubItem("G11 Biology Content", tabName = "g11BiologyContent"),
               menuSubItem("G9 Physics Analysis", tabName = "g9PhysicsAnalysis"),
               menuSubItem("G9 Physics Content", tabName = "g9PhysicsContent"),
               menuSubItem("G9 Physics RT-State Diff", tabName = "g9PhysicsPerf"),
               menuSubItem("G9 Physics Top Performers", tabName = "g9PhysicsTop"),
               menuSubItem("G8 STE Analysis", tabName = "g8SteAnalysis"),
               menuSubItem("G8 STE Content", tabName = "g8SteContent"),
               menuSubItem("G8 STE RT-State Diff", tabName = "g8StePerf"),
               menuSubItem("G5 STE Analysis", tabName = "g5SteAnalysis"),
               menuSubItem("G5 STE Content", tabName = "g5SteContent"),
               menuSubItem("G5 STE RT-State Diff", tabName = "g5StePerf")
               
      ),
      menuItem("Mathematics", tabName = "math", icon = icon("infinity"),
               menuSubItem("G10 Math Content", tabName = "g10MathContent"),
               menuSubItem("G10 Math Performance", tabName = "g10MathPerf"),
               menuSubItem("G8 Math Content", tabName = "g8MathContent"),
               menuSubItem("G8 Math Analysis", tabName = "g8MathPerf"),

               menuSubItem("G7 Math Content", tabName = "g7MathContent"),
               menuSubItem("G7 Math Analysis", tabName = "g7MathPerf"),
               menuSubItem("G6 Math Content", tabName = "g6MathContent"),
               menuSubItem("G6 Math Analysis", tabName = "g6MathAnalysis"),
               menuSubItem("G5 Math Content", tabName = "g5MathContent"),
               menuSubItem("G5 Math Performance", tabName = "g5MathPerf")
      ),
       menuItem("ELA", tabName = "ela", icon = icon("book-bookmark"),
                menuSubItem("G10 ELA Content", tabName = "g10ELAContent"),
                menuSubItem("G10 ELA Writing Analysis", tabName = "g10ELAWritingAnalysis"),
                menuSubItem("G10 ELA Reading Analysis", tabName = "g10ELAReadingAnalysis"),
               
                #menuSubItem("G10 ELA Analysis", tabName = "g10ELAAnalysis"),
                menuSubItem("G8 ELA Content", tabName = "g8ELAContent"),
                menuSubItem("G8 ELA Analysis", tabName = "g8ELAAnalysis"),
                menuSubItem("G7 ELA Content", tabName = "g7ELAContent"),
                menuSubItem("G7 ELA Analysis", tabName = "g7ELAAnalysis"),
                menuSubItem("G6 ELA Content", tabName = "g6ELAContent"),
                menuSubItem("G6 ELA Analysis", tabName = "g6ELAAnalysis"),
                menuSubItem("G5 ELA Content", tabName = "g5ELAContent"),
                menuSubItem("G5 ELA Analysis", tabName = "g5ELAAnalysis")
       ),
      menuItem("Social Studies", tabName = "social", icon = icon("globe"),
               menuSubItem("G8 Civics Content", tabName = "g8CivicsContent")

              )
    )
  ),
  ##Body content
  dashboardBody(# Boxes need to be put in a row (or column)
    tabItems(
      #First tab content
      
      tabItem(tabName = "g8CivicsContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G8 Civics Pilot </b> exam consisted of 17 questions
               worth in <b> total 20 points </b>.
                </p>"),
              h2("Available Points by Topic"),
              h3("Foundations and develoment of the U.S. Political System & Government"),
              
              fluidRow(
               
                valueBox(civics_TopicPts[1,2], HTML("<p> T1:  The philosophical <br> 
                      foundations <br> of the United States
<br>                   political system</p>"), icon = icon("book"), color = "blue"),
                valueBox( civics_TopicPts[2,2],HTML("<p>T2: The development of the <br> United States government.</p>"),icon = icon("flag-usa"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             There were no released items connected to Topic 5
                            </p>"),
                     HTML("<p> <ul>
                <li> Review the Topics and Reporting Categories in the   
              <a href='https://www.doe.mass.edu/frameworks/hss/2018-12.pdf'> Curriculum Framework. </a> 
                </li>
                <li> Explore
              <a href = 'http://mcas.pearsonsupport.com/released-items/civics/'>
                2023 released items  </a> 
                </li>

                
                </ul></p>")
                )
              ),
              
              h3("Institutions and structure of U.S. government & Mass. state and Local governments"),
              fluidRow(
                valueBox( civics_TopicPts[3,2],HTML("<p>T3: The institutions of the <br> United States government.</p>"),icon = icon("landmark-dome"), color = "light-blue"),
                valueBox( civics_TopicPts[5,2],HTML("<p>T6: The structure of Massachusetts state <br> and local
government </p>"),icon = icon("location-dot"), color = "light-blue")
              ),
              
              h3("Rights and responsibilites, the U.S. Constitution, and news & media literacy"),
              fluidRow(
                valueBox(civics_TopicPts[7,2], HTML("<p> T5: The Constitution, Amendments,<br> and Supreme Court
decisions <br> </p>"), icon = icon("scale-balanced"), color = "blue"),
                valueBox( civics_TopicPts[4,2],HTML("<p>T4: Rights and responsibilities of citizens.</p>"),icon = icon("person-booth"), color = "blue"),
                valueBox( civics_TopicPts[6,2],HTML("<p>T7: Freedom of the Press and <br>  News/Media Literacy </p>"),icon = icon("newspaper"), color = "blue"),
            
              ),
             
            
              
              
              h2("How Did our Students Perform Compared to Their Peers in the State?"),
              h3("RT-State Aggregate Diff"),
              fluidRow(
                
                valueBox(RT_SumPerf[1,6], HTML("<p> 2023 Civics Pilot</p>"), icon = icon("check-to-slot"), color = "red"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                            <b> Rising Tide </b> students earned <b>60%</b> of the available points on the
                            2023 Civics Pilot MCAS, while students across <b> MA earned 61% </b> of 
                            available points.
                            </p>")
                )
              ),
              h3("RT State Diff by Topic"),
              h3("Foundations and develoment of the U.S. Political System & Government"),
              
              fluidRow(
                
                valueBox(civics_TopicPts[1,7], HTML("<p> T1:  The philosophical <br> 
                      foundations <br> of the United States
<br>                   political system</p>"), icon = icon("book"), color = "red"),
                valueBox( civics_TopicPts[2,7],HTML("<p>T2: The development of the <br> United States government.</p>"),icon = icon("flag-usa"), color = "red"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             There were no released items connected to Topic 5
                            </p>"),
                     HTML("<p> <ul>
                <li> Review the Topics and Reporting Categories in the   
              <a href='https://www.doe.mass.edu/frameworks/hss/2018-12.pdf'> Curriculum Framework. </a> 
                </li>
                <li> Explore
              <a href = 'http://mcas.pearsonsupport.com/released-items/civics/'>
                2023 released items  </a> 
                </li>

                
                </ul></p>")
                )
              ),
              
              h3("Institutions and structure of U.S. government & Mass. state and Local governments"),
              fluidRow(
                valueBox( civics_TopicPts[3,7],HTML("<p>T3: The institutions of the <br> United States government.</p>"),icon = icon("landmark-dome"), color = "light-blue"),
                valueBox( civics_TopicPts[5,7],HTML("<p>T6: The structure of Massachusetts state <br> and local
government </p>"),icon = icon("location-dot"), color = "red")
              ),
              
              h3("Rights and responsibilites, the U.S. Constitution, and news & media literacy"),
              fluidRow(
                valueBox(civics_TopicPts[7,7], HTML("<p> T5: The Constitution, Amendments,<br> and Supreme Court
decisions <br> </p>"), icon = icon("scale-balanced"), color = "blue"),
                valueBox( civics_TopicPts[4,7],HTML("<p>T4: Rights and responsibilities of citizens.</p>"),icon = icon("person-booth"), color = "blue"),
                valueBox( civics_TopicPts[6,7],HTML("<p>T7: Freedom of the Press and <br>  News/Media Literacy </p>"),icon = icon("newspaper"), color = "blue"),
                
              )
              
          ),
      #Science tab content
      tabItem(tabName = "science",
              h2("Science Trends Overview content")

      ),
      #Biology Content
      tabItem("g11BiologyContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> HS Biology </b> exam consisted of 42 questions
               worth in <b> total 55 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Biology&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
              <a href = 'https://www.doe.mass.edu/mcas/2023/release/hs-bio.pdf'>
                2023 released paper based items PDF </a> 
                </li>
                <li> Download 
                  <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2023_HS_Biology_PT_ADA.pdf'>
                  HS Biology Paper sample test </a>
                or 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                complete Computer Based tests online </a> and grade with the
                scoring key/rubrics </a>
                </li>
                <li>Review student
              <a href = 'https://www.doe.mass.edu/mcas/student/2023/hs/biology.html'>
                released Constructed Response </a> and Scoring Guidelines
              </li>
                
                </ul>
                </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),

                valueBox(SG11_EC_PTS[1,2], HTML("<p> Ecology </p>"), icon = icon("leaf"), color = "blue"),
                valueBox( SG11_EV_PTS[1,2],"Evolution",icon = icon("dna"), color = "blue")
              ),

              fluidRow(
                valueBox(SG11_HE_PTS[1,2], "Hereditary", icon = icon("people-group"), color = "blue"),
                valueBox(SG11_MO_PTS[1,2], HTML("<p> Molecules to <br> Organisms </p>"), icon = icon("bacteria"), color = "blue")

              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Biology&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are some
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG11_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG11_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG11_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")

                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG11_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(SG11_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      #Physics Content
      tabItem("g9PhysicsContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> HS Introductory Physics </b> exam consisted of 42 questions
               worth in <b> total 60 points </b>. Students used this <a href = 'https://www.doe.mass.edu/mcas/tdd/phys_formula.pdf'>
                reference sheet </a>. 
                Students were assessed on the
                <a href = 'https://www.doe.mass.edu/stem/ste/hs-intro-phys.pdf'>
                <b> content and skills </b> from the STE curriculum framework.
                </a>
                </p>"),
              h3("Available Points by Content Category"),
              
              HTML("<p>Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=ALL'>digital item library. </a> 
                Download the <a href = 'https://www.doe.mass.edu/mcas/2023/release/hs-physics.pdf'>
                2023 released paper based items </a>, complete a 
              <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                paper practice test </a>, or complete a
              <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                computer based practice test </a>
                </p>"),
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),

                valueBox(SG9_MF_PTS[1,2], HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
                valueBox( SG9_EN_PTS[1,2],"Energy",icon = icon("atom"), color = "blue"),
                valueBox(SG9_WA_PTS[1,2], "Waves", icon = icon("wave-square"), color = "blue")


              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are some 
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG9_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG9_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              h3("Available Points by Information Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_Vis_PTS, HTML("<p> Visual </p>"), icon=icon("chart-line")),
                
                valueBox(SG9_Des_PTS, HTML("<p> Desciptive <br> (words/symbols only)</p>"),icon=icon("align-justify") ),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/1wwXyvgF4sewAq3zbP-4I8iHEiBe-azF-jEyYzSu3-0A/edit?usp=drive_link'>
                              Released MCAS by Standard </a> (2019-2023 Next Generation)

                            </p>"))
                
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "light-blue"),

                valueBox(SG9_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil"), color = "light-blue" ),

                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Student
                              <a href = 'https://www.doe.mass.edu/mcas/student/2023/hs/physics.html'>
                              released Constructed Response </a> and Scoring Guidelines

                            </p>"))

                )
              

            ),
      #G9 Physics Performance
      tabItem("g9PhysicsPerf", 
              
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),

                valueBox(paste(SG9_MF_Diff[1,6] ), HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
                valueBox( paste(SG9_EN_Diff[1,6] ),"Energy",icon = icon("atom"), color = "blue"),
                valueBox(paste(SG9_WA_Diff[1,6] ), "Waves", icon = icon("wave-square"), color = "blue")
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 5 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox

                valueBox(paste(SG9_MD_Diff[1,6]), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(paste(SG9_ERM_Diff[1,6]), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(paste(SG9_IQ_Diff[1,6]), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
              ),
    
      
      h3("RT-State Diff by: Information Type"),
      
      fluidRow(
        # A static valueBox
        valueBox(SG9_Vis_Diff[1,6], HTML("<p> Visual </p>"), icon=icon("chart-line")),
        
        valueBox(SG9_Des_Diff[1,6], HTML("<p> Desciptive <br> (words/symbols only) </p>"),icon=icon("align-justify") )
        
        
      ),
      
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "light-blue"),

                valueBox(SG9_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil"),  color = "light-blue" ),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Student
                              <a href = 'https://www.doe.mass.edu/mcas/student/2023/hs/physics.html'>
                              released Constructed Response </a> and Scoring Guidelines

                            </p>"))

              )
      ),
      
      
      #G9 Physics Analysis
      
      tabItem("g9PhysicsAnalysis", 
              
              span(h1("How do we improve?")), #style = "color:black")),
              span(h2("Practice with Graphs, Abstract Models, Interpreting Data")),
              HTML("<p> Reading or Synthesizing Information from Visuals was asked of students in
                    <b> 78%  </b> of available points on the MCAS.Rising Tide students lost disproportionatly more points than their peers in the
                      state when asked to <b> interpret graphs </b>  and when asked to solve problems with 
                      <b> contextual images </b> </p>"),
              
              h3("RT-State Diff by Visual"),
              HTML("<p> The trend is <b> more pronounced </b> in students with scores <b> greater
                  than 515 </b>. </p>"),
              
              
              
              fluidRow(
                # A static valueBox
                valueBox(SG9_Rep_Diff[5,6], HTML("<p> Graphs </p>"), icon = icon("chart-line"), color = "red"),
                
                valueBox(SG9_Rep_Diff[2,6], HTML("<p> Contextual Images </p>"), icon = icon("hill-rockslide"), color = "red"),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/15noiswDgNC3FZmVgxhExutBqcNu5YcmjYf7vjSQ_-Dk/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                
                  )
                
              ),
              
              fluidRow(

                valueBox(SG9_Rep_Diff[1,6],  HTML("<p> Abstract Model</p>"), icon = icon("atom"), color = "light-blue"),

                valueBox(SG9_Rep_Diff[3,6], HTML("<p> Data Table</p>"), icon = icon("table"), color = "light-blue")
                
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue", width = SG9practice_width)
              ),

              span(h2("Frequent Formative Assessment of Mathematical Concepts")),
              h3("% Points Lost from Students Meeting Expectations"),
              HTML("<p> Students Meeting Expectations lose disproportionatly more points on Mathematics and Data Items. </p>"),
              
              
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG9Mid_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "red"),


                valueBox(paste(SG9Mid_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),

                valueBox(paste(SG9Mid_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
               
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue")

              ),
              
              
              h3("% Points Lost from Top Performing students"),
              HTML("<p> The top performing students also exhibit this trend, 
                  although it is less pronounced. </p>"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG9Top_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "red"),
                
                
                valueBox(paste(SG9Top_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                
                valueBox(paste(SG9Top_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue")
                
              )
              
              
              
      ),
      
      #G9 Physics Top Perf
      tabItem("g9PhysicsTop", 
              
              span(h1("How did our top performing students compare to the state?")), #style = "color:black")),
              
              h3("Content Category"),
              
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),

                valueBox(SG9Top_MF_Diff[1,6], HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
                valueBox( SG9Top_EN_Diff[1,6],"Energy",icon = icon("atom"), color = "blue"),
                valueBox(SG9Top_WA_Diff[1,6], "Waves", icon = icon("wave-square"), color = "blue")


              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 5 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox

                valueBox(SG9Top_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),

                valueBox(SG9Top_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),

                valueBox(SG9Top_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue")


                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9Top_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(SG9Top_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      #G8 Sci Content
      
      tabItem("g8SteContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b>G8 STE </b> exam consisted of 41 questions worth in <b>total 44 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
                     <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr8-ste.pdf'>
                        2022 released paper based items PDF (2023 not available yet) </a> 
                </li>
                <li> Download
              <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                Sample Paper Based Test PDF </a>or complete the 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'> computer based practice test</a> with the
                scoring key/rubric
                </li>
                <li>Student
              <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade8/ste.html'>
                Constructed Response </a> and Scoring Guidelines
              </li>
          
            </ul>
                </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(SG8_ES_PTS[1,2], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG8_LS_PTS[1,2],"Life Science",icon = icon("dna"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/16w1tDbd0-xSRzP-00Yvf3A3T0kiE3f8Hk5sqOhlhRNc/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)
                            </p>")
                     
                )
              ),

              fluidRow(
                valueBox(SG8_PS_PTS[1,2], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG8_TE_PTS[1,2], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              h3("Available Points by Grade Level"),
              
              fluidRow(
                # A static valueBox
                valueBox(SG8_G8_PTS[1,2], HTML("<p> G8 </p>"), icon = icon("8"), color = "light-blue"),
                valueBox(SG8_G7_PTS[1,2], HTML("<p> G7 </p>"), icon = icon("7"), color = "light-blue"),
                valueBox(SG8_G6_PTS[1,2], HTML("<p> G6 </p>"), icon = icon("6"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are some
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "aqua"),
                valueBox(SG8_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "aqua"),
                valueBox(SG8_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "aqua")
                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "light-blue"),

                valueBox(SG8_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil"), color = "light-blue" )

              )
      ),
      
      #G8 STE Performance
      
      tabItem("g8StePerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(SG8_ES_Diff[1,6], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG8_LS_Diff[1,6],"Life Science",icon = icon("dna"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/15noiswDgNC3FZmVgxhExutBqcNu5YcmjYf7vjSQ_-Dk/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                     
                )
              ),
              
              fluidRow(
                valueBox(SG8_PS_Diff[1,6], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG8_TE_Diff[1,6], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              h3("RT-State Diff by Grade Level"),
              
              fluidRow(
                # A static valueBox
                valueBox(SG8_G8_Diff[1,2], HTML("<p> G8 </p>"), icon = icon("8"), color = "light-blue"),
                valueBox(SG8_G7_Diff[1,2], HTML("<p> G7 </p>"), icon = icon("7"), color = "light-blue"),
                valueBox(SG8_G6_Diff[1,2], HTML("<p> G6 </p>"), icon = icon("6"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 15 released items and 26 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox

                valueBox(SG8_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG8_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG8_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")

                # valueBox(4,  "no category reported ", color = "aqua")
                ),
              
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(SG8_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      #G8 STE Analysis
      
      tabItem("g8SteAnalysis",
              span(h1("How do we improve?")), #style = "color:black")),
              
              h3("% Points Lost by Reporting Category"),
              
              fluidRow(
                # A static valueBox
                
                valueBox(paste(SG8_ES_Loss[1,5], "%"), HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "light-blue"),
                
                valueBox(paste(SG8_LS_Loss[1,5], "%"), "Life Science",icon = icon("dna"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> Earth Science and Life Sciences Account for 27% and 30% of available points but <b> 30% and 35% of points lost by Rising Tide Students </b>
                      </p>")
                )
                
                
              ),
              
              fluidRow(
                
                valueBox(paste(SG8_PS_Loss[1,5], "%"), "Physical Science", icon = icon("atom"), color = "light-blue"),
                
                
                valueBox(paste(SG8_TE_Loss[1,5], "%"), HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "light-blue")
                
                
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue")
                
              ),
              
              h3("% Points Lost Top Performing Students"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG8Top_ES_Loss[1,5], "%"), HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "red"),
                
                
                
                valueBox(paste(SG8Top_LS_Loss[1,5], "%"), "Life Science",icon = icon("dna"), color = "red"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>. </p>")
                )
                
                
              ),
              
              fluidRow(
                
                valueBox(paste(SG8Top_PS_Loss[1,5], "%"), "Physical Science", icon = icon("atom"), color = "light-blue"),
                
                
                valueBox(paste(SG8Top_TE_Loss[1,5], "%"), HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "light-blue")
                
                
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue")
                
              ),
              
              
              h3("% Points Lost by Practice Category"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG8_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "red"),
                
                valueBox(paste(SG8_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue")
                
              ),
              
              
              fluidRow(  
                
                valueBox(paste(SG8_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> Evidence, Reasoning and Modeling, Account for 48% of available points but <b> 56% of points lost by Rising Tide Students. </b>
                      This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>. </p>")
                )
                
                
              ),
              
              h3("Top Performing Students"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG8Top_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "red"),
                
                valueBox(paste(SG8Top_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue")
                
              ),
              
              
              fluidRow(  
                
                valueBox(paste(SG8Top_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>.
                       </p>")
                )
                
                
              )
              
              
              
          ),
      
      #G5 Sci Content
      tabItem("g5SteContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G5 STE </b> exam consisted of 41 questions worth in <b>total 46 points </b>.
              
              Explore the released materials:
                <ul>
                <li> Complete and Score 2023 digital released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%205&view=ALL'>digital item library. </a> 
                </li>
                <li> Download the
                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr5-ste.pdf'> 2022 paper based released questions (2023 not available yet)</a>
                <li> Download
              <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                Sample Paper Based Test PDF </a> or complete the 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/' computer based practice test</a> with the
                scoring key/rubric 
                </li>
                <li>Student
              <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade5/ste.html'>
                Released Constructed Response </a> and Scoring Guidelines
              </li>
              
                </ul>
                </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(SG5_ES_PTS[1,2], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG5_LS_PTS[1,2],"Life Science",icon = icon("dna"), color = "blue"),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/1CZvZocUghzZb2QbCUpuwHePGsK3tpfnMwVqvuYs0lxk/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)
                            </p>")
                )
              ),
              
              fluidRow(
                valueBox(SG5_PS_PTS[1,2], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG5_TE_PTS[1,2], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              h3("Available Points by Grade Level"),
              
              fluidRow(
                # A static valueBox
                valueBox(SG5_G5_PTS[1,2], HTML("<p> G5 </p>"), icon = icon("5"), color = "light-blue"),
                valueBox(SG5_G4_PTS[1,2], HTML("<p> G4 </p>"), icon = icon("4"), color = "light-blue"),
                valueBox(SG5_G3_PTS[1,2], HTML("<p> G3 </p>"), icon = icon("3"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%205&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are some 
                   items which do not have a listed science practice category. </p>"),
               fluidRow(
                 # A static valueBox
                valueBox(SG5_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart")),
                valueBox(SG5_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator")),
                valueBox(SG5_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"))
                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "light-blue"),

                valueBox(SG5_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil"), color = "light-blue" )

              )
      ),
      
      tabItem("g5SteAnalysis",
              
              span(h1("How do we improve?")), #style = "color:black")),
              
              h3("% Points Lost by Reporting Category"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG5_PS_Loss[1,5], "%"), "Physical Science", icon = icon("atom"), color = "red"),
                
                
                valueBox(paste(SG5_LS_Loss[1,5], "%"), "Life Science",icon = icon("dna"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> Physical Sciences Account for 26% of available points but <b> 33% of points lost by Rising Tide Students. </b>
                      This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>. </p>")
                    )
                  
                
              ),
              
              fluidRow(
                valueBox(paste(SG5_ES_Loss[1,5], "%"), HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "light-blue"),
                
                valueBox(paste(SG5_TE_Loss[1,5], "%"), HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "light-blue")
                      
                
                #valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue")
                
              ),
              
              
              h3("% Points Lost by Practice Category"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG5_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "red"),
                
                valueBox(paste(SG5_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue")
                
              ),
                
                
              fluidRow(  
                
                valueBox(paste(SG5_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> Evidence, Reasoning and Modeling, Account for 48% of available points but <b> 56% of points lost by Rising Tide Students. </b>
                      This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>. </p>")
                  )
              
                
              ),
              
              h3("Top Performing Students"),
              
              fluidRow(
                # A static valueBox
                valueBox(paste(SG5Top_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "red"),
                
                valueBox(paste(SG5Top_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue")
                
              ),
              
              
              fluidRow(  
                
                valueBox(paste(SG5Top_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>.
                       </p>")
                )
                
                
              )
             
              
              
              
        ),
      #G5 STE Student Performance
      
      tabItem("g5StePerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(SG5_ES_Diff[1,6], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG5_LS_Diff[1,6],"Life Science",icon = icon("dna"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/15noiswDgNC3FZmVgxhExutBqcNu5YcmjYf7vjSQ_-Dk/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                     
                )
              ),

              fluidRow(
                valueBox(SG5_PS_Diff[1,6], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG5_TE_Diff[1,6], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              h3("RT-State Diff by Grade Level"),
              
              fluidRow(
                # A static valueBox
                valueBox(SG5_G5_Diff[1,2], HTML("<p> G5 </p>"), icon = icon("5"), color = "light-blue"),
                valueBox(SG5_G4_Diff[1,2], HTML("<p> G4 </p>"), icon = icon("4"), color = "light-blue"),
                valueBox(SG5_G3_Diff[1,2], HTML("<p> G3 </p>"), icon = icon("3"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 15 released items and 26 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG5_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG5_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")

                # valueBox(4,  "no category reported ", color = "aqua")

              ),
              
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(SG5_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      # Math tab content
      tabItem(tabName = "math",
              h2("Math Trends Overview content")
              
      ),
      # G10 Math Content
      tabItem("g10MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G10 Math </b> exam consisted of 42 questions worth in <b>total 52 points </b>.
              Explore the released materials:
                      <ul>
                         <li> Complete and Score released questions in the  
                             <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%210&view=ALL'>digital item library. </a> 
                         </li>
                        <li> Download
                            <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-math.pdf'>
                         2022 released items PDF (2023 Unavailable)</a> 
                        </li>
                        <li>Student
                            <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade10/math.html'>
                           Constructed Response </a> and Scoring Guidelines
                        </li>
                        <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g10-math-refsheet-cbt.pdf'>
                              Reference Sheet </a>
                        </li>
                    </ul>
                  </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG10_AF_PTS[1,2], HTML("<p> Algebra and <br> Functions </p>"), icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG10_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/1fgVckOxME_Kgi8SimVxrumECnr648MzCIbIBEMH0qZ4/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)
                            </p>")
                )
              ),
              
              fluidRow(
                valueBox(MG10_NQ_PTS[1,2], HTML(" <p> Numbers and <br> Quantity </p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG10_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG10_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG10_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG10_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      #G10 Math Perf
      
      tabItem("g10MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG10_AF_Diff[1,6], HTML("<p> Algebra and <br> Functions </p>"), icon = icon("square-root-variable"), color = "red"),
                valueBox( MG10_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>"),
                     HTML("<p> Algebra and Functions Items account for <b> 35% of available 
                            </b> points but <b> 48% </b> of points <b>lost by Rising Tide </b> Students. 
                      </p>")
                     
                )
              ),
              
              fluidRow(
                valueBox(MG10_NQ_Diff[1,6], HTML(" <p> Numbers and <br> Quantity </p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG10_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red"),
                box(  width = 4, solidHeader = FALSE,
                      HTML("<p> Statistics and Probability Items account for <b> 17% of available </b> points but 
                            <b> 24% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
                      </p>")
                )
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG10_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG10_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG10_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      #G8 Math
      
      tabItem("g8MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G8 Math </b> exam consisted of 40 questions worth 
                      in <b>total 54 points </b>. Explore the released materials:
                      <ul>
                         <li> Complete and Score released questions in the  
                             <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%208&view=ALL'>digital item library. </a> 
                         </li>
                        <li> Download
                            <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr8-math.pdf'>
                         2022 released items PDF (2023 Unavailable) </a> 
                        </li>
                        <li>Student
                            <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade8/math.html'>
                           Constructed Response </a> and Scoring Guidelines
                        </li>
                        <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g8-math-refsheet.pdf'>
                              Reference Sheet </a>
                        </li>
                    </ul>
                  </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG8_FN_PTS[1,2], "Functions", icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG8_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/1TC52o3YIa-5PkHXSMqRgGYci6pwU-dk-PPvoHj5J_SU/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)
                            </p>")
                )

              ),
              
              fluidRow(

                valueBox(MG8_NSEE_PTS[1,2], HTML("<p> Number System: <br> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox(MG8_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG8_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG8_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      #G8 Math Perf:
      
      tabItem("g8MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              h3("Different Trends between Algebra and G8 Students"),
              
              fluidRow(
                valueBox(MG8_FN_Diff[1,6], "Functions", icon = icon("square-root-variable"), color = "red"),
                valueBox( MG8_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> Geometry Items account for <b> 30% of available </b> points but <b> 46% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
                      </p>"),
                     
                     HTML("<p> <b>Expressions and Equations</b> account for <b> 37%  </b> of points lost by Rising Tide's Mid-Performing students but only <b> 22% </b> of points <b>lost by Rising Tide's Top Performing StudentsStudents </b>
                      </p>"),
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                     
                )

              ),
              
              fluidRow(

                valueBox(MG8_NSEE_Diff[1,6], HTML("<p> Number System: <br> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox(MG8_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG8_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG8_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG8_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      #G7 Math
      
      tabItem("g7MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G7 Math </b> exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%207&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr7-math.pdf'>
                    2022 released items PDF (2023 Unavailable) </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2023/grade7/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g7-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
                   </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG7_EE_PTS[1,2], HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG7_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <a href = 'https://docs.google.com/document/d/1eI6Jx-KwERQSz03uAVPv_S4w0p80Iow967Mme1kM8JQ/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)
                              
                          </p>")
                )
                
              ),
              
              fluidRow(
                valueBox(MG7_NS_PTS[1,2], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG7_RP_PTS[1,2], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG7_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG7_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG7_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG7_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      #G7 Math Performance
      tabItem("g7MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG7_EE_Diff[1,6], HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG7_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                       )
              
            ),
              
              
              fluidRow(
                valueBox(MG7_NS_Diff[1,6], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG7_RP_Diff[1,6], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "red"),
                valueBox(MG7_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red")
              ),
            
            h3("% Points Lost Top Performing Students"),
            fluidRow(
              valueBox(paste(MG7Top_EE_Loss[1,5], "%"), HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
              valueBox( paste(MG7Top_GE_Loss[1,5], "%"),"Geometry",icon = icon("shapes"), color = "red"),
              box( width = 4, solidHeader = FALSE,
                   HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
              )
              
            ),
            fluidRow(
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Expressions and Equations </b> items account for <b> 24%  </b> of points available 
                            but only <b> 7% </b> of points lost by Rising Tide's <b> Top Performing Students. </b> 
                      </p>")
                   
              ),
              
              
              
              
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Top Performing Students </b> 20% </b> of their points on
                              <b> Geometry Items </b>, although they represent ,
                               <b> 15% </b> of available points </p>")
                   
              )#,
              ## 
              # box( width = 4, solidHeader = FALSE,
              #      HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b> 
              #             points but <b> 30% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
              #             </p>")
              #      
              #      
              # )
              
              
              
            ),
            fluidRow(
              valueBox(paste(MG7Top_NS_Loss[1,5], "%"), "Number System", icon = icon("less-than-equal"), color = "blue"),
              valueBox(paste(MG7Top_RP_Loss[1,5], "%"), HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
              valueBox(paste(MG7Top_SP_Loss[1,5], "%"), HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red")
            ),
              
            fluidRow(
              
              box( width = 4, solidHeader = FALSE,
                   HTML("<p> <b> Top Performing Students </b> lost a proportionate percentage </b> of points on
                              <b> Number System Items </b>
                              
                      </p>")
                   
    
                   
              ),
              
              
              
              
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Top Performing Students </b> lost a proportionate percentage </b> of points on
                              <b> Ratio and Proportional Reasoning items </b>
                              
                      </p>")
                   
              ),
              
              box( width = 4, solidHeader = FALSE,
                   HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b>
                          points but <b> 30% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
                          </p>")


              )
              
              
              
            ),
            
            h3("% Points Lost Lowest Performing Students"),
            fluidRow(
              valueBox(paste(MG7Low_EE_Loss[1,5], "%"), HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
              valueBox( paste(MG7Low_GE_Loss[1,5], "%"),"Geometry",icon = icon("shapes"), color = "red"),
              box( width = 4, solidHeader = FALSE,
                   HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
              )
              
            ),
            fluidRow(
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Expressions and Equations </b> items account for <b> 24%  </b> of points available 
                            but only <b> 7% </b> of points lost by Rising Tide's <b> Low Performing Students. </b> 
                      </p>")
                   
              ),
              
              
              
              
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Low Performing Students lost </b> 17% </b> of their points on
                              <b> Geometry Items </b>, although they represent ,
                               <b> 15% </b> of available points </p>")
                   
              )#,
              ## 
              # box( width = 4, solidHeader = FALSE,
              #      HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b> 
              #             points but <b> 30% </b> of points <b>lost by Rising Tide's Low Performing Students. </b>
              #             </p>")
              #      
              #      
              # )
              
              
              
            ),
            fluidRow(
              valueBox(paste(MG7Low_NS_Loss[1,5], "%"), "Number System", icon = icon("less-than-equal"), color = "red"),
              valueBox(paste(MG7Low_RP_Loss[1,5], "%"), HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
              valueBox(paste(MG7Low_SP_Loss[1,5], "%"), HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red")
            ),
            
            fluidRow(
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Expressions and Equations </b> items account for <b> 24%  </b> of points available 
                            but only <b> 21% </b> of points lost by Rising Tide's <b> Low Performing Students. </b> 
                      </p>")
                   
              ),
              
              
              
              
              
              box( width = 4, solidHeader = FALSE,
                   
                   HTML("<p> <b> Low Performing Students </b> lost a proportionate percentage </b> of points on
                              <b> Ratio and Proportional Reasoning items </b>
                              
                      </p>")
                   
              ),
              
              box( width = 4, solidHeader = FALSE,
                   HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b>
                          points but <b> 22% </b> of points <b>lost by Rising Tide's Low Performing Students. </b>
                          </p>")
                   
                   
              )
              
              
              
            ),
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG7_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG7_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG7_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      #G6 Math
      tabItem("g6MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G6 Math </b> exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%206&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr6-math.pdf'>
                    2022 released items PDF (2023 Unavailable) </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2023/grade6/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g6-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
                   </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG6_EE_PTS[1,2], HTML("<p>Expressions <br> and Equations</p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG6_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                            
                              <a href = 'https://docs.google.com/document/d/1kxR_5IlkFHmxaQoOBccTmD-xxuIUlEkATDHwPNwVLj8/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)

                            </p>")
                     
                )
              ),
              
              fluidRow(
                valueBox(MG6_NS_PTS[1,2], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG6_RP_PTS[1,2], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG6_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG6_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG6_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG6_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
      ),
      
      #G6 Math Performance
      tabItem("g6MathAnalysis",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                
                valueBox(MG6_RP_Diff[1,6], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                
                valueBox( MG6_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                     
                )
              ),
              
              # fluidRow(
              #   
              #   box( width = 4, solidHeader = FALSE,
              #        
              #        HTML("<p> <b>Expressions and Equations</b> items account for <b> 30%  </b> of points available 
              #               but  <b> 37% </b> of points  <b>  lost by Rising Tide Students. </b> 
              #         </p>")
              #        
              #   ),
              #   
              #   
              #   
              #   
              #   
              #   box( width = 4, solidHeader = FALSE,
              #        
              #        HTML("<p>
              #                  <b> Number System Items</b> account for <b> 20% </b> of points available
              #                  yet, <b> Low performing Rising Tide students </b> lost only  <b> 10% </b> of their points on 
              #                     these  and all students lost <b>only 10%  </b> of their points on these items.
              #         </p>")
              #        
              #   ),
              #   
              #   box( width = 4, solidHeader = FALSE,
              #        HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b> 
              #             points but <b> 30% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
              #             </p>")
              #        
              #        
              #   )
              #   
              #   
              #   
              # ),
              
              fluidRow(
                
                valueBox(MG6_NS_Diff[1,6], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG6_EE_Diff[1,6], HTML("<p>Expressions <br> and Equations</p>"), icon = icon("equals"), color = "red"),
                
                valueBox(MG6_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red")
              ),
              
              h3("% Points Lost Top Performing Students"),
              fluidRow(
                
                valueBox(paste(MG6_RP_Loss[1,5], "%"), HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                
                valueBox( paste(MG6_GE_Loss[1,5], "%"),"Geometry",icon = icon("shapes"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                             Rising Tide 2023
                              <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                             Weakest Items </a> 

                            </p>")
                     
                )
              ),
              
             
              
              fluidRow(
                
                valueBox(paste(MG6_NS_Loss[1,5], "%"), "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(paste(MG6_EE_Loss[1,5], "%"), HTML("<p>Expressions <br> and Equations</p>"), icon = icon("equals"), color = "red"),
                
                valueBox(paste(MG6_SP_Loss[1,5], "%"), HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "red")
              ),
              fluidRow(
                
                
                
                
                
                
                box( width = 4, solidHeader = FALSE,
                     
                     HTML("<p>
                               <b> Number System Items</b> account for <b> 20% </b> of points available
                               yet, <b>Rising Tide students </b> lost only  <b> 10% </b> of their points on 
                                  these  and all students lost <b>only 10%  </b> of their points on these items.
                      </p>")
                     
                ),
                
                box( width = 4, solidHeader = FALSE,
                     
                     HTML("<p> <b>Expressions and Equations</b> items account for <b> 30%  </b> of points available 
                            but  <b> 37% </b> of points  <b>  lost by Rising Tide Students. </b> 
                      </p>")
                     
                ),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> <b> Statistics and Probability </b> Items account for <b> 20% of available </b> 
                          points but <b> 30% </b> of points <b>lost by Rising Tide's Top Performing Students. </b>
                          </p>")
                     
                     
                )
                
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(paste(MG6_SR_Diff[1,6], "%"), HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(paste(MG6_SA_Diff[1,6], "%"), "Short Answer", icon=icon("pen-to-square")),

                valueBox(paste(MG6_CR_Diff[1,6], "%"), HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
              
      ),
      
      #G5 Math
      
      tabItem("g5MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G5 Math </b> exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%205&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr5-math.pdf'>
                    2022 released items PDF </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2022/grade5/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g5-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
            </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG5_GE_PTS[1,2], "Geometry", icon = icon("shapes"), color = "blue"),
                valueBox( MG5_MD_PTS[1,2],HTML("<p> Measurement <br> and Data </p>"),icon = icon("ruler"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p>
                            
                              <a href = 'https://docs.google.com/document/d/11HBu5rgeCjPSQwmxOqTobsMCxSgfDPICR4myH7ybpJc/edit?usp=drive_link'>
                              Released MCAS Items by Standard </a> (Next Generation MCAS 2019-2023)

                            </p>")
                     
                )
              ),
              
              fluidRow(
                valueBox(MG5_NF_PTS[1,2], HTML("<p>Numbers and <br> Operations: Fractions</p>"), icon = icon("divide"), color = "blue"),
                valueBox(MG5_NT_PTS[1,2], HTML("<p>Numbers and <br> Operations: Base 10</p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG5_OA_PTS[1,2], HTML("<p> Operations and <br> Aglebraic Thinking</p>"), icon = icon("subscript"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG5_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG5_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
              
      ),
      # MG5 Performance
      tabItem("g5MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG5_GE_Diff[1,6], "Geometry", icon = icon("shapes"), color = "blue"),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> The <b> Top Performing </b> students were weakest compared to their peers in the state on <b> Measurement and data Items </b>, while the 
                                <b> Lowest Performing </b> students lost the highest percentage of points in <b> Numbers and Operations Base 10. </b> Notably most 
                                of these items asked students to <b> round, reason with place value, and compare decimals </b> and <b> not </b> to perform calculations with 
                                decimal operations. 
                            </p>"),
                    HTML("<p> Explore the Rising Tide 2023
                     <a href = 'https://docs.google.com/document/d/1tbKex6noJywV97sosAQD_LJF67MQAwQA1D3Vdqz6B8Q/edit?usp=drive_link'>
                       Weakest Items. </a> </p>")
                     
                ),
                
                valueBox( MG5_MD_Diff[1,6],HTML("<p> Measurement <br> and Data </p>"),icon = icon("ruler"), color = "red")
               
                
              ),
              
              fluidRow(
                valueBox(MG5_NF_Diff[1,6], HTML("<p>Numbers and <br> Operations: Fractions</p>"), icon = icon("divide"), color = "blue"),
                valueBox(MG5_NT_Diff[1,6], HTML("<p>Numbers and <br> Operations: Base 10</p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG5_OA_Diff[1,6], HTML("<p> Operations and <br> Aglebraic Thinking</p>"), icon = icon("subscript"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG5_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),

                valueBox(MG5_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),

                valueBox(MG5_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )

              )
              
      ),
   # ELA tab content
    tabItem(tabName = "ela",
           h2("ELA Trends Overview content")
     ),
      
      #G10 ELA Content
      
      tabItem("g10ELAContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2023 <b> G10 ELA </b> exam consisted of 28 selected response
              questions and two essays worth in <b>total 51 points </b>.
                  </p>"),
              h2("Available Points by Content Category"),

              h3("Reading"),
              fluidRow(
                valueBox( EG10_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
                valueBox(EG10_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
                box( title = "Released Materials", width = 4, solidHeader = FALSE,
                     HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%2010&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr10_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>"))

              ),

              h3("Writing"),
              fluidRow(
                valueBox( EG10_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
                valueBox( EG10_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box(title = "Notes", width = 4, solidHeader = FALSE,
                    HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2022/grade10/ela.html'>
                                Scoring guidelines </a>
                            </p>"
                    )
                )

              ),

              h2("Available Points by Text Type"),
              h3("Reading"),
              fluidRow(
                valueBox(EG10_NFRead_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),



                box( title = "Notes", width = 4, solidHeader = FALSE,

                     HTML("<p> Text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>"))


              ),
              h3("Writing"),
              fluidRow(
                valueBox(EG10_NFWrite_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
                valueBox(EG10_FWrite_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),



                box( title = "Notes", width = 4, solidHeader = FALSE,

                     HTML("<p> Text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>"))


              ),
              h2("Available Points by Text Quantity"),
              h3("Reading"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),

                valueBox(EG10_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),


                box( title = "Notes", width = 4, solidHeader = FALSE,

                     HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1TLJTY_twbuuSqCZx_9h_g4ZO4_pLuCWGgpCwklRebdE/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>"))
              ),
              h3("Writing"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),

                valueBox(EG10_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),


                box( title = "Notes", width = 4, solidHeader = FALSE,

                     HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>"))
              ),

              h2("Available Selected Response Points by Domain Cluster"),
              HTML("<p>The 2023 <b> G10 ELA </b> exam consisted of 28 selected response
              questions worth in <b>total 35 points </b>.</p>"),


              fluidRow(
                # A static valueBox
                valueBox(EG10_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
                valueBox(EG10_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
                valueBox(EG10_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),



                # valueBox(EG10_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),

                valueBox(EG10_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
                valueBox(EG10_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
                box( title = "Notes", width = 4, solidHeader = FALSE,
                     HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks.</p>"))
              )



              # h3("Available Points by Question Type"),
              # fluidRow(
              #   # A static valueBox
              #   valueBox(EG10_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
              # 
              #   valueBox(EG10_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
              # 
              #   box(  width = 4, solidHeader = FALSE,
              #        HTML("<p> 2022 student released
              #             <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade10/ela.html'>
              #               essays </a> and Scoring Guidelines </p>")
                # )

              #)
      ),
      
      #G10 ELA Performance
      
      tabItem("g10ELAReadingAnalysis",
              
              span(h1("How do we support reading?")), #style = "color:black")),
              
              h2("% Reading Points Lost by Reporting Category"),
              
              fluidRow(
                valueBox( paste(EG10_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
                valueBox( paste(EG10_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
                box(width = 4, solidHeader = FALSE,
                    HTML("<p>
                           <b>  Reading Comprehension </b> accounts for almost all selected response points lost by Rising Tide Students.
                        </p>"
                    )
                )
              ),
              
              h2("% Selected Response Lost by Domain Cluster"),
              
              
              fluidRow(
                # A static valueBox
                
                valueBox(paste(round(EG10_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
                valueBox(paste(EG10_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
                
                
                
                valueBox(paste(EG10_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
                
                
                
                # valueBox(EG10_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
                
                valueBox(paste(round(EG10_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> <b> 28% </b> of points lost by RT students came from
                       <b> Craft and Structure </b> items although they account for 
                          only 23% of available points. </p>")
                ),
                
                valueBox(paste(EG10_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
                
                
                
              ),
              
              h2("RT-State Reading Comprehension Diff by Text Type"),
              
              fluidRow(
                
                valueBox(EG10_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
                box(  width = 4, solidHeader = FALSE,
                      
                      HTML("<p> Students demonstrated a <b> stronger </b> level of comprehension of 
                           informational texts relative to their peers in the state. </p>"),
                      
                      HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>")
                      
                  )
                      
                ),
                
          
              h2("% Reading Points Lost by Text Type"),
              fluidRow(

                valueBox(paste(EG10_NFRead_Loss[1,5], "%"), HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(paste(EG10_FRead_Loss[1,5], "%"), HTML("<p> Literature </p>"), icon=icon("book"), color = "red"),
                box(  width = 4, solidHeader = FALSE,

                     HTML("<p> Comprehension of Literature accounts for <b> 3/4 </b> of reading points lost by Rising Tide students, but only
                              <b> 71% </b> of available reading points.</a> </p>")
                     )



              )
             

      ),
      
      #G10 ELA Analysis
      
      tabItem("g10ELAWritingAnalysis",
              span(h1("How do we support writing?")), #style = "color:black")),
              span( h2("Idea Development")),
             #  h3("RT-State Diff"),
             #  fluidRow(
             #    valueBox( paste(EG10_ESidea_Diff[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             #    valueBox( paste(EG10_ESconv_Diff[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             #    box( width = 4, solidHeader = FALSE,
             #         HTML("<p> Rising Tide students earned <b> fewer points </b> than their peers in the state
             # across <b> all writing categories </b>. </p>"))
             #  ),
             #  #To-Do: Produce visual here?
             #  fluidRow(
             #    dataTableOutput("EG10_student_item_perf_by_type")
             #  ),
             #  # fluidRow(
             #  #   box(
             #  #     status = "primary", solidHeader = TRUE,
             #  #     collapsible = TRUE, width = 500,
             #  #     plotOutput("EG10_Bar_Plot")
             #  #   )
             #  # ),
             #  h3("RT-State Diff"),

              h2("% Points Lost by Writing Subscore"),
              h3("All Students"),
              fluidRow(
                valueBox( paste(EG10_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
                valueBox( paste(EG10_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> <b>Idea Development </b> accounts for <b>63% </b> of available <b> writing </b> points
                  on the MCAS and <b> 89% of points lost by Rising Tide </b> students. </p>"))
              ),

              h3("Top-Performing Students"),
              fluidRow(
                valueBox( paste(EG10Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
                valueBox( paste(EG10Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> The trend is <b> more pronounced </b> in students with scores <b> greater
                  than 515 </b>. </p>"))
              ),




              h2("% Points Lost by Text Type"),
              h3("All Students"),
              fluidRow(
                # A static valueBox
                valueBox(paste(EG10_NFWrite_Loss[1,5], "%"), HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
                valueBox(paste(EG10_FWrite_Loss[1,5], "%"), HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> In <b> contrast</b> to their reading scores by text type,
                    Rising Tide students lost writing points at rates independent of the text type and student performance level.
                    This suggests the need to review the practice of writing in <b> both ELA and Social Studies </b>. </p>"))
              ),
              h2("% Points Lost by Text Quantity"),

              h3("Writing"),
              fluidRow(

                valueBox(paste(EG10_2TextWrite_Loss[1,5], "%"), HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
                valueBox(EG10_1TextWrite_Loss[1,5], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> <b>All</b> essay prompts required students to <b> synthesize two </b> texts. </p>"))

              )

      ),
      
      
      tabItem("g10ELAAnalysis",
              span(h1("How do we support reading?")), #style = "color:black")),
              
              h2("% Reading Points Lost by Reporting Category"),
              
              fluidRow(
                valueBox( paste(EG10_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
                valueBox( paste(EG10_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
                box( title = "Released Materials", width = 4, solidHeader = FALSE,
                     HTML("<p>
                           <b>  Reading Comprehension </b> accounts for the almost all selected response points lost by Rising Tide Students.
                        </p>"
                     )
                     )
              ),
              
              h2("% Selected Response Lost by Domain Cluster"),
              
              
              fluidRow(
                # A static valueBox
                
                valueBox(paste(round(EG10_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
                valueBox(paste(EG10_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
                
                
                
                valueBox(paste(EG10_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
                
                
                
                # valueBox(EG10_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
                
                valueBox(paste(round(EG10_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> <b> 28% </b> of points lost by RT students came from
                       <b> Craft and Structure </b> items although they account for 
                          only <b> 21% </b> of available points. </p>")
                    
                ),
                
                valueBox(paste(EG10_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
                
                
                
              ),
              
              h2("RT-State Diff by Text Type"),
              
              fluidRow(
                
                valueBox(EG10_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
                box(  width = 4, solidHeader = FALSE,
                      
                     HTML("<p> Students demonstrated <b> stronger </b> levels of comprehension of 
                          information relative to their peers in the state. </p>"),
                      
                      HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>")
                      
                )
                
                
                
              ),
              
              fluidRow(
                
                valueBox(EG10_NFRead_Loss[1,5], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_Loss[1,5], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
                box(  width = 4, solidHeader = FALSE,
                      
                      HTML("<p> Students demonstrated <b> stronger </b> levels of comprehension of 
                          information relative to their peers in the state. </p>"),
                      
                      HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G10 ELA xWalk.</a> </p>")
                      
                )
                
                
                
              ),
              
              
              h1("How do we support our writers?"),
              h2("% of Writing Points Lost"),
              h3("All Students"),
              fluidRow(
                valueBox( paste(EG10_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
                valueBox( paste(EG10_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box(width = 4, solidHeader = FALSE,
                    HTML("<p> <b> 75% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                    )
                )
                
              ),
              
              h3("Top Performing Students"),
              fluidRow(
                valueBox( paste(EG10Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
                valueBox( paste(EG10Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box(width = 4, solidHeader = FALSE,
                    HTML("<p> This trend is <b> more pronounced </b> in the <b> Top Performing Students </b>
                            </p>"
                    )
                )
                
              )
              
              
              # h3("Writing"),
              # fluidRow(
              #   # A static valueBox
              #   valueBox(EG10_NFWrite_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
              #   valueBox(EG10_FWrite_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
              #   box( title = "Notes", width = 4, solidHeader = FALSE,
              #        
              #        HTML("<p> Text title and types in the <a href =
              #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
              #             G10 ELA xWalk.</a> </p>"))
              #   
              #   
              #   
              # ),
              # h2("RT-State Diff by Text Quantity"),
              # h3("Reading"),
              # fluidRow(
              #   # A static valueBox
              #   valueBox(EG10_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
              #   valueBox(EG10_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
              #   box( title = "Notes", width = 4, solidHeader = FALSE,
              #        
              #        HTML("<p> Links to questions in the <a href =
              #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
              #             G10 ELA xWalk.</a> </p>"))
              #   
              #   
              #   
              # )
              
              # h3("Writing"),
              # fluidRow(
              #   
              #   valueBox(EG10_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
              #   valueBox(EG10_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
              #   box( title = "Notes", width = 4, solidHeader = FALSE,
              #        HTML("<p> Links to questions in the <a href =
              #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
              #             G10 ELA xWalk.</a> </p>"))
              #   
              #   
              #   
              # ),
              
              
      ),
   
 
   
   #G8 ELA Content
   
   tabItem("g8ELAContent",
           span(h1("How were students assessed?")), #style = "color:black")),
           HTML("<p>The 2023 <b> G8 ELA </b> exam consisted of 29 selected response
              questions and two essays worth in <b>total 50 points </b>.
                  </p>"),
           h2("Available Points by Content Category"),
           
           h3("Reading"),
           fluidRow(
             valueBox( EG8_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
             valueBox(EG8_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box( title = "Released Materials", width = 4, solidHeader = FALSE,
                  HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%208&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr8-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr8_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>"))
             
           ),
           
           h3("Writing"),
           fluidRow(
             valueBox( EG8_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( EG8_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(title = "Notes", width = 4, solidHeader = FALSE,
                 HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2023/grade8/ela.html'>
                                Scoring guidelines </a>





                            </p>"
                 )
             )
             
           ),
           
           h2("Available Points by Text Type"),
           h3("Reading"),
           fluidRow(
             valueBox(EG8_NFRead_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG8_FRead_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Text Titles and types  in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G8 ELA xWalk</a> </p>"))
             
             
           ),
           h3("Writing"),
           fluidRow(
             valueBox(EG8_NFWrite_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
             valueBox(EG8_FWrite_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Item Descriptions in <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       Item Results</a> </p>"))
             
             
           ),
           h2("Available Points by Text Quantity"),
           h3("Reading"),
           fluidRow(
             # A static valueBox
             valueBox(EG8_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
             
             valueBox(EG8_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                        Item Results</a> </p>"))
           ),
           h3("Writing"),
           fluidRow(
             # A static valueBox
             valueBox(EG8_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
             
             valueBox(EG8_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G8 Item Results</a> </p>"))
           ),
           
           h2("Available Selected Response Points by Domain Cluster"),
           HTML("<p>The 2023 <b> G8 ELA </b> exam consisted of 29 selected response
              questions worth in <b>total 34 points </b>.</p>"),
           
           
           fluidRow(
             # A static valueBox
             valueBox(EG8_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(EG8_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
             valueBox(EG8_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG8_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(EG8_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             valueBox(EG8_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks</p>"))
           )
           
           
           
           # h3("Available Points by Question Type"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
           # 
           #   valueBox(EG8_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
           # 
           #   box(  width = 4, solidHeader = FALSE,
           #        HTML("<p> 2022 student released
           #             <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade8/ela.html'>
           #               essays </a> and Scoring Guidelines </p>")
           # )
           
           #)
   ),
   
   #G8 ELA Performance
   # G8 ELA Paste
   
   tabItem("g8ELAAnalysis",
           span(h1("How do we support reading?")), #style = "color:black")),
           
           h2("% Reading Points Lost by Reporting Category"),
           
           fluidRow(
             valueBox( paste(EG8_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG8_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box(width = 4, solidHeader = FALSE,
                  HTML("<p>
                           <b>  Reading Comprehension </b> accounts for the almost all selected response points lost by Rising Tide Students.
                        </p>"
                  )
             )
            ),
             
             h3("Top Performing Students"),
             fluidRow(
               valueBox( paste(EG8Top_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
               valueBox( paste(EG8Top_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
               box(width = 4, solidHeader = FALSE,
                   HTML("<p>
                            This is more pronounced in<b> Top Performing Students. </b>
                        </p>"
                   )
               )
              ),
           
           h2("% Selected Response Lost by Domain Cluster"),
           
           
           fluidRow(
             # A static valueBox
             
             valueBox(paste(round(EG8_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(paste(EG8_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
             
             
             
             valueBox(paste(EG8_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG8_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(paste(round(EG8_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             box( width = 4, solidHeader = FALSE,
                  HTML("<p> <b> 41% </b> of points lost by RT students came from
                       <b> Craft and Structure </b> items. </p>"),
                  HTML("<p> Although Craft and Structure items account for <b> 38% </b> of available points,
                          <b> Top Performing Students </b>  </b> 
                        lost <b> 48% </b> of their reading comprehension points to 
                       Craft and Structure items. </p>")
             ),
             
             valueBox(paste(EG8_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
             
             
             
           ),
           
           h2("RT-State Reading Comprehension Diff by Text Type"),
           
           fluidRow(
             
             valueBox(EG8_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG8_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                   
                   HTML("<p> Students demonstrated <b> similar </b> levels of comprehension of 
                          literature and informational texts relative to their peers in the state. </p>"),
                   
                   HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G8 ELA xWalk.</a> </p>")
                   
             )
             
             
             
           ),
           
           
           h1("How do we support our writers?"),
           h2("% of Writing Points Lost"),
           h3("All Students"),
           fluidRow(
             valueBox( paste(EG8_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG8_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> <b> 75% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                 )
             )
             
           ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG8Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG8Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> This trend is <b> more pronounced </b> in the <b> Top Performing Students </b>
                            </p>"
                 )
             )
             
           )
           
           
           # h3("Writing"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG8_NFWrite_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
           #   valueBox(EG8_FWrite_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Text title and types in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G8 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           # h2("RT-State Diff by Text Quantity"),
           # h3("Reading"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG8_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
           #   valueBox(EG8_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G8 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # )
           
           # h3("Writing"),
           # fluidRow(
           #   
           #   valueBox(EG8_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
           #   valueBox(EG8_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G8 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           
           
   ),
   
   #G7 ELA Content
   
   tabItem("g7ELAContent",
           span(h1("How were students assessed?")), #style = "color:black")),
           HTML("<p>The 2023 <b> G7 ELA </b> exam consisted of 29 selected response
              questions and two essays worth in <b>total 50 points </b>.
                  </p>"),
           h2("Available Points by Content Category"),
           
           h3("Reading"),
           fluidRow(
             valueBox( EG7_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
             valueBox(EG7_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box( title = "Released Materials", width = 4, solidHeader = FALSE,
                  HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%207&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr7-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr7_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>"))
             
           ),
           
           h3("Writing"),
           fluidRow(
             valueBox( EG7_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( EG7_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(title = "Notes", width = 4, solidHeader = FALSE,
                 HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2023/grade7/ela.html'>
                                Scoring guidelines </a>





                            </p>"
                 )
             )
             
           ),
           
           h2("Available Points by Text Type"),
           h3("Reading"),
           fluidRow(
             valueBox(EG7_NFRead_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG7_FRead_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Text Titles and types  in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G7 ELA xWalk</a> </p>"))
             
             
           ),
           h3("Writing"),
           fluidRow(
             valueBox(EG7_NFWrite_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
             valueBox(EG7_FWrite_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Item Descriptions in <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G7 ELA Item Results</a> </p>"))
             
             
           ),
           h2("Available Points by Text Quantity"),
           h3("Reading"),
           fluidRow(
             # A static valueBox
             valueBox(EG7_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
             
             valueBox(EG7_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G7 ELA Item Results</a> </p>"))
           ),
           h3("Writing"),
           fluidRow(
             # A static valueBox
             valueBox(EG7_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
             
             valueBox(EG7_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G7 ELA Item Results</a> </p>"))
           ),
           
           h2("Available Selected Response Points by Domain Cluster"),
           HTML("<p>The 2023 <b> G7 ELA </b> exam consisted of 29 selected response
              questions worth in <b>total 34 points </b>.</p>"),
           
           
           fluidRow(
             # A static valueBox
             valueBox(EG7_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(EG7_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
             valueBox(EG7_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG7_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(EG7_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             valueBox(EG7_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks</p>"))
           )
           
           
           
           # h3("Available Points by Question Type"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG7_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
           # 
           #   valueBox(EG7_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
           # 
           #   box(  width = 4, solidHeader = FALSE,
           #        HTML("<p> 2022 student released
           #             <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade7/ela.html'>
           #               essays </a> and Scoring Guidelines </p>")
           # )
           
           #)
   ),
   
   #G7 ELA Paste
   #G7 ELA Performance
   
   tabItem("g7ELAAnalysis",
           span(h1("How do we support reading?")), #style = "color:black")),
           
           h2("% Reading Points Lost by Reporting Category"),
           
           fluidRow(
             valueBox( paste(EG7_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG7_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                   HTML("<p>
                           <b>  Reading Comprehension </b> accounts for the almost all selected response points lost by Rising Tide Students.
                        </p>"
                        )
             )
           ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG7Top_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG7Top_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p>
                            This is more pronounced in<b> Top Performing Students. </b>
                        </p>"
                 )
             )
           ),
           
           
           h2("% Selected Response Lost by Domain Cluster"),
           
           
           fluidRow(
             # A static valueBox
             
             valueBox(paste(round(EG7_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(paste(EG7Top_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
             
             
             
             valueBox(paste(EG7_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG7_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(paste(round(EG7_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             box( width = 4, solidHeader = FALSE,
                  HTML("<p> <b> 32% </b> of points lost by <b> Top Performing RT students </b> came from
                       <b> Craft and Structure </b> items. </p>"),
                  
             ),
             
             valueBox(paste(EG7_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
             
             
             
           ),
           
           h2("RT-State Reading Comprehension Diff by Text Type"),
           
           fluidRow(
             
             valueBox(EG7_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG7_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                   
                   HTML("<p> Students demonstrated <b> similar </b> levels of comprehension of 
                          literature and informational texts relative to their peers in the state. </p>"),
                   
                   HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G7 ELA xWalk.</a> </p>")
                   
             )
             
             
             
           ),
           
           
           h1("How do we support our writers?"),
           h2("% of Writing Points Lost"),
           h3("All Students"),
           fluidRow(
             valueBox( paste(EG7_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG7_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> <b> 75% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                 )
             )
             
           ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG7Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG7Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> This trend is <b> more pronounced </b> in the <b> Top Performing Students. </b>
                            </p>"
                 )
             )
             
           )
           
           
           # h3("Writing"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG7_NFWrite_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
           #   valueBox(EG7_FWrite_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Text title and types in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G7 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           # h2("RT-State Diff by Text Quantity"),
           # h3("Reading"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG7_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
           #   valueBox(EG7_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G7 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # )
           
           # h3("Writing"),
           # fluidRow(
           #   
           #   valueBox(EG7_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
           #   valueBox(EG7_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G7 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           
           
   ),
   
   
   #G6 ELA Content
   
   tabItem("g6ELAContent",
           span(h1("How were students assessed?")), #style = "color:black")),
           HTML("<p>The 2023 <b> G6 ELA </b> exam consisted of 29 selected response
              questions and two essays worth in <b>total 50 points </b>.
                  </p>"),
           h2("Available Points by Content Category"),
           
           h3("Reading"),
           fluidRow(
             valueBox( EG6_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
             valueBox(EG6_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box( title = "Released Materials", width = 4, solidHeader = FALSE,
                  HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%206&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr6-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr6_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>"))
             
           ),
           
           h3("Writing"),
           fluidRow(
             valueBox( EG6_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( EG6_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(title = "Notes", width = 4, solidHeader = FALSE,
                 HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2023/grade6/ela.html'>
                                Scoring guidelines </a>





                            </p>"
                 )
             )
             
           ),
           
           h2("Available Points by Text Type"),
           h3("Reading"),
           fluidRow(
             valueBox(EG6_NFRead_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG6_FRead_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Text Titles and types  in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G6 ELA xWalk</a> </p>"))
             
             
           ),
           h3("Writing"),
           fluidRow(
             valueBox(EG6_NFWrite_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
             valueBox(EG6_FWrite_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Item Descriptions in <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G6 ELA Item Results</a> </p>"))
             
             
           ),
           h2("Available Points by Text Quantity"),
           h3("Reading"),
           fluidRow(
             # A static valueBox
             valueBox(EG6_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
             
             valueBox(EG6_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G6 ELA Item Results</a> </p>"))
           ),
           h3("Writing"),
           fluidRow(
             # A static valueBox
             valueBox(EG6_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
             
             valueBox(EG6_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G6 ELA Item Results</a> </p>"))
           ),
           
           h2("Available Selected Response Points by Domain Cluster"),
           HTML("<p>The 2023 <b> G6 ELA </b> exam consisted of 29 selected response
              questions worth in <b>total 34 points </b>.</p>"),
           
           
           fluidRow(
             # A static valueBox
             valueBox(EG6_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(EG6_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
             valueBox(EG6_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG6_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(EG6_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             valueBox(EG6_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks</p>"))
           )
           
           
           
           # h3("Available Points by Question Type"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG6_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
           # 
           #   valueBox(EG6_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
           # 
           #   box(  width = 4, solidHeader = FALSE,
           #        HTML("<p> 2022 student released
           #             <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade6/ela.html'>
           #               essays </a> and Scoring Guidelines </p>")
           # )
           
           #)
   ),
   
   #G6 ELA Performance
   
   tabItem("g6ELAAnalysis",
           span(h1("How do we support reading?")), #style = "color:black")),
           
           h2("% Reading Points Lost by Reporting Category"),
           
           fluidRow(
             valueBox( paste(EG6_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG6_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                  HTML("<p>
                           <b>  Reading Comprehension </b> accounts for the almost all selected response points lost by Rising Tide Students.
                        </p>")
                  )
           ),
           
           h2("% Selected Response Lost by Domain Cluster"),
           
           
           fluidRow(
             # A static valueBox
             
             valueBox(paste(round(EG6_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(paste(EG6_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
             
             
             
             valueBox(paste(EG6_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG6_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(paste(round(EG6_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             box( width = 4, solidHeader = FALSE,
                  HTML("<p> <b> 41% </b> of points lost by RT students came from
                       <b> Craft and Structure </b> items. </p>"),
                  HTML("<p> Students <b> meeting or partially meeting expectations </b> 
                        lost <b> disproportionately more </b> of their reading comprehension points to 
                       <b> Craft and Structure </b> items. </p>")
             ),
             
             valueBox(paste(EG6_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
             
             
             
           ),
           
           h2("RT-State Reading Comprehension Diff by Text Type"),
           
           fluidRow(
             
             valueBox(EG6_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG6_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                   
                   HTML("<p> It was not clear from the item descriptions if there were
                              informational texts; however all other grade level assessments 
                            included informational texts. </p>"),
                   
                   HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G6 ELA xWalk.</a> </p>")
                   
             )
             
             
             
           ),
           
           
           h1("How do we support our writers?"),
           h2("% of Writing Points Lost"),
           h3("All Students"),
           fluidRow(
             valueBox( paste(EG6_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG6_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> <b> 75% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                 )
             )
             
           ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG6Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG6Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> This trend is <b> more pronounced </b> in the <b> Top Performing Students </b>
                            </p>"
                 )
             )
             
           )
           
           
           # h3("Writing"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG6_NFWrite_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
           #   valueBox(EG6_FWrite_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Text title and types in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G6 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           # h2("RT-State Diff by Text Quantity"),
           # h3("Reading"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG6_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
           #   valueBox(EG6_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G6 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # )
           
           # h3("Writing"),
           # fluidRow(
           #   
           #   valueBox(EG6_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
           #   valueBox(EG6_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G6 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           
           
   ),
   
   ##G5 ELA Paste
   #G5 ELA Content
   
   tabItem("g5ELAContent",
           span(h1("How were students assessed?")), #style = "color:black")),
           HTML("<p>The 2023 <b> G5 ELA </b> exam consisted of 29 selected response
              questions and two essays worth in <b>total 50 points </b>.
                  </p>"),
           h2("Available Points by Content Category"),
           
           h3("Reading"),
           fluidRow(
             valueBox( EG5_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
             valueBox(EG5_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box( title = "Released Materials", width = 4, solidHeader = FALSE,
                  HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%205&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr5-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr5_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>"))
             
           ),
           
           h3("Writing"),
           fluidRow(
             valueBox( EG5_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( EG5_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(title = "Notes", width = 4, solidHeader = FALSE,
                 HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2023/grade5/ela.html'>
                                Scoring guidelines </a>





                            </p>"
                 )
             )
             
           ),
           
           h2("Available Points by Text Type"),
           h3("Reading"),
           fluidRow(
             valueBox(EG5_NFRead_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG5_FRead_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Text Titles and types  in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G5 ELA xWalk</a> </p>"))
             
             
           ),
           h3("Writing"),
           fluidRow(
             valueBox(EG5_NFWrite_PTS[1,2], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
             valueBox(EG5_FWrite_PTS[1,2], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
             
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Item Descriptions in <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G5 ELA Item Results</a> </p>"))
             
             
           ),
           h2("Available Points by Text Quantity"),
           h3("Reading"),
           fluidRow(
             # A static valueBox
             valueBox(EG5_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
             
             valueBox(EG5_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G5 ELA Item Results</a> </p>"))
           ),
           h3("Writing"),
           fluidRow(
             # A static valueBox
             valueBox(EG5_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
             
             valueBox(EG5_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
             
             
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Links to questions in the <a href =
                      'https://docs.google.com/spreadsheets/d/1Qp1vP7KVftxzWrhM-EjxJVnEOGLmS01vsRvf0VdIbH4/edit?usp=sharing'>
                       G5 ELA Item Results</a> </p>"))
           ),
           
           h2("Available Selected Response Points by Domain Cluster"),
           HTML("<p>The 2023 <b> G5 ELA </b> exam consisted of 29 selected response
              questions worth in <b>total 34 points </b>.</p>"),
           
           
           fluidRow(
             # A static valueBox
             valueBox(EG5_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(EG5_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
             valueBox(EG5_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG5_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(EG5_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             valueBox(EG5_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
             box( title = "Notes", width = 4, solidHeader = FALSE,
                  HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks</p>"))
           )
           
           
           
           # h3("Available Points by Question Type"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
           # 
           #   valueBox(EG5_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
           # 
           #   box(  width = 4, solidHeader = FALSE,
           #        HTML("<p> 2022 student released
           #             <a href = 'https://www.doe.mass.edu/mcas/student/2023/grade5/ela.html'>
           #               essays </a> and Scoring Guidelines </p>")
           # )
           
           #)
   ),
   
   #G5 ELA Performance
   
   tabItem("g5ELAAnalysis",
           span(h1("How do we support reading?")), #style = "color:black")),
           
           
           h2("% Reading Points Lost by Reporting Category"),
           h3("All Students"),
           
           fluidRow(
             valueBox( paste(EG5_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG5_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             box( title = "Released Materials", width = 4, solidHeader = FALSE,
                  HTML("<p>
                            <b> 77% of Points Lost by Rising Tide Students </b> came from reading comprehension items. Students 
                                with lower performance levels lost signficantly more points on reading comprehension items.
                        </p>")
                  )
              ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG5Top_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             valueBox( paste(EG5Top_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
             

             # h3("Lowest Performing Students"),
             # 
             # fluidRow(
             #   valueBox( paste(EG5Low_RE_Loss[1,5], "%") ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
             #   valueBox( paste(EG5Low_LA_Loss[1,5], "%"),  HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue")
             #   
             # ),
           ),
           h2("% Selected Response Lost by Domain Cluster"),
           
           
           
           
           fluidRow(
             # A static valueBox
             
             valueBox(paste(round(EG5_KD_Loss[1,5]), "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
             valueBox(paste(EG5_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
             
             
             
             valueBox(paste(EG5_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
             
             
             
             # valueBox(EG5_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
             
             valueBox(paste(round(EG5_VA_Loss[1,5]), "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
             box( width = 4, solidHeader = FALSE,
                  HTML("<p> <b>15% </b> of points lost by RT students came from
                       <b> Craft and Structure </b> items, even though they
                       account for <b>only 11% </b> of points available</p>"),
                  HTML("<p> <b>18% </b> of points lost by students meeting <b> but not exceeding </b>
                        expectations came from
                       <b> Craft and Structure </b> items. </p>")
             ),
             
             valueBox(paste(EG5_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
            
             
             
           ),
           
           h2("RT-State Reading Comprehension Diff by Text Type"),
           
           fluidRow(
             
             valueBox(EG5_NFRead_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "blue" ),
             valueBox(EG5_FRead_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "blue"),
             box(  width = 4, solidHeader = FALSE,
                  
                  HTML("<p> Students demonstrated <b> similar </b> levels of comprehension of 
                          literature and informational texts relative to their peers in the state. </p>"),
                  
                  HTML("<p> Find text title and types in the <a href =
                      'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
                       G5 ELA xWalk.</a> </p>")
                  
                  )
             
             
             
           ),
           
         
           h1("How do we support our writers?"),
           h2("RT-State Diff"),
           
           fluidRow(
             valueBox( paste(EG5_ESidea_Diff[1,5]),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG5_ESconv_Diff[1,5]),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> 
                 
                      <b> 61% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                    )
                )
             ), 
           h2("% of Writing Points Lost"),
           h3("All Students"),
           fluidRow(
             valueBox( paste(EG5_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( paste(EG5_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> 
                 
                      <b> 61% </b> of essay points lost by Rising Tide students were due to <b>Idea Development </b>. <ul>
                             
                            </p>"
                 )
             )
             
           ),
           
           h3("Top Performing Students"),
           fluidRow(
             valueBox( paste(EG5Top_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
             valueBox( paste(EG5Top_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p> <b> Top Performing Students </b> lost disproportionately more points in Idea Development.
                            </p>"
                 )
             )
             
           ),
           h3("Low Performing Students"),
           fluidRow(
             valueBox( paste(EG5Low_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
             valueBox( paste(EG5Low_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
             box(width = 4, solidHeader = FALSE,
                 HTML("<p>  <b> Low Performing Students </b> lost essay points reflective of their relative weights in the exam.
                            </p>"
                 )
             )
             
           )
           
      
           # h3("Writing"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG5_NFWrite_Diff[1,6], HTML("<p> Informational Texts </p>"),icon=icon("newspaper"), color = "light-blue" ),
           #   valueBox(EG5_FWrite_Diff[1,6], HTML("<p> Literature </p>"), icon=icon("book"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Text title and types in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G5 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
           # h2("RT-State Diff by Text Quantity"),
           # h3("Reading"),
           # fluidRow(
           #   # A static valueBox
           #   valueBox(EG5_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
           #   valueBox(EG5_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G5 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # )
           
           # h3("Writing"),
           # fluidRow(
           #   
           #   valueBox(EG5_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
           #   valueBox(EG5_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
           #   box( title = "Notes", width = 4, solidHeader = FALSE,
           #        HTML("<p> Links to questions in the <a href =
           #            'https://docs.google.com/spreadsheets/d/1zxvLjYuxXifo5vYfNpGCfJ4esp0e1Z-TgC71ZlxN9Tc/edit?usp=sharing'>
           #             G5 ELA xWalk.</a> </p>"))
           #   
           #   
           #   
           # ),
        
           
   )
      
      
      
    )
  )
  
)
