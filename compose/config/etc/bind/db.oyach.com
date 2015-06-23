;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	oyach.com. root.localhost. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	oyach.com.
@	IN	A	172.17.0.43

123.oyach.com.	IN	A	192.168.0.2
nexus.oyach.com. IN	A	192.168.0.3
git.oyach.com.	IN	A	192.168.0.4
ci.oyach.com.	IN 	A	192.168.0.5