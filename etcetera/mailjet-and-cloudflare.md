# Mailjet and Cloudflare

register at [link](https://app.mailjet.com/)

generate creadential(API key and secret key) details and get SMTP server and port at [link](https://app.mailjet.com/account/relay)

manage domain and sender at [link](https://app.mailjet.com/account/sender)

at [link](https://app.mailjet.com/account/sender) click tab `SPF and DKIM authentication` to setup SPF and DKIM

get SPF detail and DomainKeys/DKIM detail then go to [Cloudflare](https://dash.cloudflare.com/) to add new DNS record for both SPF and DomainKeys/DKIM, refer [link](https://documentation.mailjet.com/hc/en-us/articles/360042412734-Authenticating-Domains-with-SPF-DKIM)

test SMTP server at [link](https://www.gmass.co/smtp-test)

**notes**: username is API key and password is secret key