#!/bin/python3
import os
print(os.system("ifconfig | grep \"inet\""))

print(os.system("ifconfig"))
