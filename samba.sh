#!/bin/bash
rm -f /etc/samba/smb.conf 
rm -rf /var/lib/samba
rm -rf /var/cache/samba 
mkdir -p /var/lib/samba/sysvol 
systemctl disable --now bind 
systemctl disable --now smb 
systemctl disable --now nmb
systemctl disable --now krb5kdc 
systemctl disable --now slapd 
samba-tool domain provision
cp /var/lib/samba/private/krb5.conf /etc/krb5.conf 
systemctl enable --now samba 
samba-tool group add IT 
samba-tool group add Sales
for i in (1..30};
do
samba-tool user add user$i.it P@ssword;
samba-tool user setexpiry user$i.it --noexpiry; 
samba-tool group addmembers "it" user$i.it;
done
for in {1..30};
do
samba-tool user add user$i.sales P@ssword;
samba-tool user setexpiry user$i.sales --noexpiry; 
samba-tool group addmembers "sales" user$i.sales;
done
