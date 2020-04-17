from sys import argv
import smtplib
from email.mime.text import MIMEText
SMTP_SERVER = "smtp.mail.yahoo.com"
SMTP_PORT = 587
SMTP_USERNAME = "seera.reply@yahoo.com"
SMTP_PASSWORD = "ndjombvrkhojuzra"
EMAIL_FROM = "seera.reply@yahoo.com"
EMAIL_TO = "praveensam.sambath@seera.sa"

def send_email(a,b):
    EMAIL_SUBJECT = "{0}".format(a)
    co_msg = "{0}".format(b)
    msg = MIMEText(co_msg)
    msg['Subject'] = EMAIL_SUBJECT
    msg['From'] = EMAIL_FROM 
    msg['To'] = EMAIL_TO
    debuglevel = True
    mail = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
    mail.set_debuglevel(debuglevel)
    mail.starttls()
    mail.login(SMTP_USERNAME, SMTP_PASSWORD)
    mail.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
    mail.quit()

if __name__=='__main__':
    send_email()
