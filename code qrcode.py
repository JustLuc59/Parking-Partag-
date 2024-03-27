import qrcode
import random
import string

longueur_chaine = 10
donnees_aleatoires = ''.join(random.choices(string.ascii_letters + string.digits, k=longueur_chaine))

qr = qrcode.QRCode(version=1,
                   error_correction=qrcode.constants.ERROR_CORRECT_L,
                   box_size=50,
                   border=1)
qr.add_data(donnees_aleatoires)
qr.make(fit=True)

img = qr.make_image(fill_color="black", back_color="white")
img.show()
