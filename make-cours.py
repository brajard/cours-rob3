# -*- coding= latin-1 -*-
import shutil
import os
from os.path import join,exists
cours = dict()
cours[0] = {'date':'18 Septembre 2017',
            'titrelong':"Présentation du cours d'informatique MAIN3/ROB3",
            'titrecourt':'Informatique',
            'flist':['intro2017'],
            'output':'intro'}
cours[1] = {'date':'18 Septembre 2017',
            'titrelong':'Algorithmes de base',
            'titrecourt':'cours n°1',
            'flist':['algorithmes'],
            'output':'cours-1'}

cours[2] = {'date':'25 Septembre 2017',
            'titrelong':'Introduction au langage C',
            'titrecourt':'cours n°2',
            'flist':['langageC', 'commentaires', 'variables', 'operateurs', 'forif', 'conversions'],
            'output':'cours-2'}

cours[3] = {'date':'02 Octobre 2017',
            'titrelong':'Les tableaux',
            'titrecourt':'cours n°3',
            'flist':['tableaux'],
            'output':'cours-3'}

cours[4] = {'date':'09 Octobre 2017',
            'titrelong':'Les fonctions',
            'titrecourt':'cours n°4',
            'flist':['fonctions', 'parametres', 'tabfonc', 'recurs', 'stdfonc','turing'],
            'output':'cours-4'}


cours[5] = {'date':'16 Octobre 2017',
            'titrelong':'Les pointeurs',
            'titrecourt':'cours n°5',
            'flist':['io', 'string', 'point-add', 'point-tab', 'point-param'],
            'output':'cours-5'}

cours[6] = {'date':'23 Octobre 2017',
            'titrelong':'Les structures',
            'titrecourt':'cours n°6',
            'flist':['struct', 'struct-other', 'struct-list'],
            'output':'cours-6'}

cours[7] = {'date':'6 Novembre 2017',
            'titrelong':'Compilation',
            'titrecourt':'cours n°7',
            'flist':['mainparam', 'compilation', 'modulaire', 'makefile', 'fichiers'],
            'output':'cours-7'}

cours[8] = {'date':'13 Novembre 2017',
            'titrelong':'Débuggage/sujets avancés-1',
            'titrecourt':'cours n°8',
            'flist':['debug', 'nombres', 'perceptron'],
            'output':'cours-8'}

cours[9] = {'date':'20 Novembre 2017',
            'titrelong':'Sujets avancés-2',
            'titrecourt':'cours n°8',
            'flist':['astar', 'minimax'],
            'output':'cours-9'}


#CONSTANTES
WORKDIR = '.'
HEADER = 'header.tex'
TITLE="""
\\begin{frame}
\\titlepage
\\centering{
\\url{https://moodle-sciences.upmc.fr} (cours Informatique Générale MAIN-ROB)}
\\end{frame}
"""
TOC="""
\\begin{frame}
\\frametitle{Plan du cours}
\\tableofcontents[hideallsubsections]
\\end{frame}
"""

ic = 9

c = cours[ic]

#copier header
target = join(WORKDIR,c['output']+'.tex')
print(target)
if exists(target):
    os.remove(target)
shutil.copyfile(join(WORKDIR,HEADER),target)

# ajouter ce qu'il faut
with open(target,mode='a',encoding='ISO-8859-1') as f:
    f.write('\\newcommand{\\nb}{'+str(ic)+'}\n')
    f.write('\\title['+c['titrecourt']+']{' + c['titrelong'] +'}\n')
    f.write('\\author[]{julien.brajard@upmc.fr}\n')
    f.write("\\institute[Polytech'UPMC]{Polytech'UPMC}\n")
    f.write('\\date{'+c['date']+'}\n')
    f.write('\\begin{document}\n')
    f.write(TITLE)
    if len(c['flist'])>1:
        f.write(TOC)
    for theme in c['flist']:
        f.write('\\input{'+theme+'}\n')
    f.write('\end{document}')
    dependancy = ' '.join([f+'.tex' for f in c['flist']])
    print(dependancy)
# régler paramètres du makefile
args = 'cours="' + c['output'] +'" dependancy="' + dependancy + '"'
print(args)

# lancer le makefile
os.system('make '+ args)
