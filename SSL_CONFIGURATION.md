# SSL Certificate Configuration

**Version:** v1.0  
**Last Updated:** October 15, 2025

## Certificate Details

| Attribute | Value |
|-----------|-------|
| **Provider** | Let's Encrypt |
| **Certificate Type** | Domain Validated (DV) |
| **Domain** | overleaf.myproject13.me |
| **Issue Date** | October 13, 2025 |
| **Expiration** | January 11, 2026 |
| **Renewal** | Automated (every 90 days) |

## Installation Steps

### 1. Install Certbot
```bash
sudo apt update
sudo apt install certbot python3-certbot-nginx -y
```

### 2. Install Nginx
```bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
```

### 3. Configure Nginx for Overleaf

Created configuration file: `/etc/nginx/sites-available/overleaf`
```nginx
server {
    listen 80;
    server_name overleaf.myproject13.me;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name overleaf.myproject13.me;

    ssl_certificate /etc/letsencrypt/live/overleaf.myproject13.me/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/overleaf.myproject13.me/privkey.pem;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### 4. Obtain SSL Certificate
```bash
sudo certbot --nginx -d overleaf.myproject13.me
```

### 5. Setup Auto-Renewal
```bash
# Certbot automatically creates cron job
sudo certbot renew --dry-run
```

## Verification
```bash
# Check certificate status
sudo certbot certificates

# Test HTTPS connection
curl -I https://overleaf.myproject13.me
```

## Certificate Location

- **Certificate:** `/etc/letsencrypt/live/overleaf.myproject13.me/fullchain.pem`
- **Private Key:** `/etc/letsencrypt/live/overleaf.myproject13.me/privkey.pem`
