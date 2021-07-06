# Built-in known hosts conflicts with known-hosts-with-dns
@unload protocols/conn/known-hosts

@load ./known-hosts-with-dns.zeek
