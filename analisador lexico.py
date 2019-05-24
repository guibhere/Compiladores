
# -*- coding: cp1252 -*-
import cv2
import numpy as np
import matplotlib.pyplot as plt
import csv
from sklearn.cluster import KMeans
import os
import pandas as pd


#Lendo do Banco de DADOS-----------------------------------------------
reader = csv.reader(open('tabelatoken.csv', 'rb'),delimiter=':')
lista = list(reader)
tabela = np.array(lista)
dados  = pd.read_csv('tabelatoken.csv',delimiter=':')
#-----------------------------------------------------------------------

#Printando os Pontos ---------------------------------------------------
#for i in(tabela):
# print i[0],i[1],i[2]
#----------------------------------------------------------------------- 

lista= dados['Lexema']
print lista
source = open('cod.txt', 'r')
#print source.read()

for linha in source:
    for ch in linha:
        if(ch in dados['Lexema']):
            print ch
        else:
            print "errou"
            #os.system('pause')
