#!/usr/bin/env python                                                                                                                     
# -*- coding: utf-8 -*-                                                                                                                   

# Add one to the number and return the value                                                                                              
def addone(number):
    a = number + 1

# These are my projects                                                                                                                   
proj = ["red", "green", "blue"]

# Loop over the projects and create a directory for each. Print progress.                                                                 
n = 1
for p in projs:
    # Create direcory                                                                                                                     
    os.mkdir(p)
    # Change owner and group to bin                                                                                                       
    os.chown(p,1,1)
    # print the number of directories that has ben created                                                                                
    print "Directory number ", n," created with name ", p
    # add one to the number of directories created                                                                                        
    addone(n)

#                                                                                                                                         
# 1. For-loopen  ovan fungerar inte. Varför inte? Fixa felet.                                                                             
#                                                                                                                                         
# 2. Anropet till "os.mkdir" ovan fungerar inte. Varför inte? Fixa felet.                                                                 
#                                                                                                                                         
# 3. Anropet till "os.chown" fungerar inte. Går det att fixa i programmet?                                                                
#    Vad måste kan göra för att kunna lösa det?                                                                                           
#                                                                                                                                         
# 4. Raden som skriver ut nummer av kataloger fungerar inte. Fixa.                                                                        
#                                                                                                                                         
# 5. Funtionen som ska lägga till 1 till en variabel fungerar inte. Varför? Fixa.                                                         
#                 
