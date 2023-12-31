###Exam Content Functions -------------------------------------------------------


##Function for number of points available by question type
#------------------------------------------------------------------------------
##Function for number of points available by question type:
# Math: CR, SA, SR
#ELA: ES, SR
# Sci: CR, SR
Item_Type_Points <-function(itemType, subjectItemDF){
  
  if(itemType == "ES"){
    subjectItemDF%>%
      select(`Type`, `item Possible Points`)%>%
      group_by(`Type`)%>%
      summarize(available_points = .5*sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Type` == itemType)
    
  }else{
    subjectItemDF%>%
      select(`Type`, `item Possible Points`)%>%
      group_by(`Type`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Type` == itemType)
  }
}       

## Function for available points by Grade Level
Grade_Level_Points <-function(subjectItemDF, gradeLevel){
  subjectItemDF%>%
    select(`Grade Level`, `item Possible Points`)%>%
      group_by(`Grade Level`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Grade Level` == gradeLevel)
  
}  

##Function for available points by practice category/cluster

#-------------------------------------------------------------------------------

Practice_Cat_Points <-function(subject, practiceCategory, subjectItemDF){
  if(subject == "science"){
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Practice Category`)%>%
      group_by(`Practice Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Practice Category` == practiceCategory)
  }
  ##To-Do Need to Identify Equivalent to Practice category in math (perhaps representation type?)
  # else if (subject == "math"){
  #   subjectItemDF%>%
  #     select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
  #     group_by(`Reporting Category`)%>%
  #     summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
  
  #} 
  else if (subject == "ela"){
    subjectItemDF%>%
      filter(!str_detect(`Type`,"ES"))%>%
      select(`eitem`, `item Possible Points`, `Cluster`)%>%
      group_by(`Cluster`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Cluster` == practiceCategory)
    
  }
}    


## Discipline Core Idea Points -------------------------------------------------
DCI_Points <-function(subjectItemDF){
 
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Discipline Core Idea`)%>%
      group_by(`Discipline Core Idea`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))#%>%
      #filter(`Discipline Core Idea` == disciplineCoreIdea)
}    
##Function for dataframe with points available by reporting category------------

Reporting_Cat_Points <-function(subject, reportingCategory, subjectItemDF){
  if(subject == "science"){
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
  }
  else if (subject == "math"){
    subjectItemDF%>%
      select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  } 
  else if (subject == "ela"){
    subjectItemDF%>%
      select(`eitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  }
}

## SG9 xWalk Points Functions--------------------------------------------------
Rep_Info_Points<-function(subjectItemDF){
  subjectItemDF%>%
    select(`sitem`, `item Possible Points`, `Representation of Information`)%>%
    group_by(`Representation of Information`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm = TRUE))#%>%
    #filter(`Representation of Information` == representation)
}
## ELA xWalk Points Functions--------------------------------------------------
# Fiction-Non
ELA_TextType_Points<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Text Type`)%>%
    filter(!str_detect(eitem,"LA|WR"))%>%
    group_by(`Text Type`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
    filter(`Text Type` == value)
}

## ELA: Num Texts
ELA_NumText_Points<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Num Texts`)%>%
    filter(!str_detect(eitem,"LA|WR"))%>%
    group_by(`Num Texts`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
    filter(`Num Texts` == value)
}

