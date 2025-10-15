# Domain Configuration Documentation

**Version:** v1.0  
**Last Updated:** October 15, 2025

## Domain Information

| Attribute | Value |
|-----------|-------|
| **Domain Name** | myproject13.me |
| **Registrar** | Namecheap |
| **Cost** | Free (1 year via GitHub Student Pack) |
| **Registration Date** | October 12, 2025 |
| **Expiration Date** | October 12, 2026 |

## DNS Configuration

| Record Type | Host | Value | TTL |
|-------------|------|-------|-----|
| A | @ | 167.71.174.115 | Automatic |
| A | overleaf | 167.71.174.115 | Automatic |

## Setup Steps

1. Applied for GitHub Student Developer Pack at education.github.com/pack
2. Verified student status with Stevens email (ssonare@stevens.edu)
3. Selected Namecheap free domain offer
4. Registered myproject13.me domain
5. Configured DNS A records
6. Verified DNS propagation

## Verification
```bash
# Check DNS resolution
nslookup overleaf.myproject13.me

# Expected output: 167.71.174.115
```

## Access URLs

- **Overleaf Instance:** https://overleaf.myproject13.me
- **Root Domain:** https://myproject13.me
