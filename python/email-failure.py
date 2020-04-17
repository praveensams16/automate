from sys import argv
import smtplib
from email.mime.text import MIMEText
SMTP_SERVER = "smtp.mail.yahoo.com"
SMTP_PORT = 587
SMTP_USERNAME = "seera.reply@yahoo.com"
SMTP_PASSWORD = "ndjombvrkhojuzra"
EMAIL_FROM = "seera.reply@yahoo.com"
EMAIL_TO = "praveensam.sambath@seera.sa"
co_msg = open(argv[1],"r").readlines()
#co_msg = [ i.strip() for i in co_msg ]
body=" "
for i in co_msg:
    body=body + "\n" + i.strip() 
co_msg="Please find the job logs in below link" + "\n" + body
version=argv[2]
def send_email():
    msg = MIMEText(co_msg)
    msg['Subject'] = "Build Failed With Error: Version number({0})".format(version) 
    msg['From'] = EMAIL_FROM 
    msg['To'] = EMAIL_TO
    msg['CC'] = "rahil.shaikh@seera.sa,hussam.dehathim@seera.sa,abdulmalik.althari@seera.sa"
    debuglevel = True
    mail = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
    mail.set_debuglevel(debuglevel)
    mail.starttls()
    mail.login(SMTP_USERNAME, SMTP_PASSWORD)
    mail.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
    mail.quit()

if __name__=='__main__':
    send_email()
