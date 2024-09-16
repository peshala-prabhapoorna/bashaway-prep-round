import smtplib

from_addr = "tech.baron@bashaway2k23.net"
to_addrs  = "inventor@bashaway2k23.net"
body = "Technology knows no bounds.^D"

# Add the From: and To: headers at the start!
lines = [f"From: {from_addr}", f"To: {to_addrs}", "", body]

msg = "\r\n".join(lines)

server = smtplib.SMTP("localhost", port="2525")
server.set_debuglevel(1)
server.sendmail(from_addr, to_addrs, msg)
server.quit()
