source('dependencies.R')

## Create Student Item Data Frames----------------------------------------------
student_itemDF<-read_MCAS_Prelim_Private("csv","data/PrivProtectMCAS2023_spring_prelim_04830000.csv")
#view(student_itemDF)


## Science Exam Content Pages
### To-Do: NOTE!! HS STE does not have values on the constructed response, manually upadted in files
SG11_item <-read_item("data/MCAS_2023_STE_HS_Item_Analysis_Template_V1.xlsx", "High School Biology", "science")
#view(SG11_item)
SG11_standard_xWalk <- read_standardXwalk("data/2023MCASItemXWalk.xlsx", "SG11_standard_xwalk")
#view(SG11_standard_xWalk)
SG11_item <- left_join(SG11_item, SG11_standard_xWalk, by = "Standard")
#view(SG11_item)

#G11 Biology Exam Content Page
SG11_CR_PTS<-Item_Type_Points("CR", SG11_item)
SG11_SR_PTS<-Item_Type_Points("SR", SG11_item)
SG11_MD_PTS<-Practice_Cat_Points("science", "B. Mathematics and Data", SG11_item)
SG11_ERM_PTS<-Practice_Cat_Points("science", "C. Evidence, Reasoning, and Modeling", SG11_item)
SG11_IQ_PTS<-Practice_Cat_Points("science", "A. Investigations and Questioning", SG11_item)
SG11_EC_PTS<-Reporting_Cat_Points("science", "Ecology", SG11_item)
SG11_EV_PTS<-Reporting_Cat_Points("science", "Evolution", SG11_item)
SG11_HE_PTS<-Reporting_Cat_Points("science", "Heredity", SG11_item)
SG11_MO_PTS<-Reporting_Cat_Points("science", "Molecules to Organisms", SG11_item)

# SG9 Physics Exam Content Page
SG9_item <-read_item("data/MCAS_2023_STE_HS_Item_Analysis_Template_V1.xlsx", "High School Physics", "science")
#view(SG9_item)
SG9_standard_xWalk <- read_standardXwalk("data/2023MCASItemXWalk.xlsx", "SG9_standard_xwalk")
#view(SG9_standard_xWalk)

SG9_item<-left_join(SG9_item, SG9_standard_xWalk, by = "Standard")
#view(SG9_item)

SG9_item_xWalk <- read_item_xwalk("data/2023MCASItemXWalk.xlsx", "SG9_item_xwalk", "science")
#view(SG9_item_xWalk)

SG9_item <-left_join(SG9_item, SG9_item_xWalk, by = "sitem")
#view(SG9_item)

#Reporting Categories: Intro Physics: "MF", "EN", "WA" for science grade levels

SG9_DCI_PTS<-DCI_Points(SG9_item)
#view(SG9_DCI_PTS)
SG9_CR_PTS<-Item_Type_Points("CR", SG9_item)
SG9_SR_PTS<-Item_Type_Points("SR", SG9_item)
SG9_MD_PTS<-Practice_Cat_Points("science", "B. Mathematics and Data", SG9_item)
SG9_ERM_PTS<-Practice_Cat_Points("science", "C. Evidence, Reasoning, and Modeling", SG9_item)
SG9_IQ_PTS<-Practice_Cat_Points("science", "A. Investigations and Questioning", SG9_item)
SG9_MF_PTS<-Reporting_Cat_Points("science", "Motion, Forces, and Interactions", SG9_item)
SG9_EN_PTS<-Reporting_Cat_Points("science", "Energy", SG9_item)
SG9_WA_PTS<-Reporting_Cat_Points("science", "Waves", SG9_item)
SG9_Rep_PTS <-Rep_Info_Points(SG9_item)
#view(SG9_Rep_PTS)
#SG9_Graph_PTS <-Rep_Info_Points("Graph", SG9_item)
SG9_Vis_PTS = SG9_Rep_PTS[1,2] + SG9_Rep_PTS[2,2] + SG9_Rep_PTS[3,2] + SG9_Rep_PTS[5,2] + SG9_Rep_PTS[6,2]
SG9_Des_PTS = SG9_Rep_PTS[4, 2]


# Create SG9 Student Item Dataframe
# SG9 Student Diff Performance Page
SG9_student_perf<-Student_Perf("physics", 9, student_itemDF)
#view(SG9_student_perf)
SG9_student_item_perf<-Student_Item_Perf("science", SG9_item, SG9_student_perf)
#view(SG9_student_item_perf)

SG9_Vis_Diff<-Physics_Visual_Info_Diff("Yes", SG9_student_item_perf)
SG9_Des_Diff <-Physics_Visual_Info_Diff("No", SG9_student_item_perf)
SG9_Vis_Loss<-Physics_Visual_Info_Loss(SG9_student_item_perf)
#view(SG9_Vis_Loss)
SG9_Rep_Diff <-Rep_Info_Diff(SG9_student_item_perf)
#view(SG9_Rep_Diff)
SG9_Rep_Loss <-Rep_Info_Loss(SG9_student_item_perf)
#view(SG9_Rep_Loss)
#SG9_Course_Share_Diff<- Course_Share_Diff(SG9_student_item_perf)
#view(SG9_Course_Share_Diff)
#SG9_Course_Share_Loss<- Course_Share_Loss(SG9_student_item_perf)
#view(SG9_Course_Share_Loss)
#view(SG9_Des_Diff)
SG9_CR_Diff<-Item_Type_Diff("science", "CR", SG9_student_item_perf)
#view(SG9_CR_Diff)

SG9_SR_Diff<-Item_Type_Diff("science", "SR", SG9_student_item_perf)
SG9_MD_Diff<-Practice_Cat_Diff("science", "B. Mathematics and Data", SG9_student_item_perf)
#view(SG9_MD_Diff)
SG9_ERM_Diff<-Practice_Cat_Diff("science", "C. Evidence, Reasoning, and Modeling", SG9_student_item_perf)
SG9_IQ_Diff<-Practice_Cat_Diff("science", "A. Investigations and Questioning", SG9_student_item_perf)
SG9_MF_Diff<-Reporting_Cat_Diff("science", "Motion, Forces, and Interactions", SG9_student_item_perf)
SG9_EN_Diff<-Reporting_Cat_Diff("science", "Energy", SG9_student_item_perf)
SG9_WA_Diff<-Reporting_Cat_Diff("science", "Waves", SG9_student_item_perf)

# SG9 Top Performing Students
SG9_TopStudent_item_perf<-SG9_student_item_perf%>%
  filter(sscaleds >= 530)
SG9Top_Vis_Diff<-Physics_Visual_Info_Diff("Yes", SG9_TopStudent_item_perf)
SG9Top_Des_Diff <-Physics_Visual_Info_Diff("No", SG9_TopStudent_item_perf)
SG9Top_Rep_Diff <-Rep_Info_Diff(SG9_TopStudent_item_perf)
#view(SG9Top_Rep_Diff)

SG9Top_Rep_Loss <-Rep_Info_Loss(SG9_TopStudent_item_perf)
#view(SG9Top_Rep_Loss)

#SG9Top_Course_Share_Diff<- Course_Share_Diff(SG9_TopStudent_item_perf)
#view(SG9Top_Course_Share_Diff)
#SG9Top_Course_Share_Loss<- Course_Share_Loss(SG9_TopStudent_item_perf)
#view(SG9Top_Course_Share_Loss)
#view(SG9Top_Vis_Diff)
#view(SG9Top_Des_Diff)
SG9Top_CR_Diff<-Item_Type_Diff("science", "CR", SG9_TopStudent_item_perf)
#view(SG9_CR_Diff)
SG9Top_SR_Diff<-Item_Type_Diff("science", "SR", SG9_TopStudent_item_perf)
SG9Top_MD_Diff<-Practice_Cat_Diff("science", "B. Mathematics and Data", SG9_TopStudent_item_perf)
#view(SG9Top_MD_Diff)
SG9Top_ERM_Diff<-Practice_Cat_Diff("science", "C. Evidence, Reasoning, and Modeling", SG9_TopStudent_item_perf)
#view(SG9Top_ERM_Diff)
SG9Top_IQ_Diff<-Practice_Cat_Diff("science", "A. Investigations and Questioning", SG9_TopStudent_item_perf)
SG9Top_MF_Diff<-Reporting_Cat_Diff("science", "Motion, Forces, and Interactions", SG9_TopStudent_item_perf)
SG9Top_EN_Diff<-Reporting_Cat_Diff("science", "Energy", SG9_TopStudent_item_perf)
SG9Top_WA_Diff<-Reporting_Cat_Diff("science", "Waves", SG9_TopStudent_item_perf)

SG9Top_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG9_TopStudent_item_perf)
#view(SG9Top_MD_Loss)

SG9Top_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG9_TopStudent_item_perf)
#view(SG9Top_ERM_Loss)
SG9Top_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG9_TopStudent_item_perf)
#view(SG9Top_IQ_Loss)

#SG9 PM Performing Students
SG9_LowStudent_item_perf<-SG9_student_item_perf%>%
  filter(sscaleds < 500)
SG9Low_SR_Diff<-Item_Type_Diff("science", "SR", SG9_LowStudent_item_perf)
#view(SG9Low_SR_Diff)
SG9Low_CR_Diff<-Item_Type_Diff("science", "CR", SG9_LowStudent_item_perf)
#view(SG9Low_CR_Diff)


SG9Low_MF_Diff<-Reporting_Cat_Diff("science", "Motion, Forces, and Interactions", SG9_LowStudent_item_perf)
#view(SG9Low_MF_Diff)
SG9Low_EN_Diff<-Reporting_Cat_Diff("science", "Energy", SG9_LowStudent_item_perf)
#view(SG9Low_EN_Diff)
SG9Low_WA_Diff<-Reporting_Cat_Diff("science", "Waves", SG9_LowStudent_item_perf)
#view(SG9Low_WA_Diff)

SG9Low_Rep_Diff <-Rep_Info_Diff(SG9_LowStudent_item_perf)
#view(SG9Low_Rep_Diff)
SG9Low_Rep_Loss <-Rep_Info_Loss(SG9_LowStudent_item_perf)
#view(SG9Low_Rep_Loss)

#SG9 Almost E Performing Students
SG9_MidStudent_item_perf<-SG9_student_item_perf%>%
  filter(sscaleds < 530)%>%
  filter(sscaleds >= 515)

SG9Mid_Vis_Diff<-Physics_Visual_Info_Diff("Yes", SG9_MidStudent_item_perf)
SG9Mid_Des_Diff <-Physics_Visual_Info_Diff("No", SG9_MidStudent_item_perf)
#view(SG9Mid_Vis_Diff)
#view(SG9Mid_Des_Diff)

SG9Mid_SR_Diff<-Item_Type_Diff("science", "SR", SG9_MidStudent_item_perf)
#view(SG9Mid_SR_Diff)
SG9Mid_CR_Diff<-Item_Type_Diff("science", "CR", SG9_MidStudent_item_perf)
#view(SG9Mid_CR_Diff)


SG9Mid_MF_Diff<-Reporting_Cat_Diff("science", "Motion, Forces, and Interactions", SG9_MidStudent_item_perf)
#view(SG9Mid_MF_Diff)
SG9Mid_EN_Diff<-Reporting_Cat_Diff("science", "Energy", SG9_MidStudent_item_perf)
#view(SG9Mid_EN_Diff)
SG9Mid_WA_Diff<-Reporting_Cat_Diff("science", "Waves", SG9_MidStudent_item_perf)
#view(SG9Mid_WA_Diff)
SG9Mid_MD_Diff<-Practice_Cat_Diff("science", "B. Mathematics and Data", SG9_MidStudent_item_perf)
#view(SG9Mid_MD_Diff)
SG9Mid_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG9_MidStudent_item_perf)
#view(SG9Mid_MD_Loss)

SG9Mid_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG9_MidStudent_item_perf)
#view(SG9Mid_ERM_Loss)
SG9Mid_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG9_MidStudent_item_perf)
#view(SG9Mid_IQ_Loss)

SG9Mid_Rep_Diff <-Rep_Info_Diff(SG9_MidStudent_item_perf)
#view(SG9Mid_Rep_Diff)
#SG9Mid_Rep_Loss <-Rep_Info_Loss(SG9_MidStudent_item_perf)
#view(SG9Mid_Rep_Loss)
#SG9Mid_Course_Share_Diff<- Course_Share_Diff(SG9_MidStudent_item_perf)
#view(SG9Mid_Course_Share_Diff)
#SG9Mid_Course_Share_Loss<- Course_Share_Loss(SG9_MidStudent_item_perf)
#view(SG9Mid_Course_Share_Loss)

# SG8 Exam Content Page and # SG8 Student Diff Performance Page
SG8_item <-read_item("data/MCAS_2023_MS_STE_Gr_5_8_Item_Analysis_Template_V2.xlsx", "Gr. 8 CBT (SCI08)", "science")
#view(SG8_item)

SG8_standard_xWalk <- read_standardXwalk("data/2023MCASItemXWalk.xlsx", "SG8_standard_xwalk")
#view(SG8_standard_xWalk)

SG8_item<-left_join(SG8_item, SG8_standard_xWalk, by = "Standard")
#view(SG8_item)

SG8_student_perf<-Student_Perf("science", 8, student_itemDF)
#view(SG8_student_perf)
SG8_student_item_perf<-Student_Item_Perf("science", SG8_item, SG8_student_perf)

SG8_student_perf<-Student_Perf("science", 8, student_itemDF)
#view(SG8_student_perf)
SG8_student_item_perf<-Student_Item_Perf("science", SG8_item, SG8_student_perf)
#view(SG5_student_perf)

# SG8 Top Performing Students
SG8_TopStudent_item_perf<-SG8_student_item_perf%>%
  filter(sscaleds >= 515)
#Reporting Categories: G8STE: "MF", "EN", "WA" for science grade levels
#G8 STE: "ES", ""LS", PS", "TE"
#view(SG8_student_item_perf)

SG8_DCI_PTS<-DCI_Points(SG8_item)
#view(SG8_DCI_PTS)
SG8_G8_PTS <- Grade_Level_Points(SG8_item, 8)
SG8_G7_PTS <- Grade_Level_Points(SG8_item, 7)
SG8_G6_PTS <- Grade_Level_Points(SG8_item, 6)

SG8_G8_Diff <- Grade_Level_Points(SG8_item, 8)
SG8_G7_Diff <- Grade_Level_Points(SG8_item, 7)
SG8_G6_Diff <- Grade_Level_Points(SG8_item, 6)

SG8_CR_PTS<-Item_Type_Points("CR", SG8_item)
SG8_CR_Diff<-Item_Type_Diff("science", "CR", SG8_student_item_perf)


SG8_SR_PTS<-Item_Type_Points("SR", SG8_item)
SG8_SR_Diff<-Item_Type_Diff("science", "SR", SG8_student_item_perf)


SG8_MD_PTS<-Practice_Cat_Points("science", "B. Mathematics and Data", SG8_item)
SG8_MD_Diff<-Practice_Cat_Diff("science", "B. Mathematics and Data", SG8_student_item_perf)
SG8_ERM_PTS<-Practice_Cat_Points("science", "C. Evidence, Reasoning, and Modeling", SG8_item)
SG8_ERM_Diff<-Practice_Cat_Diff("science", "C. Evidence, Reasoning, and Modeling", SG8_student_item_perf)
SG8_IQ_PTS<-Practice_Cat_Points("science", "A. Investigations and Questioning", SG8_item)
SG8_IQ_Diff<-Practice_Cat_Diff("science", "A. Investigations and Questioning", SG8_student_item_perf)


SG8Top_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG8_TopStudent_item_perf)
#view(SG8Top_MD_Loss)
SG8Top_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG8_TopStudent_item_perf)
#view(SG8Top_ERM_Loss)
SG8Top_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG8_TopStudent_item_perf)
#view(SG8Top_IQ_Loss)

SG8_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG8_student_item_perf)
#view(SG8Top_MD_Loss)
SG8_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG8_student_item_perf)
#view(SG8Top_ERM_Loss)
SG8_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG8_student_item_perf)
#view(SG8Top_IQ_Loss)

SG8_ES_Loss<-Reporting_Cat_Loss("science", "Earth and Space Science", SG8_student_item_perf)
#view(SG8_ES_Loss)
SG8_LS_Loss<-Reporting_Cat_Loss("science", "Life Science", SG8_student_item_perf)
#view(SG8_LS_Loss)
SG8_PS_Loss<-Reporting_Cat_Loss("science", "Physical Science", SG8_student_item_perf)
#view(SG8_PS_Loss)
SG8_TE_Loss<-Reporting_Cat_Loss("science", "Technology/Engineering", SG8_student_item_perf)
#view(SG8_TE_Loss)

SG8_ES_PTS<-Reporting_Cat_Points("science", "Earth and Space Science", SG8_item)
SG8_ES_Diff<-Reporting_Cat_Diff("science", "Earth and Space Science", SG8_student_item_perf)
SG8Top_ES_Loss<-Reporting_Cat_Loss("science", "Earth and Space Science", SG8_TopStudent_item_perf)
#view(SG8Top_ES_Loss)

SG8_LS_PTS<-Reporting_Cat_Points("science", "Life Science", SG8_item)
SG8_LS_Diff<-Reporting_Cat_Diff("science", "Life Science", SG8_student_item_perf)
#SG8Top_LS_Loss<-Reporting_Cat_Loss("science", "Life Science", SG8_TopStudent_item_perf)
#view(SG8Top_LS_Loss)
SG8_PS_PTS<-Reporting_Cat_Points("science", "Physical Science", SG8_item)
SG8_TE_PTS<-Reporting_Cat_Points("science", "Technology/Engineering", SG8_item)
SG8_PS_Diff<-Reporting_Cat_Diff("science", "Physical Science", SG8_student_item_perf)
SG8Top_PS_Loss<-Reporting_Cat_Loss("science", "Physical Science", SG8_TopStudent_item_perf)
#view(SG8Top_PS_Loss)
SG8_TE_Diff<-Reporting_Cat_Diff("science", "Technology/Engineering", SG8_student_item_perf)
SG8Top_TE_Loss<-Reporting_Cat_Loss("science", "Technology/Engineering", SG8_TopStudent_item_perf)
#view(SG8Top_TE_Loss)



# SG5 Exam Content Page
SG5_item <-read_item("data/MCAS_2023_MS_STE_Gr_5_8_Item_Analysis_Template_V2.xlsx", "Gr. 5 CBT (SCI05)", "science")
#view(SG5_item)

SG5_standard_xWalk <- read_standardXwalk("data/2023MCASItemXWalk.xlsx", "SG5_standard_xwalk")
#view(SG5_standard_xWalk)

SG5_item<-left_join(SG5_item, SG5_standard_xWalk, by = "Standard")
#view(SG5_item)

#G5 STE: "ES", ""LS", PS", "TE"

SG5_DCI_PTS<-DCI_Points(SG5_item)
#view(SG5_DCI_PTS)
SG5_G5_PTS <- Grade_Level_Points(SG5_item, 5)
SG5_G4_PTS <- Grade_Level_Points(SG5_item, 4)
SG5_G3_PTS <- Grade_Level_Points(SG5_item, 3)

SG5_G5_Diff <- Grade_Level_Points(SG5_item, 5)
SG5_G4_Diff <- Grade_Level_Points(SG5_item, 4)
SG5_G3_Diff <- Grade_Level_Points(SG5_item, 3)

SG5_CR_PTS<-Item_Type_Points("CR", SG5_item)
SG5_SR_PTS<-Item_Type_Points("SR", SG5_item)
SG5_MD_PTS<-Practice_Cat_Points("science", "B. Mathematics and Data", SG5_item)
SG5_ERM_PTS<-Practice_Cat_Points("science", "C. Evidence, Reasoning, and Modeling", SG5_item)
SG5_IQ_PTS<-Practice_Cat_Points("science", "A. Investigations and Questioning", SG5_item)
SG5_ES_PTS<-Reporting_Cat_Points("science", "Earth and Space Science", SG5_item)
SG5_LS_PTS<-Reporting_Cat_Points("science", "Life Science", SG5_item)
SG5_PS_PTS<-Reporting_Cat_Points("science", "Physical Science", SG5_item)
SG5_TE_PTS<-Reporting_Cat_Points("science", "Technology/Engineering", SG5_item)

# SG5 Student Diff Page
SG5_student_perf<-Student_Perf("science", 5, student_itemDF)
SG5_student_item_perf<-Student_Item_Perf("science", SG5_item, SG5_student_perf)
SG5_TopStudent_item_perf<-SG5_student_item_perf%>%
  filter(`sscaleds` >= 515)

SG5_CR_Diff<-Item_Type_Diff("science", "CR", SG5_student_item_perf)
SG5_SR_Diff<-Item_Type_Diff("science","SR", SG5_student_item_perf)
SG5_MD_Diff<-Practice_Cat_Diff("science", "B. Mathematics and Data", SG5_student_item_perf)
SG5_ERM_Diff<-Practice_Cat_Diff("science", "C. Evidence, Reasoning, and Modeling", SG5_student_item_perf)
SG5_IQ_Diff<-Practice_Cat_Diff("science", "A. Investigations and Questioning", SG5_student_item_perf)
SG5_ES_Diff<-Reporting_Cat_Diff("science", "Earth and Space Science", SG5_student_item_perf)
SG5_LS_Diff<-Reporting_Cat_Diff("science", "Life Science", SG5_student_item_perf)
SG5_PS_Diff<-Reporting_Cat_Diff("science", "Physical Science", SG5_student_item_perf)
SG5_TE_Diff<-Reporting_Cat_Diff("science", "Technology/Engineering", SG5_student_item_perf)

SG5_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG5_student_item_perf)
SG5_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG5_student_item_perf)
SG5_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG5_student_item_perf)

SG5Top_MD_Loss<-Practice_Cat_Loss("science", "B. Mathematics and Data", SG5_TopStudent_item_perf)
#view(SG5Top_MD_Loss)
SG5Top_ERM_Loss<-Practice_Cat_Loss("science", "C. Evidence, Reasoning, and Modeling", SG5_TopStudent_item_perf)
#view(SG5Top_ERM_Loss)
SG5Top_IQ_Loss<-Practice_Cat_Loss("science", "A. Investigations and Questioning", SG5_TopStudent_item_perf)
#view(SG5Top_IQ_Loss)

SG5_ES_Loss<-Reporting_Cat_Loss("science", "Earth and Space Science", SG5_student_item_perf)
#view(SG5_ES_Loss)
SG5_LS_Loss<-Reporting_Cat_Loss("science", "Life Science", SG5_student_item_perf)
#view(SG5_LS_Loss)
SG5_PS_Loss<-Reporting_Cat_Loss("science", "Physical Science", SG5_student_item_perf)
#view(SG5_PS_Loss)

SG5_TE_Loss<-Reporting_Cat_Loss("science", "Technology/Engineering", SG5_student_item_perf)
#view(SG5_TE_Loss)

SG5Top_ES_Loss<-Reporting_Cat_Loss("science", "Earth and Space Science", SG5_TopStudent_item_perf)
#view(SG5Top_ES_Loss)
SG5Top_LS_Loss<-Reporting_Cat_Loss("science", "Life Science", SG5_TopStudent_item_perf)
#view(SG5Top_LS_Loss)
SG5Top_PS_Loss<-Reporting_Cat_Loss("science", "Physical Science", SG5_TopStudent_item_perf)
#view(SG5Top_PS_Loss)
SG5Top_TE_Loss<-Reporting_Cat_Loss("science", "Technology/Engineering", SG5_TopStudent_item_perf)
#view(SG5Top_TE_Loss)


##Create Math Item Data Frames--------------------------------------------------
MG10_item <-read_item("data/MCAS_2023_Math_Gr_3_8_10_Item_Analysis_Template_V2.xlsx", "Grade 10", "math")
#view(MG10_item)
MG8_item <-read_item("data/MCAS_2023_Math_Gr_3_8_10_Item_Analysis_Template_V2.xlsx", "Grade 8", "math")
#view(MG8_item)
MG7_item <-read_item("data/MCAS_2023_Math_Gr_3_8_10_Item_Analysis_Template_V2.xlsx", "Grade 7", "math")
#view(MG7_item)
MG6_item <-read_item("data/MCAS_2023_Math_Gr_3_8_10_Item_Analysis_Template_V2.xlsx", "Grade 6", "math")
#view(MG6_item)
MG5_item <-read_item("data/MCAS_2023_Math_Gr_3_8_10_Item_Analysis_Template_V2.xlsx", "Grade 5", "math")
#view(MG5_item)

## Create Math Student Performance Data Frames
MG10_student_perf<-Student_Perf("math", 10, student_itemDF)
#view(MG10_student_perf)
MG10_student_item_perf<-Student_Item_Perf("math", MG10_item, MG10_student_perf)
#view(MG10_student_item_perf)
MG10_TopStudent_item_perf<-MG10_student_item_perf%>%
  filter(`mscaleds`>=515)
MG8_student_perf<-Student_Perf("math", 8, student_itemDF)
MG8_student_item_perf<-Student_Item_Perf("math", MG8_item, MG8_student_perf)
MG8_TopStudent_item_perf<-MG8_student_item_perf%>%
  filter(`mscaleds`>=515)

MG8_MidStudent_item_perf<-MG8_student_item_perf%>%
  filter(`mscaleds`>=500)%>%
  filter( `mscaleds` <515)
MG8_LowStudent_item_perf<-MG8_student_item_perf%>%
  filter(`mscaleds`<500)

MG7_student_perf<-Student_Perf("math", 7, student_itemDF)

MG7_student_item_perf<-Student_Item_Perf("math", MG7_item, MG7_student_perf)

MG7_TopStudent_item_perf<-MG7_student_item_perf%>%
  filter(`mscaleds`>=515)

MG7_LowStudent_item_perf<-MG7_student_item_perf%>%
  filter(`mscaleds`< 500)

MG6_student_perf<-Student_Perf("math", 6, student_itemDF)
MG6_student_item_perf<-Student_Item_Perf("math", MG6_item, MG6_student_perf)
MG6_TopStudent_item_perf<-MG6_student_item_perf%>%
  filter(`mscaleds`>=515)

MG6_MidStudent_item_perf<-MG6_student_item_perf%>%
  filter(`mscaleds`>=500)%>%
  filter( `mscaleds` <515)

MG6_LowStudent_item_perf<-MG6_student_item_perf%>%
  filter(`mscaleds`< 500)


MG5_student_perf<-Student_Perf("math", 5, student_itemDF)
MG5_student_item_perf<-Student_Item_Perf("math", MG5_item, MG5_student_perf)
MG5_TopStudent_item_perf<-MG5_student_item_perf%>%
  filter(`mscaleds`>=515)

MG5_MidStudent_item_perf<-MG5_student_item_perf%>%
  filter(`mscaleds`>=500)%>%
  filter( `mscaleds` <515)

MG5_LowStudent_item_perf<-MG5_student_item_perf%>%
  filter(`mscaleds`< 500)

#### Mathematics Exam Content and PerformancePages
#Reporting Categories: G10 Math: 
#"AF":Algebra and Functions,
#GE":Geometry,
#"NQ": Number and Quantity,
# "SP": Statistics and Probability
# Question Type: G10 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response
#view(MG10_item)

MG10_CR_PTS<-Item_Type_Points("CR", MG10_item)
MG10_SA_PTS<-Item_Type_Points("SA", MG10_item)
MG10_SR_PTS<-Item_Type_Points("SR", MG10_item)
MG10_AF_PTS<-Reporting_Cat_Points("math", "Algebra and Functions", MG10_item)
MG10_GE_PTS<-Reporting_Cat_Points("math", "Geometry", MG10_item)
MG10_NQ_PTS<-Reporting_Cat_Points("math", "Number and Quantity", MG10_item)
MG10_SP_PTS<-Reporting_Cat_Points("math", "Statistics and Probability", MG10_item)

MG10_CR_Diff<-Item_Type_Diff("math", "CR", MG10_student_item_perf)
MG10_SA_Diff<-Item_Type_Diff("math", "SA", MG10_student_item_perf)
MG10_SR_Diff<-Item_Type_Diff("math", "SR", MG10_student_item_perf)
MG10_AF_Diff<-Reporting_Cat_Diff("math", "Algebra and Functions", MG10_student_item_perf)
MG10_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG10_student_item_perf)
MG10_NQ_Diff<-Reporting_Cat_Diff("math", "Number and Quantity", MG10_student_item_perf)

MG10_AF_Loss<-Reporting_Cat_Loss("math", "Algebra and Functions", MG10_student_item_perf)
MG10_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG10_student_item_perf)
MG10_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG10_student_item_perf)


MG10Top_AF_Loss<-Reporting_Cat_Loss("math", "Algebra and Functions", MG10_TopStudent_item_perf)
MG10Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG10_TopStudent_item_perf)
MG10Top_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG10_TopStudent_item_perf)

#view(MG10_AF_Loss)
#view(MG10Top_AF_Loss)
#view(MG10_GE_Loss)
#view(MG10Top_GE_Loss)
#view(MG10_SP_Loss)
#view(MG10Top_SP_Loss)
#Reporting Categories: G8 Math: 
# "FN": Functions
#"GE":Geometry,
# "NSEE":Number System & Expressions and Eqns,
# "SP": Statistics and Probability
# Question Type: G8 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response
#To Do Find MG8 Statistics nad Probability Issue

#view(MG8_item)
MG8_CR_PTS<-Item_Type_Points("CR", MG8_item)
MG8_SA_PTS<-Item_Type_Points("SA", MG8_item)
MG8_SR_PTS<-Item_Type_Points("SR", MG8_item)
MG8_FN_PTS<-Reporting_Cat_Points("math", "Functions", MG8_item)
MG8_GE_PTS<-Reporting_Cat_Points("math", "Geometry", MG8_item)
MG8_NSEE_PTS<-Reporting_Cat_Points("math", "The Number System and Expressions and Equations", MG8_item)


MG8_RP_PTS<-Reporting_Cat_Points("math", "RP", MG8_item)
MG8_SP_PTS<-Reporting_Cat_Points("math", "Statistics and Probability", MG8_item)

MG8_CR_Diff<-Item_Type_Diff("math", "CR", MG8_student_item_perf)
MG8_SA_Diff<-Item_Type_Diff("math", "SA", MG8_student_item_perf)
MG8_SR_Diff<-Item_Type_Diff("math", "SR", MG8_student_item_perf)
MG8_FN_Diff<-Reporting_Cat_Diff("math", "Functions", MG8_student_item_perf)
MG8_FN_Loss<-Reporting_Cat_Loss("math", "Functions", MG8_student_item_perf)
#view(MG8_FN_Loss)
MG8Top_FN_Loss<-Reporting_Cat_Loss("math", "Functions", MG8_TopStudent_item_perf)
#view(MG8Top_FN_Loss)
MG8Low_FN_Loss<-Reporting_Cat_Loss("math", "Functions", MG8_LowStudent_item_perf)
#view(MG8Low_FN_Loss)
MG8_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG8_student_item_perf)
MG8_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG8_student_item_perf)
#view(MG8_GE_Loss)
MG8Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG8_TopStudent_item_perf)
#view(MG8Top_GE_Loss)

MG8Mid_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG8_MidStudent_item_perf)
#view(MG8Mid_GE_Loss)

MG8Low_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG8_LowStudent_item_perf)
#view(MG8Low_GE_Loss)
MG8_NSEE_Diff<-Reporting_Cat_Diff("math", "The Number System and Expressions and Equations", MG8_student_item_perf)
MG8_NSEE_Loss<-Reporting_Cat_Loss("math", "The Number System and Expressions and Equations", MG8_student_item_perf)
#view(MG8_NSEE_Loss)
MG8Top_NSEE_Loss<-Reporting_Cat_Loss("math", "The Number System and Expressions and Equations", MG8_TopStudent_item_perf)
#view(MG8Top_NSEE_Loss)
MG8Mid_NSEE_Loss<-Reporting_Cat_Loss("math", "The Number System and Expressions and Equations", MG8_MidStudent_item_perf)
#view(MG8Mid_NSEE_Loss)
MG8Low_NSEE_Loss<-Reporting_Cat_Loss("math", "The Number System and Expressions and Equations", MG8_LowStudent_item_perf)
#view(MG8Low_NSEE_Loss)
MG8_SP_Diff<-Reporting_Cat_Diff("math", "Statistics and Probability", MG8_student_item_perf)
MG8_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG8_student_item_perf)
#view(MG8_SP_Loss)
MG8Top_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG8_TopStudent_item_perf)
#view(MG8Top_SP_Loss)
#MG8Low_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG8_LowStudent_item_perf)
#view(MG8Low_SP_Loss)


#Reporting Categories: G7 Math: 
# 
#"GE":Geometry, "MD":Measurement and Data
# "NS": The Number System,
# "RP": Ratios and Proportional Relationships, "SP": Statistics and Probability
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

#view(MG7_item)
MG7_CR_PTS<-Item_Type_Points("CR", MG7_item)
MG7_SA_PTS<-Item_Type_Points("SA", MG7_item)
MG7_SR_PTS<-Item_Type_Points("SR", MG7_item)
MG7_EE_PTS<-Reporting_Cat_Points("math", "Expressions and Equations", MG7_item)
MG7_GE_PTS<-Reporting_Cat_Points("math", "Geometry", MG7_item)
MG7_NS_PTS<-Reporting_Cat_Points("math", "The Number System", MG7_item)

MG7_RP_PTS<-Reporting_Cat_Points("math", "Ratios and Proportional Relationships", MG7_item)
MG7_SP_PTS<-Reporting_Cat_Points("math", "Statistics and Probability", MG7_item)

MG7_CR_Diff<-Item_Type_Diff("math", "CR", MG7_student_item_perf)
MG7_SA_Diff<-Item_Type_Diff("math", "SA", MG7_student_item_perf)
MG7_SR_Diff<-Item_Type_Diff("math", "SR", MG7_student_item_perf)
MG7_EE_Diff<-Reporting_Cat_Diff("math", "Expressions and Equations", MG7_student_item_perf)
MG7_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG7_student_item_perf)
MG7_NS_Diff<-Reporting_Cat_Diff("math", "The Number System", MG7_student_item_perf)


MG7_RP_Diff<-Reporting_Cat_Diff("math", "Ratios and Proportional Relationships", MG7_student_item_perf)
MG7_SP_Diff<-Reporting_Cat_Diff("math", "Statistics and Probability", MG7_student_item_perf)

MG7_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG7_student_item_perf)
#view(MG7_EE_Loss)
MG7Top_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG7_TopStudent_item_perf)
#view(MG7Top_EE_Loss)

MG7Low_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG7_LowStudent_item_perf)
#view(MG7Low_EE_Loss)

MG7_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG7_student_item_perf)
#view(MG7_NS_Loss)
MG7Top_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG7_TopStudent_item_perf)
#view(MG7Top_NS_Loss)

MG7Low_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG7_LowStudent_item_perf)
#view(MG7Low_NS_Loss)


MG7_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG7_student_item_perf)
#view(MG7_GE_Loss)

MG7Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG7_TopStudent_item_perf)
#view(MG7Top_GE_Loss)

MG7Low_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG7_LowStudent_item_perf)
#view(MG7Low_GE_Loss)


MG7_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG7_student_item_perf)
#view(MG7_RP_Loss)

MG7Top_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG7_TopStudent_item_perf)
#view(MG7Top_RP_Loss)
MG7Low_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG7_LowStudent_item_perf)
#view(MG7Low_RP_Loss)
MG7_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG7_student_item_perf)
#view(MG7_SP_Loss)
MG7Top_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG7_TopStudent_item_perf)
#view(MG7Top_SP_Loss)
MG7Low_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG7_LowStudent_item_perf)
#view(MG7Low_SP_Loss)

MG7Top_RP_Diff<-Reporting_Cat_Diff("math", "Ratios and Proportional Relationships", MG7_TopStudent_item_perf)
#view(MG7Top_RP_Diff)
MG7Top_SP_Diff<-Reporting_Cat_Diff("math", "Statistics and Probability", MG7_TopStudent_item_perf)
#view(MG7Top_SP_Diff)
MG7Top_EE_Diff<-Reporting_Cat_Diff("math", "Expressions and Equations", MG7_TopStudent_item_perf)
#view(MG7Top_EE_Diff)
MG7Top_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG7_TopStudent_item_perf)
#view(MG7Top_GE_Diff)
MG7Top_NS_Diff<-Reporting_Cat_Diff("math", "The Number System", MG7_TopStudent_item_perf)
#view(MG7Top_NS_Diff)

#Reporting Categories: G6 Math: 
# 
#"GE":Geometry, "MD":Measurement and Data
# "NS": The Number System,
# "RP": Ratios and Proportional Relationships, "SP": Statistics and Probability,
# "EE" : "Expressions and Equations"
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

#view(MG6_item)
MG6_CR_PTS<-Item_Type_Points("CR", MG6_item)
MG6_SA_PTS<-Item_Type_Points("SA", MG6_item)
MG6_SR_PTS<-Item_Type_Points("SR", MG6_item)
MG6_EE_PTS<-Reporting_Cat_Points("math", "Expressions and Equations", MG6_item)
MG6_GE_PTS<-Reporting_Cat_Points("math", "Geometry", MG6_item)
MG6_NS_PTS<-Reporting_Cat_Points("math", "The Number System", MG6_item)

MG6_RP_PTS<-Reporting_Cat_Points("math", "Ratios and Proportional Relationships", MG6_item)
MG6_SP_PTS<-Reporting_Cat_Points("math", "Statistics and Probability", MG6_item)

MG6_CR_Diff<-Item_Type_Diff("math", "CR", MG6_student_item_perf)
MG6_SA_Diff<-Item_Type_Diff("math", "SA", MG6_student_item_perf)
MG6_SR_Diff<-Item_Type_Diff("math","SR", MG6_student_item_perf)
MG6_EE_Diff<-Reporting_Cat_Diff("math", "Expressions and Equations", MG6_student_item_perf)
MG6_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG6_student_item_perf)
MG6_NS_Diff<-Reporting_Cat_Diff("math", "The Number System", MG6_student_item_perf)

MG6_RP_Diff<-Reporting_Cat_Diff("math", "Ratios and Proportional Relationships", MG6_student_item_perf)
MG6_SP_Diff<-Reporting_Cat_Diff("math", "Statistics and Probability", MG6_student_item_perf)

#MG6_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG6_student_item_perf)
#view(MG6_GE_Loss)
#MG6Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG6_TopStudent_item_perf)
#view(MG6Top_GE_Loss)

MG6_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG6_student_item_perf)
#view(MG6_EE_Loss)
MG6Top_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG6_TopStudent_item_perf)
#view(MG6Top_EE_Loss)

MG6Low_EE_Loss<-Reporting_Cat_Loss("math", "Expressions and Equations", MG6_LowStudent_item_perf)
#view(MG6Low_EE_Loss)

MG6_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG6_student_item_perf)
#view(MG6_NS_Loss)
MG6Top_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG6_TopStudent_item_perf)
#view(MG6Top_NS_Loss)

MG6Low_NS_Loss<-Reporting_Cat_Loss("math", "The Number System", MG6_LowStudent_item_perf)
#view(MG6Low_NS_Loss)


MG6_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG6_student_item_perf)
#view(MG6_GE_Loss)

MG6Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG6_TopStudent_item_perf)
#view(MG6Top_GE_Loss)

MG6Low_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG6_LowStudent_item_perf)
#view(MG6Low_GE_Loss)


MG6_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG6_student_item_perf)
#view(MG6_RP_Loss)

MG6Top_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG6_TopStudent_item_perf)
#view(MG6Top_RP_Loss)
MG6Low_RP_Loss<-Reporting_Cat_Loss("math", "Ratios and Proportional Relationships", MG6_LowStudent_item_perf)
#view(MG6Low_RP_Loss)
MG6_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG6_student_item_perf)
#view(MG6_SP_Loss)
MG6Top_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG6_TopStudent_item_perf)
#view(MG6Top_SP_Loss)
MG6Low_SP_Loss<-Reporting_Cat_Loss("math", "Statistics and Probability", MG6_LowStudent_item_perf)
#view(MG6Low_SP_Loss)

MG6Top_RP_Diff<-Reporting_Cat_Diff("math", "Ratios and Proportional Relationships", MG6_TopStudent_item_perf)
#view(MG6Top_RP_Diff)
MG6Top_SP_Diff<-Reporting_Cat_Diff("math", "Statistics and Probability", MG6_TopStudent_item_perf)
#view(MG6Top_SP_Diff)
MG6Top_EE_Diff<-Reporting_Cat_Diff("math", "Expressions and Equations", MG6_TopStudent_item_perf)
#view(MG6Top_EE_Diff)
MG6Top_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG6_TopStudent_item_perf)
#view(MG6Top_GE_Diff)
MG6Top_NS_Diff<-Reporting_Cat_Diff("math", "The Number System", MG6_TopStudent_item_perf)
#view(MG6Top_NS_Diff)

#Reporting Categories: G5 Math: 
# 
#"GE":Geometry, 
#"MD":Measurement and Data
# "NS": The Number System,
# NF: Number and Operations-Fractions
# "NT": Number and Operations in Base Ten, 
#"OA": Operations and Algebraic Thinking
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

#view(MG5_item)
MG5_CR_PTS<-Item_Type_Points( "CR", MG5_item)
MG5_SA_PTS<-Item_Type_Points( "SA", MG5_item)
MG5_SR_PTS<-Item_Type_Points( "SR", MG5_item)

MG5_GE_PTS<-Reporting_Cat_Points("math", "Geometry", MG5_item)
MG5_MD_PTS<-Reporting_Cat_Points("math", "Measurement and Data", MG5_item)
MG5_NF_PTS<-Reporting_Cat_Points("math", "Number and Operations-Fractions", MG5_item)
MG5_NT_PTS<-Reporting_Cat_Points("math", "Number and Operations in Base Ten", MG5_item)
MG5_OA_PTS<-Reporting_Cat_Points("math", "Operations and Algebraic Thinking", MG5_item)


MG5_CR_Diff<-Item_Type_Diff("math", "CR", MG5_student_item_perf)
MG5_SA_Diff<-Item_Type_Diff("math", "SA", MG5_student_item_perf)
MG5_SR_Diff<-Item_Type_Diff("math", "SR", MG5_student_item_perf)

MG5_GE_Diff<-Reporting_Cat_Diff("math", "Geometry", MG5_student_item_perf)
MG5_MD_Diff<-Reporting_Cat_Diff("math", "Measurement and Data", MG5_student_item_perf)
MG5_NF_Diff<-Reporting_Cat_Diff("math", "Number and Operations-Fractions", MG5_student_item_perf)
MG5_NT_Diff<-Reporting_Cat_Diff("math", "Number and Operations in Base Ten", MG5_student_item_perf)
MG5_OA_Diff<-Reporting_Cat_Diff("math", "Operations and Algebraic Thinking", MG5_student_item_perf)



MG5_MD_Loss<-Reporting_Cat_Loss("math", "Measurement and Data", MG5_student_item_perf)
#view(MG5_MD_Loss)
MG5Top_MD_Loss<-Reporting_Cat_Loss("math", "Measurement and Data", MG5_TopStudent_item_perf)
#view(MG5Top_MD_Loss)

MG5Top_MD_Diff<-Reporting_Cat_Diff("math", "Measurement and Data", MG5_TopStudent_item_perf)
#view(MG5Top_MD_Diff)

MG5Low_MD_Loss<-Reporting_Cat_Loss("math", "Measurement and Data", MG5_LowStudent_item_perf)
#view(MG5Low_MD_Loss)

MG5_NF_Loss<-Reporting_Cat_Loss("math", "Number and Operations-Fractions", MG5_student_item_perf)
#view(MG5_NF_Loss)
MG5Top_NF_Loss<-Reporting_Cat_Loss("math", "Number and Operations-Fractions", MG5_TopStudent_item_perf)
#view(MG5Top_NF_Loss)
MG5Top_NF_Diff<-Reporting_Cat_Diff("math", "Number and Operations-Fractions", MG5_TopStudent_item_perf)
#view(MG5Top_NF_Diff)

MG5Low_NF_Loss<-Reporting_Cat_Loss("math", "Number and Operations-Fractions", MG5_LowStudent_item_perf)
#view(MG5Low_NF_Loss)

MG5_NT_Loss<-Reporting_Cat_Loss("math", "Number and Operations in Base Ten", MG5_student_item_perf)
#view(MG5_NT_Loss)
MG5Top_NT_Loss<-Reporting_Cat_Loss("math", "Number and Operations in Base Ten", MG5_TopStudent_item_perf)
#view(MG5Top_NT_Loss)
MG5Top_NT_Diff<-Reporting_Cat_Diff("math", "Number and Operations in Base Ten", MG5_TopStudent_item_perf)
#view(MG5Top_NT_Diff)

MG5Low_NT_Loss<-Reporting_Cat_Loss("math", "Number and Operations in Base Ten", MG5_LowStudent_item_perf)
#view(MG5Low_NT_Loss)


MG5_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG5_student_item_perf)
#view(MG5_GE_Loss)

MG5Top_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG5_TopStudent_item_perf)
#view(MG5Top_GE_Loss)

MG5Low_GE_Loss<-Reporting_Cat_Loss("math", "Geometry", MG5_LowStudent_item_perf)
#view(MG5Low_GE_Loss)


MG5_OA_Loss<-Reporting_Cat_Loss("math", "Operations and Algebraic Thinking", MG5_student_item_perf)
#view(MG5_OA_Loss)

MG5Top_OA_Loss<-Reporting_Cat_Loss("math", "Operations and Algebraic Thinking", MG5_TopStudent_item_perf)
#view(MG5Top_OA_Loss)
MG5Top_OA_Diff<-Reporting_Cat_Diff("math", "Operations and Algebraic Thinking", MG5_TopStudent_item_perf)
#view(MG5Top_OA_Diff)

MG5Low_OA_Loss<-Reporting_Cat_Loss("math", "Operations and Algebraic Thinking", MG5_LowStudent_item_perf)
#view(MG5Low_OA_Loss)


##Create ELA  Data Frames--------------------------------------------------
##Read in ELA Cluster xWalk for all grades
ELA_cluster_xwalk<-read_ela_clusterXwalk("data/2023MCASItemXWalk.xlsx", "ELA_cluster_xwalk")
## Item Data Frames
#G10 ELA
EG10_item<-read_item("data/2023ELAItemResults.xlsx", "EG10", "ela")
EG10_xWalk<-read_item_xwalk("data/2023MCASItemXWalk.xlsx", "EG10_xwalk", "ela")
EG10_item<-Join_Item_Xwalk("ela", EG10_item, EG10_xWalk)
EG10_item<-Join_ELAItem_Cluster(EG10_item, ELA_cluster_xwalk)
#view(EG10_item)


EG10_reading_item <- EG10_item%>%
  filter(!str_detect(`Type`,"ES"))
#view(EG10_reading_item)
EG10_writing_item <- EG10_item%>%
  filter(str_detect(`Type`,"ES") & str_detect(`Reporting Category`, "-"))
#view(EG10_writing_item)

## EG10 Student Performance Data Frames
## ELA Data Frames
EG10_student_perf<-Student_Perf("ela", 10, student_itemDF)
EG10_student_item_perf<-Student_Item_Perf("ela", EG10_item, EG10_student_perf)
#view(EG10_student_item_perf)
EG10_student_essay_perf<-Student_Essay_Perf(10, student_itemDF, EG10_item)

EG10Top_student_essay_perf<-Student_Essay_Perf(10, student_itemDF, EG10_item)%>%
  filter(`escaleds`>=515)

EG10Mid_student_essay_perf<-Student_Essay_Perf(10, student_itemDF, EG10_item)%>%
  filter(`escaleds` <515)%>%
  filter(`escaleds` >= 500)

EG10Low_student_essay_perf<-Student_Essay_Perf(10, student_itemDF, EG10_item)%>%
  filter(`escaleds` < 500)

#view(EG10_student_item_perf)
EG10_student_reading_item_perf<-EG10_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))

EG10Top_student_reading_item_perf<-EG10_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` >= 515)

EG10Mid_student_reading_item_perf<-EG10_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 515)%>%
  filter(`escaleds` >= 500)

EG10Low_student_reading_item_perf<-EG10_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 500)

EG10_student_writing_item_perf<-EG10_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))

EG10Top_student_writing_item_perf<-EG10_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` >= 515)%>%
  filter(`escaleds` >= 500)

EG10Mid_student_writing_item_perf<-EG10_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 515)


EG10Low_student_writing_item_perf<-EG10_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 500)

#EG8 Item DF's
EG8_item<-read_item("data/2023ELAItemResults.xlsx", "EG8", "ela")
EG8_xWalk<-read_item_xwalk("data/2023MCASItemXWalk.xlsx", "EG8_xwalk",
                          "ela")
EG8_item<-Join_Item_Xwalk("ela", EG8_item, EG8_xWalk)
EG8_item<-Join_ELAItem_Cluster(EG8_item, ELA_cluster_xwalk)

EG8_reading_item <- EG8_item%>%
  filter(!str_detect(`Type`,"ES"))
#view(EG8_reading_item)
EG8_writing_item <- EG8_item%>%
  filter(str_detect(`Type`,"ES") & str_detect(`Reporting Category`, "-"))
#view(EG8_writing_item)

## EG8 Student Performance DF's

EG8_student_essay_perf<-Student_Essay_Perf(8, student_itemDF, EG8_item)

EG8Top_student_essay_perf<-Student_Essay_Perf(8, student_itemDF, EG8_item)%>%
  filter(`escaleds`>=515)

EG8Mid_student_essay_perf<-Student_Essay_Perf(8, student_itemDF, EG8_item)%>%
  filter(`escaleds` <515)%>%
  filter(`escaleds` >= 500)

EG8Low_student_essay_perf<-Student_Essay_Perf(8, student_itemDF, EG8_item)%>%
  filter(`escaleds` < 500)

#view(EG8_student_item_perf)
EG8_student_reading_item_perf<-EG8_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))

EG8Top_student_reading_item_perf<-EG8_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` >= 515)

EG8Mid_student_reading_item_perf<-EG8_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 515)%>%
  filter(`escaleds` >= 500)

EG8Low_student_reading_item_perf<-EG8_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 500)

EG8_student_writing_item_perf<-EG8_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))

EG8Top_student_writing_item_perf<-EG8_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` >= 515)%>%
  filter(`escaleds` >= 500)

EG8Mid_student_writing_item_perf<-EG8_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 515)


EG8Low_student_writing_item_perf<-EG8_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 500)
#view(EG8_item)
# EG8_item_summary<-EG8_item%>%
#   mutate(`RT Points Earned` = `item Possible Points`*`RT Percent Points`)%>%
#   mutate(`State Points Earned` = `item Possible Points`*`State Percent Points`)%>%
#   summarize(`Available Points` = sum(`item Possible Points`),
#             `State Total Points` = sum(`State Points Earned`),
#             `RT Total Points` = sum(`RT Points Earned`))%>%
#   mutate(`RT Percent Earned` = round(`RT Total Points`/`Available Points`*100))%>%
#   mutate(`State Percent Earned` = round(`State Total Points`/`Available Points`*100))%>%
#   mutate(`RT-State_Diff` = `RT Percent Earned`-`State Percent Earned`)
# view(EG8_item_summary)



#G7 ELA Item DF
EG7_item<-read_item("data/2023ELAItemResults.xlsx", "EG7", "ela")
EG7_xWalk<-read_item_xwalk("data/2023MCASItemXWalk.xlsx", "EG7_xwalk", 
                           "ela")
EG7_item<-Join_Item_Xwalk("ela", EG7_item, EG7_xWalk)
EG7_item<-Join_ELAItem_Cluster(EG7_item, ELA_cluster_xwalk)
EG7_reading_item <- EG7_item%>%
  filter(!str_detect(`Type`,"ES"))
#view(EG7_reading_item)
EG7_writing_item <- EG7_item%>%
  filter(str_detect(`Type`,"ES") & str_detect(`Reporting Category`, "-"))

#view(EG7_writing_item)
#view(EG7_item)
# EG7_item_summary<-EG7_item%>%
#   mutate(`RT Points Earned` = `item Possible Points`*`RT Percent Points`)%>%
#   mutate(`State Points Earned` = `item Possible Points`*`State Percent Points`)%>%
#   summarize(`Available Points` = sum(`item Possible Points`),
#             `State Total Points` = sum(`State Points Earned`),
#             `RT Total Points` = sum(`RT Points Earned`))%>%
#   mutate(`RT Percent Earned` = round(`RT Total Points`/`Available Points`*100))%>%
#   mutate(`State Percent Earned` = round(`State Total Points`/`Available Points`*100))%>%
#   mutate(`RT-State_Diff` = `RT Percent Earned`-`State Percent Earned`)
# view(EG7_item_summary)

## EG7 Student Performance DF's

EG7_student_perf<-Student_Perf("ela", 7, student_itemDF)
EG7_student_item_perf<-Student_Item_Perf("ela", EG7_item, EG7_student_perf)
#view(EG7_student_item_perf)

EG7_student_essay_perf<-Student_Essay_Perf(7, student_itemDF, EG7_item)

EG7Top_student_essay_perf<-Student_Essay_Perf(7, student_itemDF, EG7_item)%>%
  filter(`escaleds`>=515)

EG7Mid_student_essay_perf<-Student_Essay_Perf(7, student_itemDF, EG7_item)%>%
  filter(`escaleds` <515)%>%
  filter(`escaleds` >= 500)

EG7Low_student_essay_perf<-Student_Essay_Perf(7, student_itemDF, EG7_item)%>%
  filter(`escaleds` < 500)

#view(EG7_student_item_perf)
EG7_student_reading_item_perf<-EG7_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))

EG7Top_student_reading_item_perf<-EG7_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` >= 515)

EG7Mid_student_reading_item_perf<-EG7_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 515)%>%
  filter(`escaleds` >= 500)

EG7Low_student_reading_item_perf<-EG7_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 500)
  
EG7_student_writing_item_perf<-EG7_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))

EG7Top_student_writing_item_perf<-EG7_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` >= 515)%>%
  filter(`escaleds` >= 500)

EG7Mid_student_writing_item_perf<-EG7_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 515)


EG7Low_student_writing_item_perf<-EG7_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 500)


#G6 ELA Item DF
EG6_item<-read_item("data/2023ELAItemResults.xlsx", "EG6", "ela")
EG6_xWalk<-read_item_xwalk("data/2023MCASItemXWalk.xlsx", "EG6_xwalk", 
                           "ela")
EG6_item<-Join_Item_Xwalk("ela", EG6_item, EG6_xWalk)
EG6_item<-Join_ELAItem_Cluster(EG6_item, ELA_cluster_xwalk)
EG6_reading_item <- EG6_item%>%
  filter(!str_detect(`Type`,"ES"))
#view(EG6_reading_item)
EG6_writing_item <- EG6_item%>%
  filter(str_detect(`Type`,"ES") & str_detect(`Reporting Category`, "-"))

# EG6_item_summary<-EG6_item%>%
#   mutate(`RT Points Earned` = `item Possible Points`*`RT Percent Points`)%>%
#   mutate(`State Points Earned` = `item Possible Points`*`State Percent Points`)%>%
#   summarize(`Available Points` = sum(`item Possible Points`),
#             `State Total Points` = sum(`State Points Earned`),
#             `RT Total Points` = sum(`RT Points Earned`))%>%
#   mutate(`RT Percent Earned` = round(`RT Total Points`/`Available Points`*100))%>%
#   mutate(`State Percent Earned` = round(`State Total Points`/`Available Points`*100))%>%
#   mutate(`RT-State_Diff` = `RT Percent Earned`-`State Percent Earned`)
# view(EG6_item_summary)

## EG6 Student Performance DF's

EG6_student_essay_perf<-Student_Essay_Perf(6, student_itemDF, EG6_item)

EG6Top_student_essay_perf<-Student_Essay_Perf(6, student_itemDF, EG6_item)%>%
  filter(`escaleds`>=515)

EG6Mid_student_essay_perf<-Student_Essay_Perf(6, student_itemDF, EG6_item)%>%
  filter(`escaleds` <515)%>%
  filter(`escaleds` >= 500)

EG6Low_student_essay_perf<-Student_Essay_Perf(6, student_itemDF, EG6_item)%>%
  filter(`escaleds` < 500)

#view(EG6_student_item_perf)
EG6_student_reading_item_perf<-EG6_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))

EG6Top_student_reading_item_perf<-EG6_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` >= 515)

EG6Mid_student_reading_item_perf<-EG6_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 515)%>%
  filter(`escaleds` >= 500)

EG6Low_student_reading_item_perf<-EG6_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 500)

EG6_student_writing_item_perf<-EG6_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))

EG6Top_student_writing_item_perf<-EG6_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` >= 515)%>%
  filter(`escaleds` >= 500)

EG6Mid_student_writing_item_perf<-EG6_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 515)


EG6Low_student_writing_item_perf<-EG6_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 500)



#G5 ELA

#G5 ELA Item DF
EG5_item<-read_item("data/2023ELAItemResults.xlsx", "EG5", "ela")
EG5_xWalk<-read_item_xwalk("data/2023MCASItemXWalk.xlsx", "EG5_xwalk", 
                           "ela")
EG5_item<-Join_Item_Xwalk("ela", EG5_item, EG5_xWalk)
EG5_item<-Join_ELAItem_Cluster(EG5_item, ELA_cluster_xwalk)
EG5_reading_item <- EG5_item%>%
  filter(!str_detect(`Type`,"ES"))
#view(EG5_reading_item)
EG5_writing_item <- EG5_item%>%
  filter(str_detect(`Type`,"ES") & str_detect(`Reporting Category`, "-"))
#view(EG5_item)
# EG5_item_summary<-EG5_item%>%
#   mutate(`RT Points Earned` = `item Possible Points`*`RT Percent Points`)%>%
#   mutate(`State Points Earned` = `item Possible Points`*`State Percent Points`)%>%
#   summarize(`Available Points` = sum(`item Possible Points`),
#             `State Total Points` = sum(`State Points Earned`),
#             `RT Total Points` = sum(`RT Points Earned`))%>%
#   mutate(`RT Percent Earned` = round(`RT Total Points`/`Available Points`*100))%>%
#   mutate(`State Percent Earned` = round(`State Total Points`/`Available Points`*100))%>%
#   mutate(`RT-State_Diff` = `RT Percent Earned`-`State Percent Earned`)
# view(EG5_item_summary)

## EG5 Student Performance DF's

EG5_student_essay_perf<-Student_Essay_Perf(5, student_itemDF, EG5_item)

EG5Top_student_essay_perf<-Student_Essay_Perf(5, student_itemDF, EG5_item)%>%
  filter(`escaleds`>=515)

EG5Mid_student_essay_perf<-Student_Essay_Perf(5, student_itemDF, EG5_item)%>%
  filter(`escaleds` <515)%>%
  filter(`escaleds` >= 500)

EG5Low_student_essay_perf<-Student_Essay_Perf(5, student_itemDF, EG5_item)%>%
  filter(`escaleds` < 500)

#view(EG5_student_item_perf)
EG5_student_reading_item_perf<-EG5_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))

EG5Top_student_reading_item_perf<-EG5_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` >= 515)

EG5Mid_student_reading_item_perf<-EG5_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 515)%>%
  filter(`escaleds` >= 500)

EG5Low_student_reading_item_perf<-EG5_student_item_perf%>%
  filter(!str_detect(`Type`,"ES"))%>%
  filter(`escaleds` < 500)

EG5_student_writing_item_perf<-EG5_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))

EG5Top_student_writing_item_perf<-EG5_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` >= 515)%>%
  filter(`escaleds` >= 500)

EG5Mid_student_writing_item_perf<-EG5_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 515)


EG5Low_student_writing_item_perf<-EG5_student_item_perf%>%
  filter(str_detect(`Type`, "ES"))%>%
  filter(`escaleds` < 500)

## Exam Content/Performance: G5
# Exam Content: G5 ELA
#Reporting Categories: G5 ELA: 
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G5 ELA:
#"ES": Essay,  "SR": Selected Response

## G5 ELA Exam Content
EG5_ES_PTS<-Item_Type_Points("ES", EG5_item)
EG5_SR_PTS<-Item_Type_Points("SR", EG5_item)




EG5_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG5_item)
EG5_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG5_item)

## Writing language Points
EG5_ESLA_item<-EG5_item %>%
  filter(str_detect(eitem,"LA"))
EG5_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG5_ESLA_item)

## Reading Language Points
EG5_RELA_item<-EG5_item %>%
  filter(!str_detect(eitem,"LA"))
EG5_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG5_RELA_item)

# EG5 Domain Cluster Points
EG5_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG5_item)

EG5_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG5_item)

EG5_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG5_item)
EG5_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG5_item)
EG5_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG5_item)
EG5_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG5_item)
EG5_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG5_item)
EG5_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG5_item)

## EG5 Text Type and Quantity Points

EG5_FRead_PTS<-ELA_TextType_Points("Literature", EG5_reading_item)
EG5_NFRead_PTS<-ELA_TextType_Points("Informational", EG5_reading_item)
EG5_2TextRead_PTS<-ELA_NumText_Points("More than 1", EG5_reading_item)
EG5_1TextRead_PTS<-ELA_NumText_Points("1.0", EG5_reading_item)
EG5_FWrite_PTS<-ELA_TextType_Points("Literature", EG5_writing_item)
EG5_NFWrite_PTS<-ELA_TextType_Points("Informational", EG5_writing_item)
EG5_2TextWrite_PTS<-ELA_NumText_Points("More than 1", EG5_writing_item)
EG5_1TextWrite_PTS<-ELA_NumText_Points("1.0", EG5_writing_item)

## EG5 RT-State Diff
###RT-State Diff by Question Type
EG5_SR_Diff<-Item_Type_Diff("ela", "SR", EG5_student_item_perf)
EG5_ES_Diff<-Item_Type_Diff("ela", "ES", EG5_student_item_perf)

EG5_FRead_Diff<-ELA_TextType_Diff("Literature", EG5_student_reading_item_perf)
EG5_NFRead_Diff<-ELA_TextType_Diff("Informational", EG5_student_reading_item_perf)
EG5_FWrite_Diff<-ELA_TextType_Diff("Literature", EG5_student_writing_item_perf)
EG5_NFWrite_Diff<-ELA_TextType_Diff("Informational", EG5_student_writing_item_perf)
EG5_2TextRead_Diff<-ELA_NumText_Diff("More than 1", EG5_student_reading_item_perf)
EG5_1TextRead_Diff<-ELA_NumText_Diff("1.0", EG5_student_reading_item_perf)
EG5_2TextWrite_Diff<-ELA_NumText_Diff("More than 1", EG5_student_writing_item_perf)
EG5_1TextWrite_Diff<-ELA_NumText_Diff("1.0", EG5_student_writing_item_perf)

##RT-State Diff and %points Lost by LA and RE (need to separate WR LA and RE LA)
EG5_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG5_student_item_perf)
#view(EG5_LA_Diff)
EG5_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG5_student_item_perf)
#view(EG5_RE_Diff)
EG5_ESconv_Diff<-ELA_Subitem_Diff("conv", EG5_student_essay_perf)
#view(EG5_ESconv_Diff)
EG5_ESidea_Diff<-ELA_Subitem_Diff("idea", EG5_student_essay_perf)
#view(EG5_ESidea_Diff)
#EG5Top_ESconv_Diff<-ELA_Subitem_Diff("conv", EG5_TopStudent_essay_perf)
#view(EG5Top_ESconv_Diff)
#EG5Top_ESidea_Diff<-ELA_Subitem_Diff("idea", EG5_TopStudent_essay_perf)
#view(EG5Top_ESidea_Diff)

##EG5 Domain Cluster Diff
EG5_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG5_student_item_perf)
EG5_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG5_student_item_perf)
#view(EG5_CV_Diff)
EG5_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG5_student_item_perf)
#view(EG5_KD_Diff)
EG5_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG5_student_item_perf)
#view(EG5_KL_Diff)
EG5_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG5_student_item_perf)
#view(EG5_ID_Diff)
EG5_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG5_student_item_perf)
#view(EG5_IK_Diff)
EG5_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG5_student_item_perf)
#view(EG5_VA_Diff)
EG5_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG5_student_item_perf)

##EG5 Point Loss by Reporting Category, Text Type, and Domain Cluster
EG5_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG5_student_item_perf)
#view(EG5_LA_Loss)
EG5_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG5_student_item_perf)
#view(EG5_RE_Loss)
#EG5Top_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG5_TopStudent_item_perf)
# view(EG5Top_LA_Loss)
#EG5Top_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG5_TopStudent_item_perf)
# view(EG5Top_RE_Loss)

EG5_CS_Loss<-Practice_Cat_Loss("ela", "Craft and Structure", EG5_student_item_perf)
#view(EG5_CV_Loss)
EG5_CV_Loss<-Practice_Cat_Loss("ela", "Conventions", EG5_student_item_perf)
#view(EG5_CV_Loss)
EG5_KD_Loss<-Practice_Cat_Loss("ela", "Key Ideas and Details", EG5_student_item_perf)
#view(EG5_KD_Loss)
EG5_KL_Loss<-Practice_Cat_Loss("ela", "Knowledge of Language", EG5_student_item_perf)
#view(EG5_KL_Loss)
EG5_ID_Loss<-Practice_Cat_Loss("ela", "Idea Development", EG5_student_item_perf)
#view(EG5_ID_Loss)
EG5_IK_Loss<-Practice_Cat_Loss("ela", "Integration of Knowledge and Ideas", EG5_student_item_perf)
#view(EG5_IK_Loss)
EG5_VA_Loss<-Practice_Cat_Loss("ela", "Vocabulary Acquisition and Use", EG5_student_item_perf)
#view(EG5_VA_Loss)
EG5_WC_Loss<-Practice_Cat_Loss("ela", "Writing Combined (Conv/Idea Dev)", EG5_student_item_perf)

EG5_ESconv_Loss<-ELA_Subitem_Loss("conv", EG5_student_essay_perf)
#view(EG5_ESconv_Loss)
EG5_ESidea_Loss<-ELA_Subitem_Loss("idea", EG5_student_essay_perf)
#view(EG5_ESidea_Loss)
#EG5Top_ESconv_Loss<-ELA_Subitem_Loss("conv", EG5_TopStudent_essay_perf)
#view(EG5Top_ESconv_Loss)
#EG5Top_ESidea_Loss<-ELA_Subitem_Loss("idea", EG5_TopStudent_essay_perf)
#view(EG5Top_ESidea_Loss)

# Exam Content: G6 ELA
#Reporting Categories: G6 ELA: 
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G6 ELA:
#"ES": Essay,  "SR": Selected Response

## G6 ELA Exam Content
EG6_ES_PTS<-Item_Type_Points("ES", EG6_item)
EG6_SR_PTS<-Item_Type_Points("SR", EG6_item)




EG6_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG6_item)
EG6_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG6_item)

## Writing language Points
EG6_ESLA_item<-EG6_item %>%
  filter(str_detect(eitem,"LA"))
EG6_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG6_ESLA_item)

## Reading Language Points
EG6_RELA_item<-EG6_item %>%
  filter(!str_detect(eitem,"LA"))
EG6_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG6_RELA_item)

# EG6 Domain Cluster Points
EG6_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG6_item)

EG6_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG6_item)

EG6_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG6_item)
EG6_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG6_item)
EG6_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG6_item)
EG6_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG6_item)
EG6_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG6_item)
EG6_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG6_item)

## EG6 Text Type and Quantity Points

EG6_FRead_PTS<-ELA_TextType_Points("Literature", EG6_reading_item)
EG6_NFRead_PTS<-ELA_TextType_Points("Informational", EG6_reading_item)
EG6_2TextRead_PTS<-ELA_NumText_Points("More than 1", EG6_reading_item)
EG6_1TextRead_PTS<-ELA_NumText_Points("1.0", EG6_reading_item)
EG6_FWrite_PTS<-ELA_TextType_Points("Literature", EG6_writing_item)
EG6_NFWrite_PTS<-ELA_TextType_Points("Informational", EG6_writing_item)
EG6_2TextWrite_PTS<-ELA_NumText_Points("More than 1", EG6_writing_item)
EG6_1TextWrite_PTS<-ELA_NumText_Points("1.0", EG6_writing_item)

## EG6 RT-State Diff
###RT-State Diff by Question Type
EG6_SR_Diff<-Item_Type_Diff("ela", "SR", EG6_student_item_perf)
EG6_ES_Diff<-Item_Type_Diff("ela", "ES", EG6_student_item_perf)

EG6_FRead_Diff<-ELA_TextType_Diff("Literature", EG6_student_reading_item_perf)
EG6_NFRead_Diff<-ELA_TextType_Diff("Informational", EG6_student_reading_item_perf)
EG6_FWrite_Diff<-ELA_TextType_Diff("Literature", EG6_student_writing_item_perf)
EG6_NFWrite_Diff<-ELA_TextType_Diff("Informational", EG6_student_writing_item_perf)
EG6_2TextRead_Diff<-ELA_NumText_Diff("More than 1", EG6_student_reading_item_perf)
EG6_1TextRead_Diff<-ELA_NumText_Diff("1.0", EG6_student_reading_item_perf)
EG6_2TextWrite_Diff<-ELA_NumText_Diff("More than 1", EG6_student_writing_item_perf)
EG6_1TextWrite_Diff<-ELA_NumText_Diff("1.0", EG6_student_writing_item_perf)

##RT-State Diff and %points Lost by LA and RE (need to separate WR LA and RE LA)
EG6_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG6_student_item_perf)
#view(EG6_LA_Diff)
EG6_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG6_student_item_perf)
#view(EG6_RE_Diff)
EG6_ESconv_Diff<-ELA_Subitem_Diff("conv", EG6_student_essay_perf)
#view(EG6_ESconv_Diff)
EG6_ESidea_Diff<-ELA_Subitem_Diff("idea", EG6_student_essay_perf)
#view(EG6_ESidea_Diff)
#EG6Top_ESconv_Diff<-ELA_Subitem_Diff("conv", EG6_TopStudent_essay_perf)
#view(EG6Top_ESconv_Diff)
#EG6Top_ESidea_Diff<-ELA_Subitem_Diff("idea", EG6_TopStudent_essay_perf)
#view(EG6Top_ESidea_Diff)

##EG6 Domain Cluster Diff
EG6_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG6_student_item_perf)
EG6_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG6_student_item_perf)
#view(EG6_CV_Diff)
EG6_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG6_student_item_perf)
#view(EG6_KD_Diff)
EG6_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG6_student_item_perf)
#view(EG6_KL_Diff)
EG6_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG6_student_item_perf)
#view(EG6_ID_Diff)
EG6_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG6_student_item_perf)
#view(EG6_IK_Diff)
EG6_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG6_student_item_perf)
#view(EG6_VA_Diff)
EG6_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG6_student_item_perf)

##EG6 Point Loss by Reporting Category, Text Type, and Domain Cluster
EG6_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG6_student_item_perf)
#view(EG6_LA_Loss)
EG6_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG6_student_item_perf)
#view(EG6_RE_Loss)
#EG6Top_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG6_TopStudent_item_perf)
# view(EG6Top_LA_Loss)
#EG6Top_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG6_TopStudent_item_perf)
# view(EG6Top_RE_Loss)

EG6_CS_Loss<-Practice_Cat_Loss("ela", "Craft and Structure", EG6_student_item_perf)
#view(EG6_CV_Loss)
EG6_CV_Loss<-Practice_Cat_Loss("ela", "Conventions", EG6_student_item_perf)
#view(EG6_CV_Loss)
EG6_KD_Loss<-Practice_Cat_Loss("ela", "Key Ideas and Details", EG6_student_item_perf)
#view(EG6_KD_Loss)
EG6_KL_Loss<-Practice_Cat_Loss("ela", "Knowledge of Language", EG6_student_item_perf)
#view(EG6_KL_Loss)
EG6_ID_Loss<-Practice_Cat_Loss("ela", "Idea Development", EG6_student_item_perf)
#view(EG6_ID_Loss)
EG6_IK_Loss<-Practice_Cat_Loss("ela", "Integration of Knowledge and Ideas", EG6_student_item_perf)
#view(EG6_IK_Loss)
EG6_VA_Loss<-Practice_Cat_Loss("ela", "Vocabulary Acquisition and Use", EG6_student_item_perf)
#view(EG6_VA_Loss)
EG6_WC_Loss<-Practice_Cat_Loss("ela", "Writing Combined (Conv/Idea Dev)", EG6_student_item_perf)

EG6_ESconv_Loss<-ELA_Subitem_Loss("conv", EG6_student_essay_perf)
#view(EG6_ESconv_Loss)
EG6_ESidea_Loss<-ELA_Subitem_Loss("idea", EG6_student_essay_perf)
#view(EG6_ESidea_Loss)
#EG6Top_ESconv_Loss<-ELA_Subitem_Loss("conv", EG6_TopStudent_essay_perf)
#view(EG6Top_ESconv_Loss)
#EG6Top_ESidea_Loss<-ELA_Subitem_Loss("idea", EG6_TopStudent_essay_perf)
#view(EG6Top_ESidea_Loss)

# Exam Content: G7 ELA
#Reporting Categories: G7 ELA: 
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G7 ELA:
#"ES": Essay,  "SR": Selected Response

## G7 ELA Exam Content
EG7_ES_PTS<-Item_Type_Points("ES", EG7_item)
EG7_SR_PTS<-Item_Type_Points("SR", EG7_item)




EG7_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG7_item)
EG7_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG7_item)

## Writing language Points
EG7_ESLA_item<-EG7_item %>%
  filter(str_detect(eitem,"LA"))
EG7_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG7_ESLA_item)

## Reading Language Points
EG7_RELA_item<-EG7_item %>%
  filter(!str_detect(eitem,"LA"))
EG7_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG7_RELA_item)

# EG7 Domain Cluster Points
EG7_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG7_item)

EG7_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG7_item)

EG7_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG7_item)
EG7_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG7_item)
EG7_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG7_item)
EG7_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG7_item)
EG7_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG7_item)
EG7_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG7_item)

## EG7 Text Type and Quantity Points

EG7_FRead_PTS<-ELA_TextType_Points("Literature", EG7_reading_item)
EG7_NFRead_PTS<-ELA_TextType_Points("Informational", EG7_reading_item)
EG7_2TextRead_PTS<-ELA_NumText_Points("More than 1", EG7_reading_item)
EG7_1TextRead_PTS<-ELA_NumText_Points("1.0", EG7_reading_item)
EG7_FWrite_PTS<-ELA_TextType_Points("Literature", EG7_writing_item)
EG7_NFWrite_PTS<-ELA_TextType_Points("Informational", EG7_writing_item)
EG7_2TextWrite_PTS<-ELA_NumText_Points("More than 1", EG7_writing_item)
EG7_1TextWrite_PTS<-ELA_NumText_Points("1.0", EG7_writing_item)

## EG7 RT-State Diff
###RT-State Diff by Question Type
EG7_SR_Diff<-Item_Type_Diff("ela", "SR", EG7_student_item_perf)
EG7_ES_Diff<-Item_Type_Diff("ela", "ES", EG7_student_item_perf)

EG7_FRead_Diff<-ELA_TextType_Diff("Literature", EG7_student_reading_item_perf)
EG7_NFRead_Diff<-ELA_TextType_Diff("Informational", EG7_student_reading_item_perf)
EG7_FWrite_Diff<-ELA_TextType_Diff("Literature", EG7_student_writing_item_perf)
EG7_NFWrite_Diff<-ELA_TextType_Diff("Informational", EG7_student_writing_item_perf)
EG7_2TextRead_Diff<-ELA_NumText_Diff("More than 1", EG7_student_reading_item_perf)
EG7_1TextRead_Diff<-ELA_NumText_Diff("1.0", EG7_student_reading_item_perf)
EG7_2TextWrite_Diff<-ELA_NumText_Diff("More than 1", EG7_student_writing_item_perf)
EG7_1TextWrite_Diff<-ELA_NumText_Diff("1.0", EG7_student_writing_item_perf)

##RT-State Diff and %points Lost by LA and RE (need to separate WR LA and RE LA)
EG7_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG7_student_item_perf)
#view(EG7_LA_Diff)
EG7_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG7_student_item_perf)
#view(EG7_RE_Diff)
EG7_ESconv_Diff<-ELA_Subitem_Diff("conv", EG7_student_essay_perf)
#view(EG7_ESconv_Diff)
EG7_ESidea_Diff<-ELA_Subitem_Diff("idea", EG7_student_essay_perf)
#view(EG7_ESidea_Diff)
#EG7Top_ESconv_Diff<-ELA_Subitem_Diff("conv", EG7_TopStudent_essay_perf)
#view(EG7Top_ESconv_Diff)
#EG7Top_ESidea_Diff<-ELA_Subitem_Diff("idea", EG7_TopStudent_essay_perf)
#view(EG7Top_ESidea_Diff)

##EG7 Domain Cluster Diff
EG7_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG7_student_item_perf)
EG7_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG7_student_item_perf)
#view(EG7_CV_Diff)
EG7_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG7_student_item_perf)
#view(EG7_KD_Diff)
EG7_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG7_student_item_perf)
#view(EG7_KL_Diff)
EG7_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG7_student_item_perf)
#view(EG7_ID_Diff)
EG7_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG7_student_item_perf)
#view(EG7_IK_Diff)
EG7_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG7_student_item_perf)
#view(EG7_VA_Diff)
EG7_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG7_student_item_perf)

##EG7 Point Loss by Reporting Category, Text Type, and Domain Cluster
EG7_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG7_student_item_perf)
#view(EG7_LA_Loss)
EG7_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG7_student_item_perf)
#view(EG7_RE_Loss)
#EG7Top_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG7_TopStudent_item_perf)
# view(EG7Top_LA_Loss)
#EG7Top_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG7_TopStudent_item_perf)
# view(EG7Top_RE_Loss)

EG7_CS_Loss<-Practice_Cat_Loss("ela", "Craft and Structure", EG7_student_item_perf)
#view(EG7_CV_Loss)
EG7_CV_Loss<-Practice_Cat_Loss("ela", "Conventions", EG7_student_item_perf)
#view(EG7_CV_Loss)
EG7_KD_Loss<-Practice_Cat_Loss("ela", "Key Ideas and Details", EG7_student_item_perf)
#view(EG7_KD_Loss)
EG7_KL_Loss<-Practice_Cat_Loss("ela", "Knowledge of Language", EG7_student_item_perf)
#view(EG7_KL_Loss)
EG7_ID_Loss<-Practice_Cat_Loss("ela", "Idea Development", EG7_student_item_perf)
#view(EG7_ID_Loss)
EG7_IK_Loss<-Practice_Cat_Loss("ela", "Integration of Knowledge and Ideas", EG7_student_item_perf)
#view(EG7_IK_Loss)
EG7_VA_Loss<-Practice_Cat_Loss("ela", "Vocabulary Acquisition and Use", EG7_student_item_perf)
#view(EG7_VA_Loss)
EG7_WC_Loss<-Practice_Cat_Loss("ela", "Writing Combined (Conv/Idea Dev)", EG7_student_item_perf)

EG7_ESconv_Loss<-ELA_Subitem_Loss("conv", EG7_student_essay_perf)
#view(EG7_ESconv_Loss)
EG7_ESidea_Loss<-ELA_Subitem_Loss("idea", EG7_student_essay_perf)
#view(EG7_ESidea_Loss)
#EG7Top_ESconv_Loss<-ELA_Subitem_Loss("conv", EG7_TopStudent_essay_perf)
#view(EG7Top_ESconv_Loss)
#EG7Top_ESidea_Loss<-ELA_Subitem_Loss("idea", EG7_TopStudent_essay_perf)
#view(EG7Top_ESidea_Loss)


EG8_FRead_Loss<-ELA_TextType_Loss("Literature", EG8_student_reading_item_perf)
EG8_NFRead_Loss<-ELA_TextType_Loss("Informational", EG8_student_reading_item_perf)
EG8_FWrite_Loss<-ELA_TextType_Loss("Literature", EG8_student_writing_item_perf)
EG8_NFWrite_Loss<-ELA_TextType_Loss("Informational", EG8_student_writing_item_perf)
EG8_2TextRead_Loss<-ELA_NumText_Loss("More than 1", EG8_student_reading_item_perf)
EG8_1TextRead_Loss<-ELA_NumText_Loss("1.0", EG8_student_reading_item_perf)
EG8_2TextWrite_Loss<-ELA_NumText_Loss("More than 1", EG8_student_writing_item_perf)
EG8_1TextWrite_Loss<-ELA_NumText_Loss("1.0", EG8_student_writing_item_perf)


# Exam Content: G8 ELA
#Reporting Categories: G8 ELA: 
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G8 ELA:
#"ES": Essay,  "SR": Selected Response

## G8 ELA Exam Content
EG8_ES_PTS<-Item_Type_Points("ES", EG8_item)
EG8_SR_PTS<-Item_Type_Points("SR", EG8_item)




EG8_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG8_item)
EG8_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG8_item)

## Writing language Points
EG8_ESLA_item<-EG8_item %>%
  filter(str_detect(eitem,"LA"))
EG8_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG8_ESLA_item)

## Reading Language Points
EG8_RELA_item<-EG8_item %>%
  filter(!str_detect(eitem,"LA"))
EG8_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG8_RELA_item)

# EG8 Domain Cluster Points
EG8_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG8_item)

EG8_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG8_item)

EG8_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG8_item)
EG8_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG8_item)
EG8_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG8_item)
EG8_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG8_item)
EG8_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG8_item)
EG8_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG8_item)

## EG8 Text Type and Quantity Points

EG8_FRead_PTS<-ELA_TextType_Points("Literature", EG8_reading_item)
EG8_NFRead_PTS<-ELA_TextType_Points("Informational", EG8_reading_item)
EG8_2TextRead_PTS<-ELA_NumText_Points("More than 1", EG8_reading_item)
EG8_1TextRead_PTS<-ELA_NumText_Points("1.0", EG8_reading_item)
EG8_FWrite_PTS<-ELA_TextType_Points("Literature", EG8_writing_item)
EG8_NFWrite_PTS<-ELA_TextType_Points("Informational", EG8_writing_item)
EG8_2TextWrite_PTS<-ELA_NumText_Points("More than 1", EG8_writing_item)
EG8_1TextWrite_PTS<-ELA_NumText_Points("1.0", EG8_writing_item)

## EG8 RT-State Diff
###RT-State Diff by Question Type
EG8_SR_Diff<-Item_Type_Diff("ela", "SR", EG8_student_item_perf)
EG8_ES_Diff<-Item_Type_Diff("ela", "ES", EG8_student_item_perf)

EG8_FRead_Diff<-ELA_TextType_Diff("Literature", EG8_student_reading_item_perf)
EG8_NFRead_Diff<-ELA_TextType_Diff("Informational", EG8_student_reading_item_perf)
EG8_FWrite_Diff<-ELA_TextType_Diff("Literature", EG8_student_writing_item_perf)
EG8_NFWrite_Diff<-ELA_TextType_Diff("Informational", EG8_student_writing_item_perf)
EG8_2TextRead_Diff<-ELA_NumText_Diff("More than 1", EG8_student_reading_item_perf)
EG8_1TextRead_Diff<-ELA_NumText_Diff("1.0", EG8_student_reading_item_perf)
EG8_2TextWrite_Diff<-ELA_NumText_Diff("More than 1", EG8_student_writing_item_perf)
EG8_1TextWrite_Diff<-ELA_NumText_Diff("1.0", EG8_student_writing_item_perf)

##RT-State Diff and %points Lost by LA and RE (need to separate WR LA and RE LA)
EG8_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG8_student_item_perf)
#view(EG8_LA_Diff)
EG8_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG8_student_item_perf)
#view(EG8_RE_Diff)
EG8_ESconv_Diff<-ELA_Subitem_Diff("conv", EG8_student_essay_perf)
#view(EG8_ESconv_Diff)
EG8_ESidea_Diff<-ELA_Subitem_Diff("idea", EG8_student_essay_perf)
#view(EG8_ESidea_Diff)
#EG8Top_ESconv_Diff<-ELA_Subitem_Diff("conv", EG8_TopStudent_essay_perf)
#view(EG8Top_ESconv_Diff)
#EG8Top_ESidea_Diff<-ELA_Subitem_Diff("idea", EG8_TopStudent_essay_perf)
#view(EG8Top_ESidea_Diff)

##EG8 Domain Cluster Diff
EG8_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG8_student_item_perf)
EG8_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG8_student_item_perf)
#view(EG8_CV_Diff)
EG8_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG8_student_item_perf)
#view(EG8_KD_Diff)
EG8_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG8_student_item_perf)
#view(EG8_KL_Diff)
EG8_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG8_student_item_perf)
#view(EG8_ID_Diff)
EG8_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG8_student_item_perf)
#view(EG8_IK_Diff)
EG8_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG8_student_item_perf)
#view(EG8_VA_Diff)
EG8_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG8_student_item_perf)

##EG8 Point Loss by Reporting Category, Text Type, and Domain Cluster
EG8_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG8_student_item_perf)
#view(EG8_LA_Loss)
EG8_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG8_student_item_perf)
#view(EG8_RE_Loss)
#EG8Top_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG8_TopStudent_item_perf)
# view(EG8Top_LA_Loss)
#EG8Top_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG8_TopStudent_item_perf)
# view(EG8Top_RE_Loss)

EG8_CS_Loss<-Practice_Cat_Loss("ela", "Craft and Structure", EG8_student_item_perf)
#view(EG8_CV_Loss)
EG8_CV_Loss<-Practice_Cat_Loss("ela", "Conventions", EG8_student_item_perf)
#view(EG8_CV_Loss)
EG8_KD_Loss<-Practice_Cat_Loss("ela", "Key Ideas and Details", EG8_student_item_perf)
#view(EG8_KD_Loss)
EG8_KL_Loss<-Practice_Cat_Loss("ela", "Knowledge of Language", EG8_student_item_perf)
#view(EG8_KL_Loss)
EG8_ID_Loss<-Practice_Cat_Loss("ela", "Idea Development", EG8_student_item_perf)
#view(EG8_ID_Loss)
EG8_IK_Loss<-Practice_Cat_Loss("ela", "Integration of Knowledge and Ideas", EG8_student_item_perf)
#view(EG8_IK_Loss)
EG8_VA_Loss<-Practice_Cat_Loss("ela", "Vocabulary Acquisition and Use", EG8_student_item_perf)
#view(EG8_VA_Loss)
EG8_WC_Loss<-Practice_Cat_Loss("ela", "Writing Combined (Conv/Idea Dev)", EG8_student_item_perf)

EG8_ESconv_Loss<-ELA_Subitem_Loss("conv", EG8_student_essay_perf)
#view(EG8_ESconv_Loss)
EG8_ESidea_Loss<-ELA_Subitem_Loss("idea", EG8_student_essay_perf)
#view(EG8_ESidea_Loss)
#EG8Top_ESconv_Loss<-ELA_Subitem_Loss("conv", EG8_TopStudent_essay_perf)
#view(EG8Top_ESconv_Loss)
#EG8Top_ESidea_Loss<-ELA_Subitem_Loss("idea", EG8_TopStudent_essay_perf)
#view(EG8Top_ESidea_Loss)


EG8_FRead_Loss<-ELA_TextType_Loss("Literature", EG8_student_reading_item_perf)
EG8_NFRead_Loss<-ELA_TextType_Loss("Informational", EG8_student_reading_item_perf)
EG8_FWrite_Loss<-ELA_TextType_Loss("Literature", EG8_student_writing_item_perf)
EG8_NFWrite_Loss<-ELA_TextType_Loss("Informational", EG8_student_writing_item_perf)
EG8_2TextRead_Loss<-ELA_NumText_Loss("More than 1", EG8_student_reading_item_perf)
EG8_1TextRead_Loss<-ELA_NumText_Loss("1.0", EG8_student_reading_item_perf)
EG8_2TextWrite_Loss<-ELA_NumText_Loss("More than 1", EG8_student_writing_item_perf)
EG8_1TextWrite_Loss<-ELA_NumText_Loss("1.0", EG8_student_writing_item_perf)


## G10 ELA Exam Content
EG10_ES_PTS<-Item_Type_Points("ES", EG10_item)
EG10_SR_PTS<-Item_Type_Points("SR", EG10_item)




EG10_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG10_item)
EG10_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG10_item)

## Writing language Points
EG10_ESLA_item<-EG10_item %>%
  filter(str_detect(eitem,"LA"))
EG10_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG10_ESLA_item)

## Reading Language Points
EG10_RELA_item<-EG10_item %>%
  filter(!str_detect(eitem,"LA"))
EG10_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG10_RELA_item)

# EG10 Domain Cluster Points
EG10_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG10_item)

EG10_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG10_item)

EG10_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG10_item)
EG10_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG10_item)
EG10_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG10_item)
EG10_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG10_item)
EG10_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG10_item)
EG10_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG10_item)

## EG10 Text Type and Quantity Points

EG10_FRead_PTS<-ELA_TextType_Points("Literature", EG10_reading_item)
EG10_NFRead_PTS<-ELA_TextType_Points("Informational", EG10_reading_item)
EG10_2TextRead_PTS<-ELA_NumText_Points("More than 1", EG10_reading_item)
EG10_1TextRead_PTS<-ELA_NumText_Points("1.0", EG10_reading_item)
EG10_FWrite_PTS<-ELA_TextType_Points("Literature", EG10_writing_item)
EG10_NFWrite_PTS<-ELA_TextType_Points("Informational", EG10_writing_item)
EG10_2TextWrite_PTS<-ELA_NumText_Points("More than 1", EG10_writing_item)
EG10_1TextWrite_PTS<-ELA_NumText_Points("1.0", EG10_writing_item)

## EG10 RT-State Diff
###RT-State Diff by Question Type
EG10_SR_Diff<-Item_Type_Diff("ela", "SR", EG10_student_item_perf)
EG10_ES_Diff<-Item_Type_Diff("ela", "ES", EG10_student_item_perf)

EG10_FRead_Diff<-ELA_TextType_Diff("Literature", EG10_student_reading_item_perf)
EG10_NFRead_Diff<-ELA_TextType_Diff("Informational", EG10_student_reading_item_perf)
EG10_FWrite_Diff<-ELA_TextType_Diff("Literature", EG10_student_writing_item_perf)
EG10_NFWrite_Diff<-ELA_TextType_Diff("Informational", EG10_student_writing_item_perf)
EG10_2TextRead_Diff<-ELA_NumText_Diff("More than 1", EG10_student_reading_item_perf)
EG10_1TextRead_Diff<-ELA_NumText_Diff("1.0", EG10_student_reading_item_perf)
EG10_2TextWrite_Diff<-ELA_NumText_Diff("More than 1", EG10_student_writing_item_perf)
EG10_1TextWrite_Diff<-ELA_NumText_Diff("1.0", EG10_student_writing_item_perf)

##RT-State Diff and %points Lost by LA and RE (need to separate WR LA and RE LA)
EG10_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG10_student_item_perf)
#view(EG10_LA_Diff)
EG10_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG10_student_item_perf)
#view(EG10_RE_Diff)
EG10_ESconv_Diff<-ELA_Subitem_Diff("conv", EG10_student_essay_perf)
#view(EG10_ESconv_Diff)
EG10_ESidea_Diff<-ELA_Subitem_Diff("idea", EG10_student_essay_perf)
#view(EG10_ESidea_Diff)
#EG10Top_ESconv_Diff<-ELA_Subitem_Diff("conv", EG10_TopStudent_essay_perf)
#view(EG10Top_ESconv_Diff)
#EG10Top_ESidea_Diff<-ELA_Subitem_Diff("idea", EG10_TopStudent_essay_perf)
#view(EG10Top_ESidea_Diff)

##EG10 Domain Cluster Diff
EG10_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG10_student_item_perf)
EG10_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG10_student_item_perf)
#view(EG10_CV_Diff)
EG10_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG10_student_item_perf)
#view(EG10_KD_Diff)
EG10_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG10_student_item_perf)
#view(EG10_KL_Diff)
EG10_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG10_student_item_perf)
#view(EG10_ID_Diff)
EG10_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG10_student_item_perf)
#view(EG10_IK_Diff)
EG10_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG10_student_item_perf)
#view(EG10_VA_Diff)
EG10_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG10_student_item_perf)

##EG10 Point Loss by Reporting Category, Text Type, and Domain Cluster
EG10_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG10_student_item_perf)
#view(EG10_LA_Loss)
EG10_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG10_student_item_perf)
#view(EG10_RE_Loss)
#EG10Top_LA_Loss<-Reporting_Cat_Loss("ela", "LA", EG10_TopStudent_item_perf)
# view(EG10Top_LA_Loss)
#EG10Top_RE_Loss<-Reporting_Cat_Loss("ela", "RE", EG10_TopStudent_item_perf)
# view(EG10Top_RE_Loss)

EG10_CS_Loss<-Practice_Cat_Loss("ela", "Craft and Structure", EG10_student_item_perf)
#view(EG10_CV_Loss)
EG10_CV_Loss<-Practice_Cat_Loss("ela", "Conventions", EG10_student_item_perf)
#view(EG10_CV_Loss)
EG10_KD_Loss<-Practice_Cat_Loss("ela", "Key Ideas and Details", EG10_student_item_perf)
#view(EG10_KD_Loss)
EG10_KL_Loss<-Practice_Cat_Loss("ela", "Knowledge of Language", EG10_student_item_perf)
#view(EG10_KL_Loss)
EG10_ID_Loss<-Practice_Cat_Loss("ela", "Idea Development", EG10_student_item_perf)
#view(EG10_ID_Loss)
EG10_IK_Loss<-Practice_Cat_Loss("ela", "Integration of Knowledge and Ideas", EG10_student_item_perf)
#view(EG10_IK_Loss)
EG10_VA_Loss<-Practice_Cat_Loss("ela", "Vocabulary Acquisition and Use", EG10_student_item_perf)
#view(EG10_VA_Loss)
EG10_WC_Loss<-Practice_Cat_Loss("ela", "Writing Combined (Conv/Idea Dev)", EG10_student_item_perf)

EG10_ESconv_Loss<-ELA_Subitem_Loss("conv", EG10_student_essay_perf)
#view(EG10_ESconv_Loss)
EG10_ESidea_Loss<-ELA_Subitem_Loss("idea", EG10_student_essay_perf)
#view(EG10_ESidea_Loss)
#EG10Top_ESconv_Loss<-ELA_Subitem_Loss("conv", EG10_TopStudent_essay_perf)
#view(EG10Top_ESconv_Loss)
#EG10Top_ESidea_Loss<-ELA_Subitem_Loss("idea", EG10_TopStudent_essay_perf)
#view(EG10Top_ESidea_Loss)


EG10_FRead_Loss<-ELA_TextType_Loss("Literature", EG10_student_reading_item_perf)
EG10_NFRead_Loss<-ELA_TextType_Loss("Informational", EG10_student_reading_item_perf)
EG10_FWrite_Loss<-ELA_TextType_Loss("Literature", EG10_student_writing_item_perf)
EG10_NFWrite_Loss<-ELA_TextType_Loss("Informational", EG10_student_writing_item_perf)
EG10_2TextRead_Loss<-ELA_NumText_Loss("More than 1", EG10_student_reading_item_perf)
EG10_1TextRead_Loss<-ELA_NumText_Loss("1.0", EG10_student_reading_item_perf)
EG10_2TextWrite_Loss<-ELA_NumText_Loss("More than 1", EG10_student_writing_item_perf)
EG10_1TextWrite_Loss<-ELA_NumText_Loss("1.0", EG10_student_writing_item_perf)
