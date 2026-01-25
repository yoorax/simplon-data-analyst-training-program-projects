import sqlite3, smtplib, os
from email.message import EmailMessage

# 1. Load credentials from the .env file
CREDS = {}
with open("app_password.env") as f:
    for line in f:
        if "=" in line:
            key, val = line.split("=")
            CREDS[key.strip()] = val.strip()

MY_EMAIL = CREDS.get("email")
APP_PASS = CREDS.get("password")

def send_emails():
    if not MY_EMAIL or not APP_PASS:
        print("Error: Email or password missing in .env file.")
        return

    # 2. Find ONLY late books (date has passed and not returned)
    with sqlite3.connect('bibliotheque.db') as DB_connector:
        cursor = DB_connector.cursor()
        query_late_returns = """
            SELECT er.prenom, er.nom, er.email, l.titre, et.date_retour_prevue
            FROM emprunts et
            JOIN emprunteurs er ON et.emprunteur_id = er.emprunteur_id
            JOIN livres l ON et.livre_id = l.livre_id
            WHERE et.date_retour_effective IS NULL 
            AND et.date_retour_prevue < date('now')
        """
        cursor.execute(query_late_returns)
        late_returns = cursor.fetchall()

    if not late_returns:
        print("Everything is on time! No late books found.")
        return

    # 3. Send emails
    try:
        with smtplib.SMTP("smtp.office365.com", 587) as server:
            server.starttls()
            server.login(MY_EMAIL, APP_PASS)

            for prenom, nom, email, titre, date in late_returns:
                if not email:
                    print(f"No email found for {prenom} {nom}")
                    continue

                msg = EmailMessage()
                msg['Subject'] = f"Overdue Book: '{titre}'"
                msg['From'] = MY_EMAIL
                msg['To'] = email
                msg.set_content(f"""Hi {prenom} {nom},

Your book '{titre}' was due on {date}.

You are past your return date. Please bring it back soon!""")

                server.send_message(msg)
                print(f"Late notice sent to {prenom} {nom}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    send_emails()
