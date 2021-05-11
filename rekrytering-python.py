#!/usr/bin/env python
# -*- coding: utf-8 -*-


# These are my projects
proj = ["red", "green", "blue"]

# Loop 
for p in projs:
    # Create direcory
    os.mkdir(p)
    # Change owner and group to bin
    os.chown(p,1,1)

#
# 1. For-loopen  ovan fungerar inte. Varför inte? Fixa felet.
#
#
# 2. Anropet till "os.mkdir" ovan fungerar inte. Varför inte? Fixa felet.
#
#
# 3. Anropet till "os.chown" fungerar inte. Går det att fixa i programmet?
#    Vad måste kan göra för att kunna lösa det?
#
