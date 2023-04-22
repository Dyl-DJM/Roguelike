CC=gcc 
CFLAGS= -Wall -ansi -pedantic
LDFLAG=-lMLV

EXEC= rogue_like
OBJS= $(OBJ_DIR)/main.o  $(OBJ_DIR)/clic.o $(OBJ_DIR)/jeu.o $(OBJ_DIR)/perso.o $(OBJ_DIR)/terrain.o $(OBJ_DIR)/potion.o $(OBJ_DIR)/monstre.o $(OBJ_DIR)/graphique.o $(OBJ_DIR)/msg.o $(OBJ_DIR)/objet.o $(OBJ_DIR)/sauvegarde.o $(OBJ_DIR)/tresor.o $(OBJ_DIR)/equipement.o $(OBJ_DIR)/musique.o $(OBJ_DIR)/distribution_pts.o  $(OBJ_DIR)/affiche_attribut.o  $(OBJ_DIR)/manip_inventaire.o $(OBJ_DIR)/fouille_tresor.o $(OBJ_DIR)/taille.o  

OBJ_DIR=obj
SRC_DIR=src
INC_DIR=inc

all: $(EXEC)

$(EXEC): $(OBJS) 
	$(CC) -o $@ $^ $(LDFLAG)

$(OBJ_DIR)/main.o :   $(INC_DIR)/jeu.h $(INC_DIR)/taille.h $(INC_DIR)/fouille_tresor.h $(INC_DIR)/terrain.h $(INC_DIR)/perso.h $(INC_DIR)/sauvegarde.h $(INC_DIR)/monstre.h $(INC_DIR)/msg.h $(INC_DIR)/graphique.h $(INC_DIR)/distribution_pts.h $(INC_DIR)/affiche_attribut.h $(INC_DIR)/manip_inventaire.h


$(OBJ_DIR)/jeu.o : $(INC_DIR)/jeu.h 
$(OBJ_DIR)/clic.o : $(INC_DIR)/clic.h
$(OBJ_DIR)/equipement.o : $(INC_DIR)/equipement.h 
$(OBJ_DIR)/monstre.o : $(INC_DIR)/monstre.h 
$(OBJ_DIR)/graphique.o :  $(INC_DIR)/taille.h $(INC_DIR)/distribution_pts.h $(INC_DIR)/manip_inventaire.h $(INC_DIR)/graphique.h $(INC_DIR)/potion.h $(INC_DIR)/perso.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/coordonnees.h $(INC_DIR)/clic.h
$(OBJ_DIR)/msg.o : $(INC_DIR)/msg.h
$(OBJ_DIR)/coordonnees.o : $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/potion.o : $(INC_DIR)/potion.h
$(OBJ_DIR)/perso.o : $(INC_DIR)/perso.h $(INC_DIR)/equipement.h $(INC_DIR)/potion.h $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/sauvegarde.o : $(INC_DIR)/taille.h $(INC_DIR)/sauvegarde.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/perso.h $(INC_DIR)/monstre.h  
$(OBJ_DIR)/terrain.o : $(INC_DIR)/tresor.h $(INC_DIR)/perso.h $(INC_DIR)/monstre.h $(INC_DIR)/terrain.h 
$(OBJ_DIR)/tresor.o : $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/potion.h $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/objet.o : $(INC_DIR)/objet.h 
$(OBJ_DIR)/musique.o : $(INC_DIR)/musique.h 
$(OBJ_DIR)/taille.o : $(INC_DIR)/taille.h 
$(OBJ_DIR)/distribution_pts.o : $(INC_DIR)/taille.h $(INC_DIR)/distribution_pts.h $(INC_DIR)/potion.h $(INC_DIR)/perso.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/affiche_attribut.o :  $(INC_DIR)/taille.h $(INC_DIR)/affiche_attribut.h $(INC_DIR)/graphique.h $(INC_DIR)/potion.h $(INC_DIR)/perso.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/manip_inventaire.o :  $(INC_DIR)/taille.h $(INC_DIR)/manip_inventaire.h $(INC_DIR)/potion.h $(INC_DIR)/perso.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/coordonnees.h
$(OBJ_DIR)/fouille_tresor.o :   $(INC_DIR)/taille.h $(INC_DIR)/fouille_tresor.h $(INC_DIR)/graphique.h $(INC_DIR)/potion.h $(INC_DIR)/perso.h $(INC_DIR)/terrain.h $(INC_DIR)/tresor.h $(INC_DIR)/equipement.h $(INC_DIR)/coordonnees.h


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	rm -f $(OBJ_DIR)/*.o $(EXEC)

mrproper: clean
	rm -f $(EXEC)
