import time
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, Integer

# Création de la base de données
Base = declarative_base()

# Définition de la classe représentant la table "Ecoute"
class Ecoute(Base):
    __tablename__ = 'Ecoute'
    id = Column(Integer, primary_key=True)
    barriere = Column(Integer)

# Fonction pour écouter les changements dans la base de données
def listen_for_changes():
    # Connexion à la base de données
    engine = create_engine('mysql+pymysql://admin:tssnadmin@192.168.60.249/Projet')  
    # Assurez-vous que vous avez installé la bibliothèque pymysql avec 'pip install pymysql'
    Session = sessionmaker(bind=engine)
    
    while True:
        session = Session()
        # Récupération de la valeur de la colonne "barriere" où l'id est 1
        barriere_value = session.query(Ecoute.barriere).filter_by(id=1).scalar()
        
        # Si la valeur est b'\x01', attendre 10 secondes et la changer en b'\x00'
        if barriere_value == b'\x01':
            print("La valeur de 'barriere' pour l'id 1 est b'\x01'. Attente de 10 secondes...")
            time.sleep(20)
            # Mettre la valeur à b'\x00'
            session.query(Ecoute).filter_by(id=1).update({"barriere": 0})
            session.commit()
            print("La valeur de 'barriere' pour l'id 1 a été changée en b'\x00'.")
        else:
            print("La valeur de 'barriere' pour l'id 1 est :", barriere_value)
        
        session.close()
        
        time.sleep(5)  # Attendre 5 secondes avant de vérifier à nouveau

if __name__ == "__main__":
    listen_for_changes()
